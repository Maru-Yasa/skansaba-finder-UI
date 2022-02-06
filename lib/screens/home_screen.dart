// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/postingan.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import './laporan_kehilangan_screen.dart';
import './barang_hilang_screen.dart';
import './profile_screen.dart';
import './login_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

var page = <Widget>[
  BarangHilangScreen(),
  LaporanKehilanganScreen(),
  ProfileScreen()
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _launcher(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final bool isLogin = prefs.getBool('isLogin') ?? false;
    return isLogin
        ? page[index]
        : Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (route) => false);
  }

  int currentPage = 0;
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
            textStyle: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
      body: _launcher(currentPage),
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
