import 'package:flutter/material.dart';

class settinglist extends StatelessWidget {
  String inputtext;
  VoidCallback onTap;

  settinglist({this.inputtext='', this.onTap});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,vertical: MediaQuery.of(context).size.height*0.01),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.01,vertical: MediaQuery.of(context).size.height*0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(inputtext,),
              // SizedBox(width: width),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.01,vertical: MediaQuery.of(context).size.height*0.01),
                child: InkWell(
                  child: Icon(Icons.chevron_right),
                  onTap: onTap,),

              ),
            ],
          ),
        ),

      ),
    );
  }
}

