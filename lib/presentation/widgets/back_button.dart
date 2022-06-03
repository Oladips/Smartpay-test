import 'package:flutter/material.dart';
import 'package:test/helpers/shared/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget backButton({
  Function()? ontap,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 40.h,
      width: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.lightGrey2,
      ),
      child: Container(
        height: 40.h,
        width: 40.w,
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.white,
        ),
        child: SizedBox(
          height: 12.h,
          width: 6.w,
          child: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
    ),
  );
}
