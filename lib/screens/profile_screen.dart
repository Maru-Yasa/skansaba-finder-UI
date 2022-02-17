// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skansaba_finder/components/profile_box.dart';
import 'package:skansaba_finder/models/barang_model.dart';
import 'package:skansaba_finder/providers/auth.dart';
import 'package:skansaba_finder/providers/barang.dart';
import '../components/postingan.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import './laporan_kehilangan_screen.dart';
import './barang_hilang_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool is_init = true;
  bool is_loading = false;
  List<BarangModel> barang_all = [];
  List<Widget> widgetBarang = [];
  Map<String, dynamic> myAuth = {};

  _dataToWidget() {
    for (final BarangModel data in barang_all) {
      widgetBarang.add(Postingan(
        judul: data.nama ?? "none",
        desc: data.keterangan ?? "none",
      ));
    }
  }

  @override
  void didChangeDependencies() {
    if (is_init) {
      is_loading = true;
      Provider.of<Auth>(context, listen: false).myAuth().then((value) {
        print(value);
        setState(() {
          myAuth = value;
          print(myAuth);
          is_loading = false;
        });
      }).catchError((e) {
        throw e;
      });
    }
    is_init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (is_loading)
          ? Center(child: CircularProgressIndicator())
          : ProfileBox(
              myAuth: myAuth,
            ),
    );
  }
}

// ListView.builder(
//                 itemCount: barang_all.length,
//                 itemBuilder: (context, index) {
//                   // return Text(barang_all[index].nama ?? "tidak ada");
//                   return Postingan(
//                     judul: barang_all[index].nama ?? "none",
//                     desc: barang_all[index].keterangan ?? "none",
//                   );
//                 },
//               )