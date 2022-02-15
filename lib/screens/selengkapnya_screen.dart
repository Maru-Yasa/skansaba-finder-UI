// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelengkapnyaScreen extends StatefulWidget {
  final String judul;
  final String desc;
  final String? img_url;
  const SelengkapnyaScreen(
      {Key? key, required this.judul, required this.desc, this.img_url})
      : super(key: key);

  @override
  _SelengkapnyaScreenState createState() => _SelengkapnyaScreenState();
}

class _SelengkapnyaScreenState extends State<SelengkapnyaScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Selengkapnya')),
        body: Center(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          widget.judul,
                          style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
