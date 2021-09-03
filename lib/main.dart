import 'package:eltuv_use/utilities/helper_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'Data/Utils/AppConstants.dart';
import 'HomeScreen.dart';
import 'Pages/SignUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String fireBaseUserid = "";
  String fireBaseNumber = "";
  HelperFunctions.getFromPreference("firebaseUId").then((value) {
    fireBaseUserid = value;
    print("printing firebase User ID" + fireBaseUserid);
  });
  HelperFunctions.getFromPreference("firebasePhone").then((value) {
    fireBaseNumber = value;
    print("printing firebase User Phone" + fireBaseNumber);
  });

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool login = false;
  fireBaseNumber == "" && fireBaseUserid == "" ? login = false : login = true;

  runApp(MyApp(
    isLogin: login,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLogin;

  MyApp({this.isLogin = false});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("printing bool " + isLogin.toString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eltuv',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: isLogin ? Home() : SignUp(),
    );
  }
}
