// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/postingan.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: Center(
        child: Container(
          child: ListView(
            padding: EdgeInsets.all(20.0),
            children: <Widget>[
              Postingan(
                judul: "Ditemukan Tupperware",
                desc: "ditemukan di bawah meja kelas 10",
                img_url:
                    'https://static.republika.co.id/uploads/images/inpicture_slide/019583200-1591351351-tupperware_141302_bigjpg.jpg',
              ),
              Postingan(
                judul: "Ditemukan Tupperware",
                desc: "ditemukan di bawah meja kelas 10",
                img_url:
                    'https://static.republika.co.id/uploads/images/inpicture_slide/019583200-1591351351-tupperware_141302_bigjpg.jpg',
              ),
              Postingan(
                judul: "Ditemukan Tupperware",
                desc: "ditemukan di bawah meja kelas 10",
                img_url:
                    'https://static.republika.co.id/uploads/images/inpicture_slide/019583200-1591351351-tupperware_141302_bigjpg.jpg',
              ),
              Postingan(
                judul: "Ditemukan Tupperware",
                desc: "ditemukan di bawah meja kelas 10",
                img_url:
                    'https://static.republika.co.id/uploads/images/inpicture_slide/019583200-1591351351-tupperware_141302_bigjpg.jpg',
              ),
              Postingan(
                judul: "Ditemukan Tupperware",
                desc: "ditemukan di bawah meja kelas 10",
                img_url:
                    'https://static.republika.co.id/uploads/images/inpicture_slide/019583200-1591351351-tupperware_141302_bigjpg.jpg',
              )
            ],
          ),
        ),
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
        ],
        onTabChangedListener: (index) {
          // setState(() {
          //   currentPage = index;
          // });
        },
      ),
    );
  }
}
