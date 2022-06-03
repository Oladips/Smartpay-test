import 'package:flutter/material.dart';

Widget customText(
  String? text,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color, {
  String fontFamily = 'SF Pro Text',
  TextAlign textAlign = TextAlign.center,
  int? maxLines,
}) {
  return Text(
    text!,
    textAlign: textAlign,
    maxLines: maxLines,
    style: TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}
