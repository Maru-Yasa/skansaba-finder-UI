// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/selengkapnya_screen.dart';

class Postingan extends StatelessWidget {
  final String judul;
  final String desc;
  final String? img_url;
  const Postingan(
      {Key? key, required this.judul, required this.desc, this.img_url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Container(
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
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Text(
                  this.judul,
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  constraints: BoxConstraints(maxHeight: 400),
                  child: Image.network(this.img_url ?? "")),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  this.desc,
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white, backgroundColor: Colors.blue),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelengkapnyaScreen()));
                      },
                      child: Text('Selengkapnya'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
