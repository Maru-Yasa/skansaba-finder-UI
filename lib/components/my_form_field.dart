// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFormField extends StatelessWidget {
  final EdgeInsets? margin;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool isObscure;
  final String? hint;
  final Icon? prefixIcon;

  const MyFormField({
    Key? key,
    EdgeInsets? this.margin,
    void Function(String?)? this.onSaved,
    String? Function(String?)? this.validator,
    String? this.hint,
    bool this.isObscure = true,
    Icon? this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
      child: TextFormField(
        obscureText: isObscure,
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
