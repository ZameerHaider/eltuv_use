import 'package:eltuv_use/Widget/settinglist.dart';
import 'package:flutter/material.dart';

class setting extends StatefulWidget {


  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Setting',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
          settinglist(inputtext: 'Change Password',onTap: (){},),
          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          settinglist(inputtext: 'Delete Account',onTap: (){},)
        ],
      ),
    );
  }
}
