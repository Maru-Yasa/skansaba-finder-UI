// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyContainer extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? margin;
  const MyContainer({Key? key, Widget? this.child, EdgeInsets? this.margin,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
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
      child: this.child,
    );
  }
}
