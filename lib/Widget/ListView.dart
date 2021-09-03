import 'package:eltuv_use/Data/response/HomeResponse.dart';
import 'package:eltuv_use/Pages/Product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../AppColors.dart';

class listView extends StatefulWidget {
  List<Store> storeList;
  listView({this.storeList});

  _listViewState createState() => _listViewState();
}

class _listViewState extends State<listView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: widget.storeList == null ? 0 : widget.storeList.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductScreen(
                      store: widget.storeList[index],
                    )));
          },
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Material(
                  elevation: 5,
                  color: colorWhite,
                  borderRadius: BorderRadius.circular(15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height * 0.18,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            image: DecorationImage(
                              image: NetworkImage(
                                widget.storeList[index].images == null
                                    ? "https://i2.wp.com/asvs.in/wp-content/uploads/2017/08/dummy.png"
                                    : widget.storeList[index].images[0],
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03,
                              vertical: size.height * 0.014),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.storeList[index].storeName,
                                    style: TextStyle(
                                        fontSize: size.height * 0.02,
                                        color: colorBlack,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: size.width * 0.065,
                                        color: Colors.yellow,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      Text(
                                        "4.5/5",
                                        style: TextStyle(
                                            fontSize: size.height * 0.02,
                                            color: colorBlack,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.035,
                                        vertical: size.width * 0.01),
                                    decoration: BoxDecoration(
                                        color: colorBorder,
                                        borderRadius: BorderRadius.circular(
                                            size.width * 0.034)),
                                    child: Text(
                                      "Fast Food",
                                      style: TextStyle(
                                          fontSize: size.height * 0.02,
                                          color: colorWhite,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Container(
                                    // width: size.width * 0.3,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.035),
                                    decoration: BoxDecoration(
                                        color: colorPrimary,
                                        borderRadius: BorderRadius.circular(
                                            size.width * 0.034)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.motorcycle,
                                          size: size.width * 0.065,
                                          color: colorWhite,
                                        ),
                                        SizedBox(
                                          width: size.width * 0.01,
                                        ),
                                        Text(
                                          "\$" +
                                              widget.storeList[index].minOrder,
                                          style: TextStyle(
                                              fontSize: size.height * 0.02,
                                              color: colorWhite,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]))),
        );
      },
    );
  }
}
