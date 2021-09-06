import 'package:eltuv_use/Data/response/HomeResponse.dart';

import 'package:eltuv_use/Widget/counterContainer.dart';
import 'package:flutter/material.dart';

import '../AppColors.dart';

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
}
