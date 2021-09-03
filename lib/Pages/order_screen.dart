import 'package:eltuv_use/Widget/custom_button.dart';
import 'package:flutter/material.dart';

import '../AppColors.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/orderbg.png"), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/check.png",
              height: size.width * 0.18,
              width: size.width * 0.18,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              "Order Placed!",
              style: TextStyle(
                fontSize: size.width * 0.047,
                fontWeight: FontWeight.bold,
                color: colorWhite,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              """Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.""",
              style: TextStyle(
                fontSize: size.width * 0.047,
                color: colorWhite,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Custombutton(
              onPress: () {},
              buttonWidth: size.width * 0.45,
              backgroundColor: colorWhite,
              title: "Track Order",
              titleColor: colorPrimary,
              isTitleBold: true,
            )
          ],
        ),
      ),
    );
  }
}
