// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skansaba_finder/models/barang_model.dart';
import 'package:skansaba_finder/providers/barang.dart';
import '../components/postingan.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

class BarangHilangScreen extends StatefulWidget {
  BarangHilangScreen({
    Key? key,
  }) : super(key: key);

  @override
  _BarangHilangScreenState createState() => _BarangHilangScreenState();
}

class _BarangHilangScreenState extends State<BarangHilangScreen> {
  int currentPage = 0;
  bool is_loading = false;
  List<BarangModel> barang_all = [];

  @override
  void didChangeDependencies() {
    is_loading = true;
    setState(() {
      Provider.of<BarangProvider>(context).barang_all.then((value) {
        barang_all = value;
        print(barang_all[0].nama);
      });
      is_loading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: is_loading
            ? Text("belum")
            : ListView.builder(
                itemCount: barang_all.length,
                itemBuilder: (context, index) {
                  return Text("test");
                  // return Postingan(
                  //   judul: barang_all[index].nama ?? "none",
                  //   desc: barang_all[index].keterangan ?? "none",
                  //   img_url:
                  //       'https://static.republika.co.id/uploads/images/inpicture_slide/019583200-1591351351-tupperware_141302_bigjpg.jpg',
                  // );
                },
              ),
      ),
    );
  }
}

// ListView(
//           padding: EdgeInsets.all(20.0),
//           children: <Widget>[
//             Postingan(
//               judul: "Ditemukan Tupperware",
//               desc: "ditemukan di bawah meja kelas 10",

//             ),
//             Postingan(
//               judul: "Ditemukan Tupperware",
//               desc: "ditemukan di bawah meja kelas 10",
//               img_url:
//                   'https://static.republika.co.id/uploads/images/inpicture_slide/019583200-1591351351-tupperware_141302_bigjpg.jpg',
//             ),
//             Postingan(
//               judul: "Ditemukan Tupperware",
//               desc: "ditemukan di bawah meja kelas 10",
//               img_url:
//                   'https://static.republika.co.id/uploads/images/inpicture_slide/019583200-1591351351-tupperware_141302_bigjpg.jpg',
//             ),
//             Postingan(
//               judul: "Ditemukan Tupperware",
//               desc: "ditemukan di bawah meja kelas 10",
//               img_url:
//                   'https://static.republika.co.id/uploads/images/inpicture_slide/019583200-1591351351-tupperware_141302_bigjpg.jpg',
//             ),
//             Postingan(
//               judul: "Ditemukan Tupperware",
//               desc: "ditemukan di bawah meja kelas 10",
//               img_url:
//                   'https://static.republika.co.id/uploads/images/inpicture_slide/019583200-1591351351-tupperware_141302_bigjpg.jpg',
//             )
//           ],
//         ),