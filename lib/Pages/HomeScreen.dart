import 'dart:convert';
import 'dart:developer';

import 'package:eltuv_use/Data/constant/Strings.dart';
import 'package:eltuv_use/Data/models/UserModel.dart';
import 'package:eltuv_use/Pages/SignUp.dart';
import 'package:eltuv_use/Widget/ListView.dart';
import 'package:eltuv_use/managers/api_manager.dart';
import 'package:eltuv_use/utilities/api_constants.dart';
import 'package:eltuv_use/utilities/customloader.dart';
import 'package:eltuv_use/utilities/helper_functions.dart';
import 'package:flutter/scheduler.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import 'package:eltuv_use/Data/response/HomeResponse.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';

import '../AppColors.dart';
import '../Fragments/SearchServices.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;
  final Widget child;
  final String userId;

  final String phoneNumber;

  const HomeScreen({
    Key key,
    this.user,
    this.phoneNumber,
    this.child,
    this.userId,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // bool isLoading = true;

  HomeObject homeObject;
  Response apisnapshot;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).callAPIGetHome(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    apisnapshot = Provider.of<HomeProvider>(context, listen: true).apisnapShot;
    homeObject = Provider.of<HomeProvider>(context, listen: true).homeObject;
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: Consumer<HomeProvider>(builder: (context, homePRo, child) {
        return CustomLoader(
          isLoading: homePRo.isLoading,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: size.height * 0.1,
              centerTitle: false,
              leadingWidth: 0,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Food App",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: colorBlack,
                        fontSize: size.height * 0.023),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'DELIVERING TO',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                          color: colorBlack.withOpacity(0.6),
                          fontSize: 14),
                      children: const <TextSpan>[
                        TextSpan(
                            text: ' Home',
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                color: colorPrimary,
                                fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * 0.02),
                      decoration: BoxDecoration(
                          color: colorback,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        cursorColor: colorBlack,
                        decoration: InputDecoration(
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
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    CarouselSlider(
                        items: apisnapshot == null
                            ? []
                            : apisnapshot.sliders
                                .map(
                                  (e) => Container(
                                    margin: EdgeInsets.all(size.height * 0.01),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(e.image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 16 / 7,
                          viewportFraction: 1,
                        )),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Services",
                          style: TextStyle(
                              color: colorBlack,
                              fontSize: size.height * 0.022,
                              fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchServices(
                                        servicesList:
                                            homeObject.response.services,
                                      )),
                            );
                          },
                          child: Text(
                            "See all",
                            style: TextStyle(
                                color: colorText,
                                fontSize: size.height * 0.018,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.14,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: apisnapshot == null
                            ? 0
                            : apisnapshot.services.length,
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
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.02,
                                                vertical: size.height * 0.01),
                                            child: Image.asset(
                                              'images/service.png',
                                              height: size.height * 0.03,
                                            ),
                                          )),
                                      SizedBox(height: size.height * 0.01),
                                      Text(
                                        apisnapshot.services[index].serviceName,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: size.height * 0.017,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(height: size.height * 0.01),
                                      // Text(
                                      //   "45 options",
                                      //   style: TextStyle(
                                      //       color: Colors.white,
                                      //       fontSize: size.height * 0.0124,
                                      //       fontWeight: FontWeight.w300),
                                      // ),
                                    ],
                                  ),
                                ],
                              )));
                        },
                      ),
                    ),
                    // SizedBox(
                    //   height: size.height * 0.01,
                    // ),
                    // Text(
                    //   "Categories",
                    //   style: TextStyle(
                    //       color: colorgrey,
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.w600),
                    // ),
                    // SizedBox(
                    //   height: size.height * 0.03,
                    // ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height * 0.05,
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: 5,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return Container(
                    //           margin: EdgeInsets.symmetric(horizontal: 5),
                    //           padding: EdgeInsets.symmetric(horizontal: 20),
                    //           decoration: BoxDecoration(
                    //             color: Color(0xFF262a34),
                    //             borderRadius: BorderRadius.circular(25),
                    //           ),
                    //           child: Center(
                    //               child: Row(
                    //             children: [
                    //               Text(
                    //                 "Promo",
                    //                 style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontSize: 13,
                    //                     fontWeight: FontWeight.w700),
                    //               )
                    //             ],
                    //           )));
                    //     },
                    //   ),
                    // ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    listView(
                      storeList: apisnapshot == null ? [] : apisnapshot.stores,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
