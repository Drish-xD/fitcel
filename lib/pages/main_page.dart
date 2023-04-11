import 'dart:ui';

import 'package:fitcel/constants.dart';
import 'package:fitcel/pages/home_page.dart';
import 'package:fitcel/pages/search_page.dart';
import 'package:fitcel/pages/sign_in_page.dart';
import 'package:fitcel/pages/stats_page.dart';
import 'package:fitcel/pages/user_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    StatsPage(),
    UserPage()
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.fitness_center_rounded), label: "Plans"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart_rounded), label: "Stats"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded), label: "User"),
            ],
            type: BottomNavigationBarType.fixed,
            backgroundColor: prColor.withOpacity(0.2),
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.white70,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 1,
            currentIndex: _selectedIndex,
            onTap: _onTap,
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      extendBody: true,
    );
  }
}
