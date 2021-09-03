import 'dart:convert';

import 'package:eltuv_use/Data/Utils/AppUtils.dart';
import 'package:eltuv_use/Data/constant/Strings.dart';
import 'package:eltuv_use/Data/models/UserModel.dart';
import 'package:eltuv_use/Data/response/CheckPhoneResponse.dart';
import 'package:eltuv_use/Pages/HomeScreen.dart';
import 'package:flutter/material.dart';

import '../AppColors.dart';
import 'PersonalInformation.dart';
import 'package:http/http.dart' as http;
import 'VerificationView.dart';
import '../Widget/ButtonWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Widget/CountryCodeField.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading=false;

  TextEditingController phoneController= TextEditingController();
  String value='+92';
  String _status='';
  FirebaseUser _firebaseUser;
  AuthCredential _phoneAuthCredential;
  String _verificationId;
  int _code;
  @override
  Widget build(BuildContext context) {
    print('status'+_status);
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height*0.11),
                Image.asset('images/logo.png',scale: MediaQuery.of(context).size.height*0.002,),
                Text('Eltuv',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Raleway',
                    fontSize: MediaQuery.of(context).size.height*0.05),),
                SizedBox(height: size.height*0.1),
                Text('Login Account',style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Raleway',
                    color:   Color(0xffc70039),
                    fontSize: MediaQuery.of(context).size.height*0.027),),
                SizedBox(height: size.height*0.07),
                    CountryCodeWidget(
                      onPickCode: (code){
                        setState(() {
                          value=code.toString();
                        });
                      },
                      phoneController: phoneController,
                    ),
                    SizedBox(height: size.height*0.03,),
                    custom_btn(
                      onPressed: (){
                        String number=value+phoneController.text;
                        print('value: '+number);
                       _submitPhoneNumber(number);


                      },
                      text: "Continue",
                    ),




                  ],
                ),


          ),
        ),
        isLoading?
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black26,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ):
        Container()
      ],
    );

  }
  void _handleError(e) {
    print(e.message);
    setState(() {
      _status += e.message + '\n';
    });
  }
  void _showError(e) {
    print(e.message);
    setState(() {
      _status += e.message + '\n';
    });
    showSnackBar(context,'Invalid Phone Number');

  }
  Future<void> _getFirebaseUser() async {
    this._firebaseUser = await FirebaseAuth.instance.currentUser();
    setState(() {
      _status =
      (_firebaseUser == null) ? 'Not Logged In\n' : 'Already LoggedIn\n';
    });
  }

  Future<void> _login(String number) async {
    /// This method is used to login the user
    /// `AuthCredential`(`_phoneAuthCredential`) is needed for the signIn method
    /// After the signIn method from `AuthResult` we can get `FirebaserUser`(`_firebaseUser`)
    try {
      await FirebaseAuth.instance
          .signInWithCredential(this._phoneAuthCredential)
          .then((AuthResult authRes) {
        _firebaseUser = authRes.user;
        print(_firebaseUser.toString());
      }).catchError((e) => _handleError(e));
      setState(() {
        _status += 'Signed In\n';
      });
    } catch (e) {
      _handleError(e);
    }




  }

  Future<void> _logout() async {
    /// Method to Logout the `FirebaseUser` (`_firebaseUser`)
    try {
      // signout code
      await FirebaseAuth.instance.signOut();
      _firebaseUser = null;
      setState(() {
        _status += 'Signed out\n';
      });
    } catch (e) {
      _handleError(e);
    }
  }

  Future<void> _submitPhoneNumber(String number) async {
    /// NOTE: Either append your phone number country code or add in the code itself
    /// Since I'm in Pakistan we use "+92 " as prefix `phoneNumber`
    setState(() {
      isLoading=true;
    });

    String phoneNumber = number.trim();
    print(phoneNumber);

    /// The below functions are the callbacks, separated so as to make code more redable
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');
      setState(() {
        _status += 'verificationCompleted\n';
      });
      this._phoneAuthCredential = phoneAuthCredential;
      _login(number);
      print(this._phoneAuthCredential);
    }

    void verificationFailed(AuthException error) {
      setState(() {
        isLoading=false;
      });
      print('verificationFailed');
      _showError(error);
    }

    void codeSent(String verificationId, [int code]) {
      print('codeSent');
      this._verificationId = verificationId;
      print(verificationId);
      this._code = code;
      print(code.toString());
      setState(() {
        _status += 'Code Sent\n';
        isLoading=false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => VerificationView(verificationId: verificationId,phoneNumber: number)));
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
      setState(() {
        _status += 'codeAutoRetrievalTimeout\n';
        isLoading=false;
      });
      print(verificationId);
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: phoneNumber,

      /// `seconds` didn't work. The underlying implementation code only reads in `millisenconds`
      timeout: Duration(milliseconds: 100000),

      /// If the SIM (with phoneNumber) is in the current device this function is called.
      /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
      /// When this function is called there is no need to enter the OTP, you can click on Login button to sigin directly as the device is now verified
      verificationCompleted: verificationCompleted,

      /// Called when the verification is failed
      verificationFailed: verificationFailed,

      /// This is called after the OTP is sent. Gives a `verificationId` and `code`
      codeSent: codeSent,

      /// After automatic code retrival ` tmeout` this function is called
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    ); // All the callbacks are above
  }


  }



showSnackBar(BuildContext context,String str){
  final snackBar = SnackBar(
    content: Text(str, style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.black87,
    duration: Duration(seconds: 1),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
