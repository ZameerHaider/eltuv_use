
import 'package:flutter/material.dart';

import '../AppColors.dart';

class custom_btn extends StatelessWidget {
  final String text;
  final Function onPressed;

  const custom_btn({Key key, this.text, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(   color: colorPrimary,
          borderRadius: BorderRadius.circular(15.0),


        ),
        margin: EdgeInsets.symmetric(horizontal: 35),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:19.0),
            child: Text(text,style: TextStyle(fontSize: 17,
                color: colorWhite,fontWeight: FontWeight.bold),

            ),
          ),
        ),
      ),
    );
  }
}
