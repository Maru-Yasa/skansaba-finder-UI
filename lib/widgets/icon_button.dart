import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final Text text;
  final Icon icon;
  final Color color;
  final EdgeInsets? padding;
  const MyIconButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.icon,
      required this.color,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          primary: color,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(5),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 6),
              text,
            ],
          ),
        ),
      ),
    );
  }
}
