import 'dart:convert';
import 'dart:developer';

import 'package:eltuv_use/AppColors.dart';
import 'package:eltuv_use/Data/models/OrderModel%20.dart';
import 'package:eltuv_use/Data/response/HomeResponse.dart';
import 'package:eltuv_use/Pages/order_screen.dart';
import 'package:eltuv_use/Widget/CartItem.dart';
import 'package:eltuv_use/Widget/CheckContainer.dart';
import 'package:eltuv_use/Widget/PersonInput.dart';
import 'package:eltuv_use/Widget/customTextField.dart';
import 'package:eltuv_use/Widget/custom_button.dart';
import 'package:eltuv_use/managers/api_manager.dart';
import 'package:eltuv_use/utilities/api_constants.dart';
import 'package:eltuv_use/utilities/helper_functions.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  List<CollectionProduct> collectionProduct;
  CartScreen({this.collectionProduct});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String userID = "";
  @override
  void initState() {
    super.initState();
    HelperFunctions.getFromPreference("firebaseUId")
        .then((value) => userID = value);
  }

  _btnActionPlaceOrder(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (nameController.text == '') {
      HelperFunctions.showAlert(
          context: context,
          header: "Eltuv",
          widget: Text("Name is required"),
          btnDoneText: "ok",
          onDone: () {},
          onCancel: () {});
    } else if (numberController.text == '') {
      HelperFunctions.showAlert(
        context: context,
        header: "Eltuv",
        widget: Text("Number is required"),
        btnDoneText: "ok",
        onDone: () {},
        onCancel: () {},
      );
    } else if (addressConroller.text == '') {
      HelperFunctions.showAlert(
        context: context,
        header: "Eltuv",
        widget: Text("Addresss is required"),
        btnDoneText: "ok",
        onDone: () {},
        onCancel: () {},
      );
    } else {
      _callAPIPOstOrder(context);
    }
  }

  bool value1 = false;
  bool value2 = false;
  final commentController = TextEditingController();
  final promoController = TextEditingController();
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final addressConroller = TextEditingController();
  bool isLoading = false;

  _callAPIPOstOrder(BuildContext context) {
    this.setState(() {
      isLoading = true;
    });

    // Map<String, dynamic> body = Map<String, dynamic>();

    var rawBody;
    OrderModel orderModel = new OrderModel();

    orderModel.products = [];

    widget.collectionProduct.forEach((CollectionProduct element) {
      List<Optional> opt = [];

      element.productOptional.forEach((element) {
        opt.add(Optional(
          name: element.name,
          price: int.parse(element.price),
        ));
      });

      orderModel.products.add(new Products(
          sID: int.parse(element.sId),
          cID: element.collection,
          pID: element.id,
          quantity: 2,
          optional: opt));
      orderModel.totalPrice = int.parse(element.price);
      orderModel.discount = 20;
      orderModel.clientName = nameController.text;
      orderModel.clientAddress = addressConroller.text;
      orderModel.clientPhone = numberController.text;
      orderModel.paymentStatus = "pending";
      orderModel.orderStatus = "pending";
      orderModel.paymentMethod = "cod";
      orderModel.userId = userID;
      orderModel.specialRequest = commentController.text;
    });

    Map<String, String> header = Map<String, String>();
    rawBody = jsonEncode(orderModel);

    FocusScope.of(context).requestFocus(FocusNode());
    log(jsonEncode(rawBody));

    ApiManager networkCal = ApiManager(
        APIConstants.addOrder, null, false, header,
        rawBody: rawBody);

    networkCal.callPostAPI(context).then((response) {
      // log(jsonEncode(response));
      print('Back from api');

      this.setState(() {
        isLoading = false;
      });

      bool status = response['status'];
      if (status == true) {
        // homeObject = HomeObject.fromMap(response);
        // if (homeObject != null) {
        //   apisnapshot = homeObject.response;
        // }
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
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        title: Text(
          "My Cart",
          style: TextStyle(
            fontSize: size.width * 0.043,
            fontWeight: FontWeight.bold,
            color: colorBlack,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.collectionProduct.isEmpty
                    ? 0
                    : widget.collectionProduct.length,
                itemBuilder: (context, index) => CartItem(
                  prod: widget.collectionProduct[index],
                ),
              ),

              SizedBox(
                height: size.height * 0.02,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     "Item Recommended",
              //     style: TextStyle(
              //       fontSize: size.width * 0.045,
              //       fontWeight: FontWeight.bold,
              //       color: colorBlack,
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: size.width * 0.02),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(
              //         size.width * 0.034,
              //       ),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.grey.withOpacity(0.5),
              //           spreadRadius: 2,
              //           blurRadius: 5,
              //           offset: Offset(1, 0), // changes position of shadow
              //         ),
              //       ]),
              //   child: Row(
              //     children: [
              //       ClipRRect(
              //         borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(
              //             size.width * 0.034,
              //           ),
              //           bottomLeft: Radius.circular(
              //             size.width * 0.034,
              //           ),
              //         ),
              //         child: Image.network(
              //           "https://dummyimage.com/600x400/000/fff",
              //           height: size.width * 0.345,
              //           width: size.width * 0.32,
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //       SizedBox(
              //         width: size.width * 0.025,
              //       ),
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: [
              //             SizedBox(
              //               height: size.width * 0.01,
              //             ),
              //             Row(
              //               children: [
              //                 Text(
              //                   "Chef's Burger",
              //                   style: TextStyle(
              //                     color: colorBlack,
              //                     fontSize: size.width * 0.039,
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //                 Spacer(),
              //                 Container(
              //                   height: size.width * 0.085,
              //                   width: size.width * 0.085,
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(
              //                           size.width * 0.02),
              //                       color: colorText),
              //                   child: Center(
              //                     child: IconButton(
              //                       icon: Icon(
              //                         Icons.favorite_border,
              //                         color: Colors.white,
              //                         size: size.width * 0.045,
              //                       ),
              //                       onPressed: () {},
              //                     ),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: size.width * 0.03,
              //                 )
              //               ],
              //             ),
              //             // SizedBox(
              //             //   height: size.height * 0.01,
              //             // ),
              //             Container(
              //               width: size.width * 0.4,
              //               child: Text(
              //                 "Bread, grilled meat, lettuce,Sandwich feature two saveryflame-grilled beef patties",
              //                 style: TextStyle(
              //                   color: colorBlack,
              //                   fontSize: size.width * 0.029,
              //                 ),
              //               ),
              //             ),
              //             SizedBox(
              //               height: size.height * 0.01,
              //             ),
              //             Row(
              //               children: [
              //                 Text(
              //                   "\$" + "16.19",
              //                   style: TextStyle(
              //                     color: colorPrimary,
              //                     fontSize: size.width * 0.039,
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //                 Spacer(),
              //                 Container(
              //                   height: size.width * 0.085,
              //                   width: size.width * 0.1,
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(
              //                           size.width * 0.02),
              //                       color: colorText),
              //                   child: Center(
              //                     child: IconButton(
              //                       icon: Icon(
              //                         Icons.add,
              //                         color: Colors.white,
              //                         size: size.width * 0.045,
              //                       ),
              //                       onPressed: () {},
              //                     ),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: size.width * 0.04,
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               height: size.width * 0.01,
              //             ),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              CustomTextField(
                prefixIcon: Icon(
                  Icons.add,
                  color: colorText,
                ),
                hint: "Add cooking instructions or any comment",
                textEditingController: commentController,
                maxLines: 6,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Adress",
                      style: TextStyle(
                        fontSize: size.width * 0.043,
                        fontWeight: FontWeight.w500,
                        color: colorBlack,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        HelperFunctions.showAlert(
                            context: context,
                            header: "Edit delivery address",
                            isDissmissOnTapAround: true,
                            widget: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomTextField(
                                  hint: "Enter Name",
                                  textEditingController: nameController,
                                ),
                                CustomTextField(
                                  hint: "Enter Number",
                                  textEditingController: numberController,
                                ),
                                CustomTextField(
                                  hint: "Enter Address",
                                  textEditingController: addressConroller,
                                )
                              ],
                            ),
                            btnDoneText: "Ok",
                            btnCancelText: "Cancel",
                            onDone: () {},
                            onCancel: () {});
                      },
                      child: Icon(
                        Icons.mode_edit,
                        color: colorText,
                        size: size.width * 0.065,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.02,
                    horizontal: size.width * 0.05),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(1, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameController.text.isEmpty
                          ? "Enter Name"
                          : nameController.text,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.035,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      numberController.text.isEmpty
                          ? "Enter number"
                          : numberController.text,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: size.width * 0.035,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Container(
                      width: size.width * 0.4,
                      child: Text(
                        addressConroller.text.isEmpty
                            ? "Enter address"
                            : addressConroller.text,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width * 0.035,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment Method",
                      style: TextStyle(
                        fontSize: size.width * 0.043,
                        fontWeight: FontWeight.w500,
                        color: colorBlack,
                      ),
                    ),
                    Icon(
                      Icons.mode_edit,
                      color: colorText,
                      size: size.width * 0.065,
                    )
                  ],
                ),
              ),
              Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                      horizontal: size.width * 0.05),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(1, 0),
                    ),
                  ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(size.width * 0.02),
                        decoration: BoxDecoration(
                            color: value1
                                ? colorText
                                : Colors.grey.withOpacity(0.5),
                            borderRadius:
                                BorderRadius.circular(size.width * 0.02)),
                        child: Row(
                          children: [
                            Text(
                              "By Cash",
                              style: TextStyle(
                                color: value1 ? colorWhite : colorBlack,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.025,
                            ),
                            Center(
                                child: InkWell(
                              onTap: () {
                                setState(() {
                                  value1 = !value1;
                                  value2 = false;
                                });
                              },
                              child: CheckContainer(
                                value: value1,
                              ),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(size.width * 0.02),
                        decoration: BoxDecoration(
                            color: value2
                                ? colorText
                                : Colors.grey.withOpacity(0.5),
                            borderRadius:
                                BorderRadius.circular(size.width * 0.02)),
                        child: Row(
                          children: [
                            Text(
                              "By Card",
                              style: TextStyle(
                                color: value2 ? colorWhite : colorBlack,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.025,
                            ),
                            Center(
                                child: InkWell(
                              onTap: () {
                                setState(() {
                                  value2 = !value2;
                                  value1 = false;
                                });
                              },
                              child: CheckContainer(
                                value: value2,
                              ),
                            )),
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: size.height * 0.015,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hint: "Add Promo code",
                      textEditingController: promoController,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.07,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Custombutton(
                          buttonHeight: size.height * 0.055,
                          backgroundColor: Colors.white,
                          borderColor: colorPrimary,
                          title: "Apply Code",
                          titleColor: colorPrimary,
                          onPress: () {},
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Item total ",
                        style: TextStyle(
                          fontSize: size.width * 0.034,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "15",
                        style: TextStyle(
                          fontSize: size.width * 0.034,
                          fontWeight: FontWeight.bold,
                          color: colorBlack,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Text(
                        "Grand Total",
                        style: TextStyle(
                          fontSize: size.width * 0.034,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "\$16.19",
                        style: TextStyle(
                          fontSize: size.width * 0.036,
                          fontWeight: FontWeight.bold,
                          color: colorBlack,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery Charge",
                        style: TextStyle(
                          fontSize: size.width * 0.034,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "\$16.19",
                        style: TextStyle(
                          fontSize: size.width * 0.034,
                          fontWeight: FontWeight.bold,
                          color: colorBlack,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
              Custombutton(
                backgroundColor: colorPrimary,
                onPress: () {
                  _btnActionPlaceOrder(context);
                },
                title: "Confirm Order",
                isTitleBold: true,
                titleColor: colorWhite,
              ),
              SizedBox(
                height: size.height * 0.015,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
