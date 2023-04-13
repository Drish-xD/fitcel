import 'package:flutter/material.dart';

class SquareBtn extends StatelessWidget {
  final String imgPath;
  const SquareBtn({Key? key, required this.imgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white12,
      ),
      child: SizedBox(
        width: 45,
        height: 45,
        child: Image.asset(
          imgPath,
        ),
      ),
    );
  }
}
