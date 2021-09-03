
import 'package:flutter/material.dart';

import '../AppColors.dart';
class PersonalWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const PersonalWidget({Key key,  this.hintText,this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return  Container(
      margin:EdgeInsets.symmetric(horizontal: 24,vertical: 12) ,
      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: colorBorder)),
      child: TextField(
        controller: controller,

        cursorColor:colorBlack,
        decoration: InputDecoration(
            border: InputBorder.none,

            hintText: hintText,hintStyle:  TextStyle(

        ),
            contentPadding:EdgeInsets.symmetric(vertical: 18,horizontal: 10)
        ),

      ),


    );
  }
}
