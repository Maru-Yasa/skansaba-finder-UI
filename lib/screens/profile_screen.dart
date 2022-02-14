// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skansaba_finder/components/profile_box.dart';
import 'package:skansaba_finder/providers/auth.dart';
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
  Map<String, dynamic> myAuth = {};

  @override
  void didChangeDependencies() {
    if (is_init) {
      is_loading = true;
      Provider.of<Auth>(context, listen: false).myAuth().then((value) {
        print(value);
        setState(() {
          myAuth = value;
          is_loading = false;
        });
      }).catchError((e) {
        print(e);
      });
    }
    ;
    is_init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (is_loading)
          ? Center(child: CircularProgressIndicator())
          : ProfileBox(
              name: myAuth['nama'],
              myAuth: myAuth,
            ),
    );
  }
}
