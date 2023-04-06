import 'package:fitcel/constants.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  TitleText(
      {Key? key, this.size = 30, required this.text, this.color = txtColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: txtColor,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
