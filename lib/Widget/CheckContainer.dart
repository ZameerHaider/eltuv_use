import 'package:flutter/material.dart';

import '../AppColors.dart';

class CheckContainer extends StatelessWidget {
  const CheckContainer({
    Key key,
    @required this.value,
  }) : super(key: key);

  final bool value;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: value
            ? Icon(
                Icons.check,
                size: size.width * 0.04,
                color: colorText,
              )
            : Icon(
                Icons.check_box_outline_blank,
                size: size.width * 0.04,
                color: colorWhite,
              ),
      ),
    );
  }
}
