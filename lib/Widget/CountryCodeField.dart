

import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

import '../AppColors.dart';

class CountryCodeWidget extends StatefulWidget {

  final TextEditingController phoneController;

  final Function onPickCode;

  CountryCodeWidget({this.phoneController,this.onPickCode});



  @override
  _CountryCodeWidgetState createState() => _CountryCodeWidgetState();
}

class _CountryCodeWidgetState extends State<CountryCodeWidget> {

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(vertical: 13),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: colorInput,)
        ),

        child: Row(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.35,
                  child: CountryCodePicker(
                    initialSelection: 'uz',
                    showCountryOnly: true,
                    textStyle: TextStyle(
                        fontSize: 16, color: Colors.black,
                        fontWeight: FontWeight.w500
                    ),
                    onChanged: widget.onPickCode,
                    showOnlyCountryWhenClosed: false,
                    favorite: ['+92'],
                    enabled: true,
                    alignLeft: true,),
                ),

              ],
            ),

            Flexible(
              child: Container(
                child: TextField(
                  controller: widget.phoneController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.black.withOpacity(
                        0.4), fontSize: 16, fontWeight: FontWeight.w600),

                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}