import 'package:flutter/material.dart';

class favourite extends StatefulWidget {


  @override
  _favouriteState createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Favourites',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.03),
              child: Container(
                margin:
                EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  cursorColor: Colors.black12,
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Color(0xff84A100)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xff84A100),
                      size: MediaQuery.of(context).size.height * 0.03,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
              ),
            ),
            Chip(
              label: const Text('Burgers',style: TextStyle(color: Color(0xff84A100)),),
            ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal:MediaQuery
        .of(context)
        .size
        .width * 0.03),
      child: Container(
        width: double.infinity,
        height:MediaQuery
            .of(context)
            .size
            .height * 1.0 ,
        child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: MediaQuery
                  .of(context)
                  .size
                  .width * 0.02),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    MediaQuery
                        .of(context)
                        .size
                        .width * 0.030,

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
                        MediaQuery
                            .of(context)
                            .size
                            .width * 0.034,
                      ),
                      bottomLeft: Radius.circular(
                        MediaQuery
                            .of(context)
                            .size
                            .width * 0.034,
                      ),
                    ),
                    child: Image.network(
                      "https://dummyimage.com/600x400/000/fff",
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.20,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.31,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.020,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.01,
                        ),
                        Row(
                          children: [
                            Text(
                              "Chef's Burger",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.039,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.050,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.085,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.02),
                                  color: Color(0xffC70034)),
                              child: Center(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                    size: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.045,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.03,
                            )
                          ],
                        ),
                        // SizedBox(
                        //   height: size.height * 0.01,
                        // ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.4,
                          child: Text(
                            "Bread, grilled meat, lettuce,Sandwich feature two saveryflame-grilled beef patties",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.029,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.01,
                        ),
                        Row(
                          children: [
                            Text(
                              "\$" + "16.19",
                              style: TextStyle(
                                color: Color(0xffc70034),
                                fontSize: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.039,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.085,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.02),
                                  color: Color(0xff84A100)),
                              child: Center(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.045,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.04,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * 0.01,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
        }
        ),
      ),
    ),

    ]
    ),
      ), 
    );
  }
  }

