// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skansaba_finder/providers/auth.dart';
import '../components/postingan.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import './laporan_kehilangan_screen.dart';
import './barang_hilang_screen.dart';
import './profile_screen.dart';
import './login_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:provider/provider.dart';

var pages = <Widget>[
  BarangHilangScreen(),
  LaporanKehilanganScreen(),
  ProfileScreen()
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  Widget? _page;

  Future<dynamic>? _checkAuth() async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString("token"));
    Provider.of<Auth>(context, listen: false).isLogin.then((value) {
      if (value) {
        return prefs.getString("token");
      } else {
        return throw Exception("Not Auth");
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          child: Image.asset('images/logo.png'),
          padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
        ),
        title: Text(
          "Skansaba Finder",
          style: GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _checkAuth(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              Future.delayed(Duration.zero, () {
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.routeName, (route) => false);
              });
              // WidgetsBinding.instance!.addPostFrameCallback((_) {});
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return pages[currentPage];
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: FancyBottomNavigation(
        barBackgroundColor: Colors.blue,
        textColor: Colors.white,
        circleColor: Colors.white,
        activeIconColor: Colors.blue,
        inactiveIconColor: Colors.white,
        tabs: [
          TabData(
            iconData: Icons.search,
            title: 'Barang Ditemukan',
          ),
          TabData(
            iconData: Icons.list_alt,
            title: 'Laporan Kehilangan',
          ),
          TabData(
            iconData: Icons.person,
            title: 'Profile',
          ),
        ],
        onTabChangedListener: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }
}
