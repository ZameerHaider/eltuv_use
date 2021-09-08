
import 'package:eltuv_use/Pages/category.dart';
import 'package:eltuv_use/Pages/payment.dart';
import 'package:eltuv_use/Pages/profile/editprofile.dart';
import 'package:eltuv_use/Pages/setting.dart';
import 'package:eltuv_use/Pages/trackorder/myorder.dart';
import 'package:eltuv_use/Widget/settinglist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        title: Text('Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.height*0.03,color: Colors.black),),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height*0.02,),
            Container(
              color: Colors.white,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.30,vertical:
                MediaQuery.of(context).size.height*0.02),
                child: Column(
                  children: [
                    SizedBox(width: size.width*0.07,),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset('images/person1.png')),
                    SizedBox(width: size.width*0.02,),
                    Column(
                      children: [
                        Text('Rosina Doe',textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.height*0.03,),),
                        Text('+1 0000 000 000'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height*0.01,),
            settinglist(inputtext: 'Edit profile',onTap:(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => editprofile()),
              );

            } ,),
            settinglist(inputtext: 'My Order',onTap:(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => myorder()),
              );

            } ,),
            settinglist(inputtext: 'Payments',onTap:(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => payment()),
              );

            } ,),
            settinglist(inputtext: 'Share',onTap:(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => category()),
              );


            } ,),

            settinglist(inputtext: 'Setting',onTap:(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => setting()),
              );

            } ,),
            settinglist(inputtext: 'Help',onTap:(){
            } ,),
            SizedBox(height: size.height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout),
                SizedBox(width: size.width*0.02,),
                Text('Logout',style: TextStyle(fontWeight: FontWeight.w600),)
              ],
            ),
            SizedBox(height: size.height*0.02,),

          ],
        ),
      ),
    );
  }
}
