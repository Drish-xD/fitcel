import 'package:flutter/material.dart';

class GoogleBtn extends StatelessWidget {
  final String imgPath;
  final String txt;

  const GoogleBtn({
    Key? key,
    required this.imgPath,
    required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white12,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imgPath,
            ),
            const SizedBox(width: 10),
            Text(
              "$txt with Google",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
