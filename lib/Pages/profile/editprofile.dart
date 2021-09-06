import 'package:eltuv_use/Widget/custom_button.dart';
import 'package:eltuv_use/Widget/simpletextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class editprofile extends StatefulWidget {


  @override
  _editprofileState createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Edit profile',style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffC70034),
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset('images/person1.png',fit: BoxFit.fill,),),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: -15,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                      color: Color(0xffC70034),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.02 ,vertical:MediaQuery.of(context).size.height*0.01, ),
                        child: InkWell(
                            onTap: (){},
                            child: Icon(Icons.add,color: Colors.white,)),
                      )),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Name')),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            simpletextfield(hinttext: 'Rosina Doe',),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Card Number')),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            simpletextfield(hinttext: '+1 0000 000 000',),
            SizedBox(height: MediaQuery.of(context).size.height*0.06,),
            Custombutton(
              onPress: (){},
              title: 'Update',
              titleColor: Colors.white,
              backgroundColor: Color(0xffC70034),
            )



          ],
        ),
      ),
    );
  }
}
