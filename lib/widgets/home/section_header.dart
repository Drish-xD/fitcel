import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SectionHeader extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  SectionHeader(
      {Key? key,
      this.size = 20,
      required this.text,
      this.color = Colors.white70})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
