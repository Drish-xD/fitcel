import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitcel/pages/nav_page.dart';
import 'package:fitcel/pages/start_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // user is logged in
        if (snapshot.hasData) {
          return const NavPage();
        }
        // user is not logged in
        else {
          return const StartPage();
        }
      },
    );
  }
}
