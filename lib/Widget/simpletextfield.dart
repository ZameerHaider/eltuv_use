import 'package:flutter/material.dart';

class simpletextfield extends StatelessWidget {
  String hinttext;
  simpletextfield({this.hinttext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
      child: TextField(
        decoration: InputDecoration(
          hintText: hinttext,
          filled: true,
          fillColor: Colors.white,
          enabledBorder:UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black12)
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black12)
          )
        ),
      ),
    );
  }
}
