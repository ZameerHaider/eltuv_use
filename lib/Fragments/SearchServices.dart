import 'dart:convert';

import 'package:eltuv_use/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:eltuv_use/Data/constant/Strings.dart';
import 'package:eltuv_use/Data/models/UserModel.dart';
import 'package:eltuv_use/Data/response/HomeResponse.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import 'package:http/http.dart' as http;

import '../Data/response/HomeResponse.dart';

class SearchServices extends StatefulWidget {
  List<Service> servicesList = [];
  SearchServices({this.servicesList});
  @override
  _SearchServicesState createState() => _SearchServicesState();
}

class _SearchServicesState extends State<SearchServices> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: size.height * 0.074,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.keyboard_backspace_rounded,
            color: colorBlack,
          ),
        ),
        title: Container(
          margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
          decoration: BoxDecoration(
              color: colorback, borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            cursorColor: colorBlack,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
              hintText: "Search",
              hintStyle: TextStyle(color: colorText),
              prefixIcon: Icon(
                Icons.search,
                color: colorText,
                size: size.height * 0.03,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: colorback),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: colorback),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.023,
            ),
            /* Text("Recent Search", style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF9A9A9A),
                fontSize: size.height*0.018),),*/

            /// SizedBox(height: size.height*0.07,),
            Text(
              "All Categories",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF9A9A9A),
                  fontSize: size.height * 0.018),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.14,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.servicesList == null
                    ? 0
                    : widget.servicesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: colorText,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: size.height * 0.02),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03,
                                  ),
                                  decoration: BoxDecoration(
                                      color: colorgreen,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.02,
                                        vertical: size.height * 0.01),
                                    child: Image.network(
                                      widget.servicesList[index].image,
                                      width: size.height * 0.03,
                                      height: size.height * 0.03,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace stackTrace) {
                                        return Image(
                                            height: size.width * 0.45,
                                            width: size.width * 0.45,
                                            fit: BoxFit.contain,
                                            image: NetworkImage(
                                                "https://i2.wp.com/asvs.in/wp-content/uploads/2017/08/dummy.png"));
                                      },
                                    ),
                                  )),
                              SizedBox(height: size.height * 0.01),
                              Text(
                                widget.servicesList[index].serviceName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.height * 0.017,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: size.height * 0.01),
                              Text(
                                widget.servicesList[index].name ?? "",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.height * 0.0124,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ],
                      )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
