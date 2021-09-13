import 'dart:convert';
import 'dart:developer';

import 'package:eltuv_use/AppColors.dart';
import 'package:eltuv_use/Pages/trackorder/Order_Details/myOrder_details.dart';
import 'package:eltuv_use/Pages/trackorder/myordersObject.dart';
import 'package:eltuv_use/managers/api_manager.dart';
import 'package:eltuv_use/utilities/api_constants.dart';
import 'package:eltuv_use/utilities/customloader.dart';
import 'package:eltuv_use/utilities/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';

class Myorder extends StatefulWidget {
  @override
  _MyorderState createState() => _MyorderState();
}

class _MyorderState extends State<Myorder> {
  bool isLoading = false;

  MyOrdersObject myOrdersObject;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _callAPIGetOrders(context);
    });
  }

  _callAPIGetOrders(BuildContext context) {
    this.setState(() {
      isLoading = true;
    });
    HelperFunctions.getFromPreference("firebaseUId").then((userid) {
      Map<String, dynamic> body = Map<String, dynamic>();

      Map<String, String> header = Map<String, String>();

      FocusScope.of(context).requestFocus(FocusNode());
      log(jsonEncode(body));

      ApiManager networkCal =
          ApiManager(APIConstants.getOrders + userid, body, false, header);

      networkCal.callGetAPI(context).then((response) {
        print('Back from api');

        this.setState(() {
          isLoading = false;
        });

        bool status = response['status'];
        if (status == true) {
          myOrdersObject = MyOrdersObject.fromMap(response);
        } else {
          HelperFunctions.showAlert(
            context: context,
            header: "Eltuv",
            widget: Text(response["message"]),
            btnDoneText: "ok",
            onDone: () {},
            onCancel: () {},
          );
        }
      });
    });
  }

  DateFormat ourFormat = DateFormat('dd-MM-yyyy');
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CustomLoader(
      isLoading: isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffC70039),
          title: Text(
            'My Orders',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //     colors: [Color(0xffC70039), Color(0xffC70039), Colors.white],
              //   )),
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(
              //         horizontal: size.width * 0.04,
              //         vertical: size.height * 0.02),
              //     child: Row(
              //       children: [
              //         Expanded(
              //           flex: 1,
              //           child: MaterialButton(
              //             onPressed: () {},
              //             color: Colors.white,
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(15)),
              //             child: Padding(
              //               padding: EdgeInsets.symmetric(
              //                   vertical: size.height * 0.02),
              //               child: Text(
              //                 'New Order',
              //                 style: TextStyle(color: Colors.black),
              //               ),
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           width: size.width * 0.02,
              //         ),
              //         Expanded(
              //           flex: 1,
              //           child: MaterialButton(
              //             onPressed: () {},
              //             color: Color(0xffC70039),
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(15)),
              //             child: Padding(
              //               padding: EdgeInsets.symmetric(
              //                   vertical: size.height * 0.02),
              //               child: Text(
              //                 'Order History',
              //                 style: TextStyle(color: Colors.white),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: myOrdersObject == null
                          ? 0
                          : myOrdersObject.response.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyorderDetails(
                                      orderId:
                                          myOrdersObject.response[index].id,
                                    )));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.width * 0.02),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.030,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(
                                        1, 0), // changes position of shadow
                                  ),
                                ]),
                            child: Row(
                              children: [
                                // ClipRRect(
                                //   borderRadius: BorderRadius.only(
                                //     topLeft: Radius.circular(
                                //       MediaQuery.of(context).size.width * 0.034,
                                //     ),
                                //     bottomLeft: Radius.circular(
                                //       MediaQuery.of(context).size.width * 0.034,
                                //     ),
                                //   ),
                                //   child: Image.network(
                                //     "https://dummyimage.com/600x400/000/fff",
                                //     height:
                                //         MediaQuery.of(context).size.height * 0.20,
                                //     width:
                                //         MediaQuery.of(context).size.width * 0.31,
                                //     fit: BoxFit.fitHeight,
                                //   ),
                                // ),
                                SizedBox(
                                  width: size.width * 0.020,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      OrdersWidget(
                                        title: myOrdersObject.response[index].id
                                            .toString(),
                                      ),
                                      OrdersWidget(
                                        prefixtitle: "Name",
                                        icon: Icons.perm_identity_outlined,
                                        title: myOrdersObject
                                            .response[index].clientName,
                                      ),
                                      OrdersWidget(
                                        prefixtitle: "Address",
                                        icon: Icons.home_outlined,
                                        title: myOrdersObject
                                            .response[index].clientAddress,
                                      ),
                                      OrdersWidget(
                                        prefixtitle: "Amount",
                                        icon: Icons.paid_outlined,
                                        title: myOrdersObject
                                            .response[index].paidAmount,
                                      ),
                                      OrdersWidget(
                                        prefixtitle: "Date",
                                        icon: Icons.history_outlined,
                                        title: ourFormat.format(myOrdersObject
                                            .response[index].createdAt),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrdersWidget extends StatelessWidget {
  const OrdersWidget(
      {Key key, this.icon, this.title = "", this.prefixtitle = ""})
      : super(key: key);

  final String title;
  final IconData icon;
  final prefixtitle;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          icon == null
              ? Text(
                  "Order #",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: size.width * 0.039,
                  ),
                )
              : Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: size.width * 0.02),
                      child: Icon(
                        icon,
                        color: colorPrimary,
                        size: size.width * 0.065,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Text(
                      this.prefixtitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: size.width * 0.036,
                      ),
                    )
                  ],
                ),
          Spacer(),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: size.width * 0.039,
            ),
          ),
          SizedBox(
            width: size.width * 0.03,
          )
        ],
      ),
    );
  }
}
