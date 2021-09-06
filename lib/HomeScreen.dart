import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eltuv_use/Pages/Cart_screen.dart';
import 'package:eltuv_use/Pages/profile/ProfileScreen.dart';

import 'package:flutter/material.dart';

import 'AppColors.dart';
import 'Pages/HomeScreen.dart';
import 'Pages/favourite.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  final screen = [
    HomeScreen(),
    favourite(),
    CartScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor:Colors.transparent,
        buttonBackgroundColor: colorPrimary,
        color: colorPrimary,
        index: selectedIndex,
        items: [
          Image.asset(
            "images/home.png",
            height: size.height * 0.03,
          ),
          Image.asset(
            "images/Vector.png",
            height: size.height * 0.03,
          ),
          Image.asset(
            "images/order.png",
            height: size.height * 0.03,
          ),
          Image.asset(
            "images/profile.png",
            height: size.height * 0.03,
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        animationCurve: Curves.bounceOut,
        animationDuration: const Duration(milliseconds: 600),
      ),
      body: screen[selectedIndex],
    );
  }
}
