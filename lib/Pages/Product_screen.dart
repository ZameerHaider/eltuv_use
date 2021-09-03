import 'package:eltuv_use/Data/response/HomeResponse.dart';
import 'package:eltuv_use/Pages/Product_details_screen.dart';
import 'package:eltuv_use/Pages/trackorder/trackorder.dart';
import 'package:flutter/material.dart';

import '../AppColors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductScreen extends StatefulWidget {
  Store store;
  ProductScreen({this.store});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<CollectionProduct> collectionProducts = [];

  @override
  void initState() {
    super.initState();
    if (widget.store.collection.isNotEmpty) {
      collectionProducts = widget.store.collection[0].collectionProducts;
    }
  }

  void updateList(int index) {
    setState(() {
      if (widget.store.collection != null &&
          widget.store.collection[index].collectionProducts != null) {
        collectionProducts = widget.store.collection[index].collectionProducts;
      }
    });
  }

  Color backgroudColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorWhite,
      floatingActionButton: Padding(
        padding:  EdgeInsets.only(left: size.width*0.07),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffC70039),
            borderRadius: BorderRadius.circular(10)
          ),
          height: size.height*0.09,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Text('0 items',style: TextStyle(color: Colors.grey),),
                    SizedBox(height: size.height*0.01,),
                    Text('\$00.00',style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              Row(
                children: [
                  Text('View cart',style: TextStyle(color: Colors.white),),
                  FloatingActionButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => trackorder()),
                        );
                      },
                      backgroundColor:Color(0xffC70039) ,
                      elevation: 0,
                      child: Icon(Icons.chevron_right,color: Colors.white,))
                ],
              ),

            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              CarouselSlider(
                  items: widget.store.images
                      .map(
                        (e) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(e),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: size.height * 0.335,
                    autoPlay: true,
                    aspectRatio: 16 / 7,
                    viewportFraction: 1,
                  )),
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
                    Text(
                      widget.store.storeName,
                      style: TextStyle(
                          fontSize: 25.0,
                          color: colorBlack,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      children: widget.store.food
                          .map(
                            (e) => Container(
                              margin: EdgeInsets.only(right: size.width * 0.01),
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.035,
                                  vertical: size.width * 0.01),
                              decoration: BoxDecoration(
                                  color: colorBorder,
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.02)),
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: size.height * 0.02,
                                    color: colorWhite,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          )
                          .toList(),
                    ),

                    SizedBox(height: 25),
                    _category(
                        image: "images/maps.png", text: widget.store.address),
                    _category(
                        image: "images/time.png",
                        text: widget.store.openTime +
                            " - " +
                            widget.store.closeTime),
                    // _category(
                    //     image: "images/calls.png", text: "+1 00000 000 00"),
                    // _category(image: "images/min.png", text: "(min.order\$50)"),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Product ",
                              style: TextStyle(
                                  fontSize: size.width * 0.047,
                                  color: colorBlack,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "(min order \$" + widget.store.minOrder + ")",
                              style: TextStyle(
                                  fontSize: size.width * 0.034,
                                  color: colorBlack,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(size.width * 0.02),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                "images/calls.png",
                                color: colorText,
                                height: size.width * 0.065,
                                width: size.width * 0.065,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Container(
                              padding: EdgeInsets.all(size.width * 0.02),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                "images/directions.png",
                                height: size.width * 0.065,
                                width: size.width * 0.065,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    // Collection List Horizontal
                    Container(
                      height: size.width * 0.1,
                      margin: EdgeInsets.only(top: size.width * 0.1),
                      child: ListView.builder(
                          itemCount: widget.store.collection == null
                              ? 0
                              : widget.store.collection.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  print("btn tapped");
                                  for (var i = 0;
                                      i < widget.store.collection.length;
                                      i++) {
                                    setState(() {
                                      widget.store.collection[i].isSelected =
                                          false;
                                    });
                                  }
                                  widget.store.collection[index].isSelected =
                                      true;
                                  updateList(index);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(size.width * 0.01),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.034,
                                    vertical: size.width * 0.015,
                                  ),
                                  // height: size.width * 0.05,
                                  // width: size.width * 0.3,
                                  decoration: BoxDecoration(
                                      color: widget.store.collection[index]
                                                  .isSelected ==
                                              true
                                          ? colorPrimary
                                          : colorWhite,
                                      border: Border.all(color: colorText),
                                      borderRadius: BorderRadius.circular(
                                        size.width * 0.02,
                                      )),
                                  child: Text(
                                    widget.store.collection[index].name,
                                    style: TextStyle(
                                        color: widget.store.collection[index]
                                                    .isSelected ==
                                                true
                                            ? colorWhite
                                            : colorText,
                                        fontSize: size.width * 0.04),
                                  ),
                                ),
                              )),
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    // Collection Products List
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: collectionProducts == null
                          ? 0
                          : collectionProducts.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen(
                                    product: collectionProducts[index],
                                  )));
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: size.width * 0.02),
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
                                  offset: Offset(
                                      1, 0), // changes position of shadow
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
                                  collectionProducts[index].image,
                                  height: size.width * 0.31,
                                  width: size.width * 0.31,
                                  fit: BoxFit.fill,
                                  errorBuilder: (BuildContext context,
                                      Object exception, StackTrace stackTrace) {
                                    return Image(
                                        height: size.width * 0.31,
                                        width: size.width * 0.31,
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            "https://i2.wp.com/asvs.in/wp-content/uploads/2017/08/dummy.png"));
                                  },
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.025,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: size.width * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          collectionProducts[index].title,
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
                                                  BorderRadius.circular(
                                                      size.width * 0.02),
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
                                    // SizedBox(
                                    //   height: size.height * 0.01,
                                    // ),
                                    Container(
                                      width: size.width * 0.4,
                                      child: Text(
                                        collectionProducts[index].description,
                                        style: TextStyle(
                                          color: colorBlack,
                                          fontSize: size.width * 0.029,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "\$" +
                                              collectionProducts[index].price,
                                          style: TextStyle(
                                            color: colorPrimary,
                                            fontSize: size.width * 0.039,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          height: size.width * 0.085,
                                          width: size.width * 0.1,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      size.width * 0.02),
                                              color: colorText),
                                          child: Center(
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: size.width * 0.045,
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.04,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.width * 0.01,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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

  Widget _category({text, image}) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        children: [
          Image.asset(
            image ?? "",
            height: size.height * 0.02,
          ),
          SizedBox(width: size.width * 0.06),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: size.width * 0.038, color: colortext),
            ),
          ),
        ],
      ),
    );
  }
}
