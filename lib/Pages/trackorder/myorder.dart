import 'package:flutter/material.dart';

class myorder extends StatefulWidget {
  @override
  _myorderState createState() => _myorderState();
}

class _myorderState extends State<myorder> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffC70039),
        title: Text(
          'My Order',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffC70039), Color(0xffC70039), Colors.white],
              )),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04, vertical: size.height * 0.02),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: MaterialButton(
                        onPressed: () {},
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: size.height * 0.02),
                          child: Text(
                            'New Order',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Expanded(
                      flex: 1,
                      child: MaterialButton(
                        onPressed: () {},
                        color: Color(0xffC70039),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: size.height * 0.02),
                          child: Text(
                            'Order History',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                    .height * 0.8 ,
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
                                      Text('\$16.19',style:TextStyle(fontWeight: FontWeight.bold,color: Color(0xffC70034)),),

                                      SizedBox(
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.03,
                                      )
                                    ],
                                  ),
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
                                      Icon(Icons.watch_later_outlined,color: Colors.black12,),
                                      Text(
                                        "12 May 2018",
                                        style: TextStyle(
                                          color: Colors.black12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Material(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10)),
                                          color: Color(0xff84A100),
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: size.width*0.02),
                                            child: Row(
                                              children: [
                                                Icon(Icons.refresh,color: Colors.white,),
                                                Text('Reorder',style: TextStyle(color: Colors.white),),
                                              ],
                                            ),
                                          )),

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


          ],
        ),
      ),
    );
  }
}
