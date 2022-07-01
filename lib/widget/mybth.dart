import 'package:flutter/material.dart';

import 'mywidget.dart';

class MyBTN extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color? color;
  final Icon? icon;
  final double? height, width;

  const MyBTN({
    Key? key,
    this.onPressed,
    required this.text,
    this.color,
    this.height,
    this.width,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 45,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color),
        //onPressed: () => Navigator.pop(context),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? Container(),
            MyWidget.mySizedBox(size: icon == null ? 0 : 10, type: 'w'),
            Text(text),
          ],
        ),
      ),
    );
  }
}
