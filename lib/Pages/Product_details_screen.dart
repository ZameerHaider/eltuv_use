import 'package:eltuv_use/Data/Utils/AppUtils.dart';
import 'package:eltuv_use/Data/response/HomeResponse.dart';
import 'package:eltuv_use/Pages/Cart_screen.dart';
import 'package:eltuv_use/Widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppColors.dart';

class ProductDetailsScreen extends StatefulWidget {
  final CollectionProduct product;
  ProductDetailsScreen({this.product});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: size.height * 0.335,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.product ==null ? "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg " :widget.product.image ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  top: 250,
                  child: Container(
                    width: size.width,
                    height: size.height * 0.03,
                    decoration: BoxDecoration(
                        color: colorWhite,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: size.width * 0.015),
                            height: size.width * 0.1,
                            width: size.width * 0.1,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.02),
                                color: Colors.white),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: colorPrimary,
                              size: size.width * 0.065,
                            ),
                          ),
                        ),
                        Container(
                          height: size.width * 0.1,
                          width: size.width * 0.1,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.02),
                              color: colorText),
                          child: Center(
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: size.width * 0.065,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.26,
                    ),
                    // Container(
                    //   height: size.width * 0.2,
                    //   width: size.width * 0.2,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(size.width * 0.5),
                    //     // image: DecorationImage(
                    //     //     image: NetworkImage(widget.store.images[1])
                    //   ),
                    //   child: Image.network(widget.store.images[1]),
                    // ),

                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.title,
                          style: TextStyle(
                              fontSize: size.width * 0.039,
                              color: colorBlack,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$" + widget.product.price.toString(),
                          style: TextStyle(
                              fontSize: size.width * 0.039,
                              color: colorPrimary,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.product.description,
                      style: TextStyle(
                        fontSize: size.width * 0.034,
                        color: colorgrey,
                      ),
                    ),

                    SizedBox(height: 25),
                    Text(
                      "Let's make it better?",
                      style: TextStyle(
                          fontSize: size.width * 0.036,
                          color: colorPrimary,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 25),
                    Column(
                        children: widget.product.productOptional
                            .map(
                              (e) => Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: colorPrimary,
                                    value: e.isoptSelected,
                                    onChanged: (value) {
                                      setState(() {
                                        e.isoptSelected = value;
                                      });
                                    },
                                  ),
                                  Text(
                                    e.name,
                                    style: TextStyle(
                                      fontSize: size.width * 0.036,
                                      color: e.isoptSelected
                                          ? colorBlack
                                          : colorgrey,
                                      fontWeight: e.isoptSelected
                                          ? FontWeight.w700
                                          : FontWeight.w400,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "\$" + e.price,
                                    style: TextStyle(
                                      fontSize: size.width * 0.036,
                                      color: e.isoptSelected
                                          ? colorBlack
                                          : colorgrey,
                                      fontWeight: e.isoptSelected
                                          ? FontWeight.w700
                                          : FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList()),
                    SizedBox(
                      height: size.height * 0.25,
                    ),
                    Custombutton(
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      title: "Any special request?",
                      isTitleBold: true,
                      titleColor: colorgrey,
                      prefixicon: "images/add.png",
                      onPress: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => CartScreen(
                        //           collectionProduct: cartItemsList,
                        //         )));
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Custombutton(
                      backgroundColor: colorPrimary,
                      title: "Add to cart",
                      isTitleBold: true,
                      titleColor: colorWhite,
                      prefixicon: "images/addw.png",
                      postFixText: "\$" + widget.product.price,
                      onPress: () {
                        Provider.of<HomeProvider>(context, listen: false)
                            .updatecart(widget.product, context);
                        // if (Provider.of<HomeProvider>(context, listen: false)
                        //         .cartItemsList
                        //         .length <
                        //     1) {
                        //   Provider.of<HomeProvider>(context, listen: false)
                        //       .updatecart(widget.product);

                        //   final snackBars = SnackBar(
                        //     content: const Text('Item added in cart'),
                        //     action: SnackBarAction(
                        //       label: 'undo',
                        //       onPressed: () {
                        //         Provider.of<HomeProvider>(context,
                        //                 listen: false)
                        //             .cartItemsList
                        //             .removeWhere((element) =>
                        //                 element.id == widget.product.id);
                        //       },
                        //     ),
                        //   );
                        //   ScaffoldMessenger.of(context).showSnackBar(snackBars);
                        // } else {
                        //   final snackBar = SnackBar(
                        //     content: const Text('Item already exits in cart'),
                        //     action: SnackBarAction(
                        //       label: 'Remove',
                        //       onPressed: () {
                        //         Provider.of<HomeProvider>(context,
                        //                 listen: false)
                        //             .cartItemsList
                        //             .removeWhere((element) =>
                        //                 element.id == widget.product.id);
                        //       },
                        //     ),
                        //   );
                        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        // }
                        print(Provider.of<HomeProvider>(context, listen: false)
                            .cartItemsList
                            .length);

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartScreen(
                                  collectionProduct: Provider.of<HomeProvider>(
                                          context,
                                          listen: false)
                                      .cartItemsList,
                                )));
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
