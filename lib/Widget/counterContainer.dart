import 'package:flutter/material.dart';

Container counterContainer(Size size, Widget container, bool isAdd) {
  return Container(
      height: size.width * 0.085,
      width: size.width * 0.08,
      decoration: BoxDecoration(
        borderRadius: isAdd
            ? BorderRadius.only(
                topLeft: Radius.circular(size.width * 0.02),
                bottomLeft: Radius.circular(size.width * 0.02))
            : BorderRadius.only(
                topRight: Radius.circular(size.width * 0.02),
                bottomRight: Radius.circular(size.width * 0.02)),
        color: Colors.grey.withOpacity(0.4),
      ),
      child: container);
}
