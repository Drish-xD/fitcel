import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitcel/constants.dart';
import 'package:fitcel/pages/nav_page.dart';
import 'package:fitcel/pages/start_page.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late StreamSubscription<User?> _sub;
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _sub = FirebaseAuth.instance.authStateChanges().listen((event) {
      _navigatorKey.currentState!.pushReplacementNamed(
        event != null ? 'home' : 'login',
      );
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FitCel App',
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        // Set Theme For The App
        theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: bgColor,
            // splashColor: Colors.deepPurple[900]?.withOpacity(0.1),
            textTheme: Theme.of(context).textTheme.apply(bodyColor: txtColor),
            fontFamily: "Montserrat",
            visualDensity: VisualDensity.adaptivePlatformDensity),
        initialRoute:
            FirebaseAuth.instance.currentUser == null ? 'login' : 'home',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case 'home':
              return MaterialPageRoute(
                  settings: settings, builder: (_) => const NavPage());
            case 'login':
              return MaterialPageRoute(
                  settings: settings, builder: (_) => const StartPage());
          }
          return null;
        });
  }
}
