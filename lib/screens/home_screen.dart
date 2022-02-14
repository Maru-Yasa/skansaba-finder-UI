import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skansaba_finder/models/barang_model.dart';
import 'package:skansaba_finder/providers/auth.dart';
import 'package:skansaba_finder/providers/barang.dart';
import 'package:skansaba_finder/screens/barang_hilang_screen.dart';
import 'package:skansaba_finder/screens/laporan_kehilangan_screen.dart';
import 'package:skansaba_finder/screens/login_screen.dart';
import 'package:skansaba_finder/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLogin = false;
  bool isLoading = false;
  List<BarangModel> barang_all = [];
  int currentPage = 0;

  @override
  void didChangeDependencies() {
    setState(() {
      isLoading = true;
    });
    Auth auth = Provider.of<Auth>(context);
    auth.isLogin.then((value) {
      print("is login : " + value.toString());
      if (value) {
        setState(() {
          isLogin = true;
          isLoading = false;
        });
      } else {
        Future.delayed(Duration.zero, () {
          Navigator.pushNamedAndRemoveUntil(
              context, LoginScreen.routeName, (route) => false);
        });
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var pages = <Widget>[
      BarangHilangScreen(),
      const LaporanKehilanganScreen(),
      ProfileScreen()
    ];
    // return
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
      body:
          (isLoading) ? const CircularProgressIndicator() : pages[currentPage],
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
