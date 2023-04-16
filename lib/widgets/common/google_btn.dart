import 'dart:ui';

import 'package:fitcel/services/auth_service.dart';
import 'package:fitcel/services/backend/backend.dart';
import 'package:flutter/material.dart';

class GoogleBtn extends StatefulWidget {
  final String imgPath;
  final String txt;

  const GoogleBtn({
    Key? key,
    required this.imgPath,
    required this.txt,
  }) : super(key: key);
  @override
  State<GoogleBtn> createState() => _GoogleBtnState();
}

class _GoogleBtnState extends State<GoogleBtn> {
  // Auth Function
  void googleAuth() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    var res = await AuthService().signInWithGoogle();
    var success =
        await Backend().addUser(email: res.user!.email!, uuid: res.user!.uid);
    if (!success) {
      print("unable to add user to backend");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: ElevatedButton(
          onPressed: googleAuth,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.white12,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.imgPath,
              ),
              const SizedBox(width: 10),
              Text(
                "${widget.txt} with Google",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
