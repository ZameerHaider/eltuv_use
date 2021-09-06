import 'package:eltuv_use/Widget/custom_button.dart';
import 'package:eltuv_use/Widget/simpletextfield.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class payment extends StatefulWidget {
  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Payments',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 8,
                viewportFraction: 1,
              ),
              items: imgList
                  .map((item) => Container(
                        child: Image.network(item),
                        color: Colors.green,
                      ))
                  .toList(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.01),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Insert new\n card',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.03),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Cardholder Name')),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            simpletextfield(hinttext: 'Please Enter name',),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Card Number')),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            simpletextfield(hinttext: 'Please Enter card number',),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Expire Date')),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            simpletextfield(hinttext: 'Please Enter Expire Date',),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Custombutton(
              onPress: (){},
              title: 'Add',
              titleColor: Colors.white,
              backgroundColor: Color(0xffC70034),
            )
          ],
        ),
      ),
    );
  }
}
