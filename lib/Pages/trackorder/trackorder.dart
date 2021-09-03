import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:tuple/tuple.dart';
import 'package:ddlog/ddlog.dart';
import 'package:intl/intl.dart';

class trackorder extends StatefulWidget {


  @override
  _trackorderState createState() => _trackorderState();

}

int groupValue = 0;

StepperType _type = StepperType.vertical;
String formatTimeOfDay(TimeOfDay tod) {
  final now = new DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
  final format = DateFormat.jm(); //"6:00 AM"
  return format.format(dt);
}

List<Tuple2> tuples = [
  Tuple2(
    "Order Recieved",
    "Your Order has been recieved",
  ),
  Tuple2(
    "Order Confirmed",
    "Merchant accepted your order",
  ),

  Tuple2(
    "Your Driver",
    "Your Order has been picked up by Brain",
  ),
  Tuple2(
    "Delivery in Progress",
    "Your Order is on its way to you",
  ),
  Tuple2(
    "Delivered",
    "Your Order is on its way to you",
  ),

  // Tuple2(Icons.directions_boat, StepState.disabled, ),
  // Tuple2(Icons.directions_car, StepState.error, ),
];

int _index = 0;




















class _trackorderState extends State<trackorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Tarcking order',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.09,
                ),
                Text('Order id',style: TextStyle(color: Colors.black12),),
                Text('#132445456')
              ],
            ),
                   buildStepperCustom(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ordered from',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Burger King',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff84A100)),),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.04,),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                ),
                width: double.infinity,
                height:MediaQuery.of(context).size.height*0.15,
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                        child: Image.asset('images/food.png')),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02,
                      vertical: MediaQuery.of(context).size.height*0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Chef’s Burger',style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height:MediaQuery.of(context).size.height*0.02 ,),
                          Row(
                            children: [
                              Text('\$16.19',style:TextStyle(fontWeight: FontWeight.bold,color: Color(0xffC70039)),),
                              SizedBox(width:MediaQuery.of(context).size.width*0.30 ,),
                              Material(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(5),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03,
                                        vertical: MediaQuery.of(context).size.height*0.01),
                                    child: Text('1'),
                                  ))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.04,),
            Rowtext(inputtext: 'Item total ',fontsize:MediaQuery.of(context).size.height*0.02 ,
            color: Colors.black12,inputtext2: '\$16.19',fontsize2:MediaQuery.of(context).size.height*0.02 ,
            fontWeight: FontWeight.w600,),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Rowtext(inputtext: 'Delivery Charge ',fontsize:MediaQuery.of(context).size.height*0.02 ,
              color: Colors.black12,inputtext2: '\$5',fontsize2:MediaQuery.of(context).size.height*0.02 ,
              fontWeight: FontWeight.w600,),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Rowtext(inputtext: 'Grand Total ',fontsize:MediaQuery.of(context).size.height*0.02 ,
              color: Colors.black,inputtext2: '\$21.19',fontsize2:MediaQuery.of(context).size.height*0.04 ,
              fontWeight: FontWeight.w600,),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Rowtext(inputtext: 'Payment method ',fontsize:MediaQuery.of(context).size.height*0.02 ,
              color: Colors.black12,inputtext2: 'Visa card',fontsize2:MediaQuery.of(context).size.height*0.02 ,
              fontWeight: FontWeight.w600,),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),



          ],
        ),
      ),
    );
  }
  void go(int index) {
    if (index == -1 && _index <= 0) {
      ddlog("it's first Step!");
      return;
    }

    if (index == 1 && _index >= tuples.length - 1) {
      ddlog("it's last Step!");
      return;
    }

    setState(() {
      _index += index;
    });
  }

  Widget buildStepperCustom(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return EnhanceStepper(
        stepIconSize: 60,
        type: _type,
        horizontalTitlePosition: HorizontalTitlePosition.bottom,
        horizontalLinePosition: HorizontalLinePosition.top,
        currentStep: _index,
        physics: ClampingScrollPhysics(),
        steps: tuples
            .map((e) =>
            EnhanceStep(
              icon: Icon(
                Icons.check_box,
                // Icons.add,
                color: _index >= tuples.indexOf(e)
                    ? Colors.red
                    : Color(0xff808080),
                size: size.width * 0.085,
              ),
              // state: StepState.values[tuples.indexOf(e)],
              isActive: _index == tuples.indexOf(e),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(e.item1),
                  Text(formatTimeOfDay(
                    TimeOfDay.now(),
                  ))
                ],
              ),
              subtitle: Text(e.item2),
              content: _index == 2
                  ? Container(
                decoration: BoxDecoration(),
              )
                  : Container(),
            ))
            .toList(),
        onStepCancel: () {
          go(-1);
        },
        onStepContinue: () {
          go(1);
        },
        onStepTapped: (index) {
          if (index == 1) {
            contactinfo();
          }

          ddlog(index);
          setState(() {
            _index = index;
          });
        },
        controlsBuilder: (BuildContext context,
            {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
          return Row(
            children: [
              // SizedBox(
              //   height: 30,
              // ),
              // ElevatedButton(
              //   onPressed: onStepContinue,
              //   child: Text("Next"),
              // ),
              // SizedBox(
              //   width: 8,
              // ),
              // TextButton(
              //   onPressed: onStepCancel,
              //   child: Text("Back"),
              // ),
            ],
          );
        });
  }
  Widget contactinfo(){
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.07,
      color: Colors.white,
    );
  }
}
class Rowtext extends StatelessWidget {
  String inputtext;
  String inputtext2;
  double fontsize;
  double fontsize2;
  FontWeight fontWeight;
  Color color;


  Rowtext({this.inputtext,this.inputtext2,this.fontsize,this.fontWeight,this.color,this.fontsize2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.04,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(inputtext,style: TextStyle(fontSize: fontsize,color: color),),
          Text(inputtext2,style: TextStyle(fontSize: fontsize2,fontWeight: fontWeight),),

        ],
      ),
    );
  }
}

