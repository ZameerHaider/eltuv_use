import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';

import 'AppColors.dart';
import 'Pages/HomeScreen.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  final screen = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: colorWhite,
        buttonBackgroundColor: colorPrimary,
        color: colorPrimary,
        index: selectedIndex,
        items: [
          Image.asset(
            "images/home.png",
            height: size.height * 0.02,
          ),
          Image.asset(
            "images/Vector.png",
            height: size.height * 0.02,
          ),
          Image.asset(
            "images/order.png",
            height: size.height * 0.02,
          ),
          Image.asset(
            "images/profile.png",
            height: size.height * 0.02,
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        animationCurve: Curves.easeInBack,
        animationDuration: const Duration(milliseconds: 300),
      ),
      body: screen[selectedIndex],
    );
  }
}
