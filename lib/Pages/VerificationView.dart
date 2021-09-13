import 'dart:convert';
import 'dart:developer';

import 'package:eltuv_use/Data/Utils/AppUtils.dart';
import 'package:eltuv_use/Data/constant/Strings.dart';
import 'package:eltuv_use/Data/models/UserModel.dart';
import 'package:eltuv_use/Data/response/CheckPhoneResponse.dart';
import 'package:eltuv_use/Pages/HomeScreen.dart';
import 'package:eltuv_use/managers/api_manager.dart';
import 'package:eltuv_use/utilities/api_constants.dart';
import 'package:eltuv_use/utilities/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import 'PersonalInformation.dart';

import '../Widget/ButtonWidget.dart';
import 'package:http/http.dart' as http;

class VerificationView extends StatefulWidget {
  final String phoneNumber;
  final String verificationId;

  VerificationView({this.verificationId, this.phoneNumber});

  @override
  _VerificationViewState createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  AuthCredential _phoneAuthCredential;
  final otpController = TextEditingController();
  bool _onEditing = true;
  String _status = '';
  FirebaseUser _firebaseUser;

  bool isLoading = false;

  String otp;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("Phone Verification",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              Column(
                children: [
                  VerificationCode(
                    textStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    keyboardType: TextInputType.number,
                    // in case underline color is null it will use primaryColor: Colors.red from Theme
                    underlineColor: Color(0xFFb7aeae),
                    length: 6,
                    // clearAll is NOT required, you can delete it
                    // takes any widget, so you can implement your design
                    onCompleted: (String value) {
                      setState(() {
                        otp = value;
                      });
                    },
                    onEditing: (bool value) {
                      setState(() {
                        _onEditing = value;
                      });
                      if (!_onEditing) FocusScope.of(context).unfocus();
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  custom_btn(
                    text: 'Verify Now',
                    onPressed: () {
                      if (otp != null && otp.length == 6) {
                        _submitOTP();
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
        isLoading
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black26,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container()
      ],
    );
  }

  void _submitOTP() {
    /// get the `smsCode` from the user
    String smsCode = otp;

    /// when used different phoneNumber other than the current (running) device
    /// we need to use OTP to get `phoneAuthCredential` which is inturn used to signIn/login
    this._phoneAuthCredential = PhoneAuthProvider.getCredential(
        verificationId: widget.verificationId, smsCode: smsCode);

    _login();
  }

  Future<void> _login() async {
    setState(() {
      isLoading = true;
    });

    /// This method is used to login the user
    /// `AuthCredential`(`_phoneAuthCredential`) is needed for the signIn method
    /// After the signIn method from `AuthResult` we can get `FirebaserUser`(`_firebaseUser`)
    /*try {

    } catch (e) {
      _handleError(e);
    }*/
    await FirebaseAuth.instance
        .signInWithCredential(this._phoneAuthCredential)
        .then((AuthResult authRes) {
      _firebaseUser = authRes.user;

      print("printing firebase user  " + _firebaseUser.toString());

      // HelperFunctions.saveInPreference(
      //     "firebaseUId", _firebaseUser.uid.toString());
      HelperFunctions.saveInPreference(
          "firebasePhone", _firebaseUser.phoneNumber.toString());
    }).catchError((e) => _handleError(e));
    setState(() {
      _status += 'Signed In\n';
    });
    _callAPICheckPhone(context);
  }

  void _handleError(e) {
    setState(() {
      isLoading = true;
    });
    print(e.toString());
    setState(() {
      _status += e.toString() + '\n';
    });
  }

  CheckUser checkUser;

  _callAPICheckPhone(BuildContext context) {
    this.setState(() {
      isLoading = true;
    });

    Map<String, dynamic> body = Map<String, dynamic>();
    body['phone'] = widget.phoneNumber;

    Map<String, String> header = Map<String, String>();

    FocusScope.of(context).requestFocus(FocusNode());
    log(jsonEncode(body));

    ApiManager networkCal =
        ApiManager(APIConstants.checkUser, body, false, header);

    networkCal.callPostAPI(context).then((response) {
      print('Back from api');

      this.setState(() {
        isLoading = false;
      });

      bool status = response['status'];
      if (status == true) {
        checkUser = CheckUser.fromMap(response);
        HelperFunctions.saveInPreference("userFname", checkUser.user.firstName);
        HelperFunctions.saveInPreference("userLname", checkUser.user.lastName);
        HelperFunctions.saveInPreference("useraddress", checkUser.user.city);
        HelperFunctions.saveInPreference(
            "firebaseUId", checkUser.user.id.toString());
        HelperFunctions.getFromPreference("firebaseUId")
            .then((value) => print("printing firebase User ID" + value));
        if (checkUser.message.account == 1) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false);
        } else {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => PersonalInformation(
                        phoneNumber: widget.phoneNumber,
                      )),
              (Route<dynamic> route) => false);
        }
      } else {
        HelperFunctions.showAlert(
          context: context,
          header: "Eltuv",
          widget: Text(response["message"]),
          btnDoneText: "ok",
          onDone: () {},
          onCancel: () {},
        );
      }
    });
  }
}

showSnackBar(BuildContext context, String str) {
  final snackBar = SnackBar(
    content: Text(
      str,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.black87,
    duration: Duration(seconds: 1),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
