import 'package:eltuv_use/Data/models/UserModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AppConstants.dart';

hideKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(new FocusNode());
}

bool validEmail(String text) {
  if (text.isNotEmpty &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(text)) {
    return true;
  } else {
    return false;
  }
}

showSnackBar(GlobalKey<ScaffoldState> key, String str) {
  final snackBar = SnackBar(
    content: Text(
      str,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.black87,
    duration: Duration(seconds: 1),
  );
  key.currentState.showSnackBar(snackBar);
}

Future<dynamic> saveUser(UserModel user) async {
  // get shared preference instance.
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // Set the key ('isLoggenIn') with a value (true/false) here.

  print(user.firstName);
  print(user.id);

  prefs.setBool(kLogin, true).then((value) {
    prefs.setInt(kUserId, user.id).then((value) {
      prefs.setString(kName, user.firstName).then((value) {
        prefs.setString(kName, user.firstName);
        prefs.setString(kPhone, user.phone);
        prefs.setString(kAddress, user.province);
      });
    });
  });
}

Future<UserModel> getUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  UserModel user = UserModel();

  user.id = prefs.getInt(kUserId);
  user.firstName = prefs.getString(kName);
  user.phone = prefs.getString(kPhone);
  user.province = prefs.getString(kAddress);

  return user;
}

Future<bool> isLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(kLogin);
}

Future<bool> signout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  return true;
}
