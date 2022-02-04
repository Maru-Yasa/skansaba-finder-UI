// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/postingan.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

class BarangHilangScreen extends StatefulWidget {
  BarangHilangScreen({Key? key}) : super(key: key);

  @override
  _BarangHilangScreenState createState() => _BarangHilangScreenState();
}

class _BarangHilangScreenState extends State<BarangHilangScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
