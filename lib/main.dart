import 'package:firebase_core/firebase_core.dart';
import 'package:fitcel/constants.dart';
import 'package:fitcel/pages/auth/auth_page.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FitCel App',
        debugShowCheckedModeBanner: false,
        // Set Theme For The App
        theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: bgColor,
            // splashColor: Colors.deepPurple[900]?.withOpacity(0.1),
            textTheme: Theme.of(context).textTheme.apply(bodyColor: txtColor),
            fontFamily: "Montserrat",
            visualDensity: VisualDensity.adaptivePlatformDensity),
        // Main Start Point Of App
        home: const AuthPage());
  }
}
