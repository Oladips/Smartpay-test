import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/helpers/shared/customText.dart';

Widget customButton(
  String? text,
  Function()? onPressed, {
  bool outlined = false,
  String prefixIcon = '',
  bool? condition,
  Widget? conditionWidget,
  bool disabled = false,
  double? width,
  FontWeight fontWeight = FontWeight.w600,
  double? fontSize,
  double? horizontalPadding,
  double? verticalPadding,
  Color? backgroundColor,
  Color? fontColor,
  Color? borderColor,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: width != null ? width : 375.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: outlined
            ? Colors.white
            : disabled
                ? Colors.black
                : backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        border: Border.all(
          color: borderColor != null
              ? borderColor
              : outlined
                  ? Colors.black
                  : disabled
                      ? Colors.grey
                      : backgroundColor ?? Colors.white,
          width: 2.0,
        ),
      ),
      child: condition == true
          ? Center(
              child: conditionWidget,
            )
          : Padding(
              padding: EdgeInsets.symmetric(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  prefixIcon == ''
                      ? SizedBox()
                      : Container(
                          margin: EdgeInsets.only(right: 12.31.w),
                          child: Image.asset(
                            prefixIcon,
                            width: 20.37.w,
                            height: 20.37.h,
                          ),
                        ),
                  customText(text, fontSize, fontWeight,
                      outlined ? Colors.white : fontColor),
                ],
              ),
            ),
    ),
  );
}
