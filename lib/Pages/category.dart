import 'package:flutter/material.dart';

class category extends StatefulWidget {

  @override
  _categoryState createState() => _categoryState();
}

class _categoryState extends State<category> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Go back',style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Color(0xffC70039),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffC70039), Color(0xffC70039), Colors.white],
                )),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: size.width*0.03),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('Food',style: TextStyle(color: Colors.white,fontSize: size.height*0.03),)),
                ),
                SizedBox(height: size.height*0.02,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                              child: Row(
                            children: [
                              Text(
                                "Promo",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: size.height*0.02,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          )));
                    },
                  ),
                ),
                SizedBox(height: size.height*0.02,),
              ],
            ),
          ),









      ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: size.height*0.03,),
                  Stack(
                    children: [
                      Image.asset('images/burger.png'),
                      Positioned(
                          top: 10,
                          left: 15,
                          child: Image.asset('images/logo.png')),
                    ],
                  ),
                  SizedBox(height: size.height*0.01,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: size.width*0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Burger King',style: TextStyle(fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            Icon(Icons.star,color: Colors.amber,),
                            Text('4.5/5')
                          ],
                        ),

                      ],
                    ),
                  ),
              SizedBox(
                height: size.height*0.01,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: size.width*0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Material(
                            color: Color(0xffBFA5A4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: size.width*0.02),
                              child: Text('Fast Food',style: TextStyle(color: Colors.white),),
                            )),
                        Material(
                            color: Color(0xffBFA5A4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: size.width*0.02),
                              child: Text('Pizza',style: TextStyle(color: Colors.white),),
                            )),
                        Material(
                            color: Color(0xffBFA5A4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: size.width*0.02),
                              child: Text('Sushi',style: TextStyle(color: Colors.white),),
                            )),
                      ],
                    ),

                    Material(
                        color: Color(0xffC70034),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: size.width*0.02),
                          child: Text('\$3.00',style: TextStyle(color: Colors.white),),
                        )),
                  ],
                ),
              ),


                ],
              ),


            );
          }
      ),


















        ],

      ),
    );
  }
}
