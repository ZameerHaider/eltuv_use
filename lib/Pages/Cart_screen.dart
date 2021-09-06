import 'package:eltuv_use/AppColors.dart';
import 'package:eltuv_use/Data/response/HomeResponse.dart';
import 'package:eltuv_use/Pages/order_screen.dart';
import 'package:eltuv_use/Widget/PersonInput.dart';
import 'package:eltuv_use/Widget/customTextField.dart';
import 'package:eltuv_use/Widget/custom_button.dart';
import 'package:eltuv_use/utilities/helper_functions.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  Map<String, CollectionProduct> collectionProduct;
  CartScreen({this.collectionProduct});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CollectionProduct> cartProductsList = [];

  // @override
  // void initState() {
  //   cartProductsList.add(widget.collectionProduct);
  //   super.initState();
  // }

  bool value1 = false;
  bool value2 = false;
  final commentController = TextEditingController();
  final promoController = TextEditingController();
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final addressConroller = TextEditingController();
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
                      "Christine Ortiz",
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
                      "+92 0123456789",
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
                        "No 123, Sub Street, Main Street,City Name, Province, Country ",
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
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: value1
                                      ? Icon(
                                          Icons.check,
                                          size: size.width * 0.04,
                                          color: colorText,
                                        )
                                      : Icon(
                                          Icons.check_box_outline_blank,
                                          size: size.width * 0.04,
                                          color: colorWhite,
                                        ),
                                ),
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
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: value2
                                      ? Icon(
                                          Icons.check,
                                          size: size.width * 0.04,
                                          color: colorText,
                                        )
                                      : Icon(
                                          Icons.check_box_outline_blank,
                                          size: size.width * 0.04,
                                          color: colorWhite,
                                        ),
                                ),
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
                        "\$16.19",
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => OrderScreen()));
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

class CartItem extends StatefulWidget {
  CollectionProduct prod;
  int counter = 1;

  CartItem({
    this.prod,
    this.counter,
  });

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  Map<String, CollectionProduct> cartItemsList = {};

  void updatecart(CollectionProduct product) {
    if (cartItemsList.containsKey(product.id)) {
      cartItemsList.update(
          product.id.toString(),
          (value) => CollectionProduct(
              id: value.id,
              image: value.image,
              collection: value.collection,
              createdAt: value.createdAt,
              description: value.description,
              discount: value.discount,
              optional: value.optional,
              price: value.price,
              productOptional: value.productOptional,
              sId: value.sId,
              quantity: value.quantity + 1,
              title: value.title,
              updatedAt: value.updatedAt));
    } else {
      cartItemsList.putIfAbsent(
          product.id.toString(),
          () => CollectionProduct(
              id: product.id,
              image: product.image,
              collection: product.collection,
              createdAt: product.createdAt,
              description: product.description,
              discount: product.discount,
              optional: product.optional,
              price: product.price,
              productOptional: product.productOptional,
              sId: product.sId,
              quantity: 1,
              title: product.title,
              updatedAt: product.updatedAt));
      print(cartItemsList.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.width * 0.02),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            size.width * 0.034,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(1, 0), // changes position of shadow
            ),
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                size.width * 0.034,
              ),
              bottomLeft: Radius.circular(
                size.width * 0.034,
              ),
            ),
            child: Image.network(
              widget.prod.image,
              height: size.width * 0.345,
              width: size.width * 0.32,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: size.width * 0.025,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: size.width * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      widget.prod.title,
                      style: TextStyle(
                        color: colorBlack,
                        fontSize: size.width * 0.039,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: size.width * 0.085,
                      width: size.width * 0.085,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.02),
                          color: colorText),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: size.width * 0.045,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    )
                  ],
                ),
                Container(
                  width: size.width * 0.4,
                  child: Text(
                    widget.prod.description,
                    style: TextStyle(
                      color: colorBlack,
                      fontSize: size.width * 0.029,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  children: [
                    Text(
                      "\$" + widget.prod.price,
                      style: TextStyle(
                        color: colorPrimary,
                        fontSize: size.width * 0.039,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        counterContainer(
                            size,
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                color: colorText,
                                size: size.width * 0.045,
                              ),
                              onPressed: () {
                                updatecart(widget.prod);
                              },
                            ),
                            true),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Container(
                          height: size.width * 0.085,
                          width: size.width * 0.043,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          child: Center(
                            child: Text(
                              widget.prod.quantity.toString(),
                              style: TextStyle(
                                  fontSize: size.width * 0.034,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        // CustomTextField(
                        //   textEditingController: widget.prodCountController,
                        //   hint: counter.toString(),
                        // ),
                        counterContainer(
                            size,
                            IconButton(
                              icon: Icon(
                                Icons.remove,
                                color: colorPrimary,
                                size: size.width * 0.045,
                              ),
                              onPressed: () {
                                // updateCounter(false);
                              },
                            ),
                            false)
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                  ],
                ),
                // SizedBox(
                //   height: size.width * 0.01,
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container counterContainer(Size size, Widget container, bool isAdd) {
    return Container(
        height: size.width * 0.085,
        width: size.width * 0.08,
        decoration: BoxDecoration(
          borderRadius: isAdd
              ? BorderRadius.only(
                  topLeft: Radius.circular(size.width * 0.02),
                  bottomLeft: Radius.circular(size.width * 0.02))
              : BorderRadius.only(
                  topRight: Radius.circular(size.width * 0.02),
                  bottomRight: Radius.circular(size.width * 0.02)),
          color: Colors.grey.withOpacity(0.4),
        ),
        child: container);
  }
}
