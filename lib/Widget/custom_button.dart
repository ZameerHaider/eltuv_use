import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final bool isTitleBold;
  final Color backgroundColor;
  final Color borderColor;
  final double buttonWidth;
  final double buttonHeight;
  final String prefixicon;
  final VoidCallback onPress;
  final CustomButtonType buttonType;
  final String postFixText;
  Custombutton({
    this.title = '',
    this.borderColor,
    this.backgroundColor,
    this.titleColor,
    this.isTitleBold = false,
    this.buttonWidth,
    this.buttonHeight,
    this.onPress,
    this.prefixicon,
    this.postFixText,
    this.buttonType = CustomButtonType.none,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: buttonHeight == null ? height * 0.07 : buttonHeight,
      width: buttonWidth == null ? width * 0.9 : buttonWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.1),
      ),
      child: SizedBox(
        width: double.infinity,
        child: buttonType == CustomButtonType.flat ||
                buttonType == CustomButtonType.none
            ? FlatButton(
                onPressed: onPress,
                textColor: titleColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(width * 0.02),
                  ),
                  side: BorderSide(
                    color:
                        borderColor == null ? Colors.transparent : borderColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    prefixicon == null
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(right: width * 0.02),
                            width: width * 0.045,
                            height: width * 0.045,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: ExactAssetImage(prefixicon))),
                          ),
                    Text(
                      this.title,
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight:
                            isTitleBold ? FontWeight.bold : FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    postFixText == null
                        ? Container()
                        : Text(
                            this.postFixText,
                            style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: isTitleBold
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                            ),
                          ),
                  ],
                ),
                color: backgroundColor,
              )
            : RaisedButton(
                onPressed: onPress,
                textColor: titleColor,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(
                    //   width * 0.1,
                    // ),
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    prefixicon == null
                        ? Container()
                        : Container(
                            padding: EdgeInsets.only(right: width * 0.07),
                            width: width * 0.05,
                            height: width * 0.05,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: ExactAssetImage(prefixicon))),
                          ),
                    Text(
                      this.title,
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight:
                            isTitleBold ? FontWeight.bold : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                color: backgroundColor,
              ),
      ),
    );
  }
}

enum CustomButtonType {
  raised,
  flat,
  none,
}
