import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/helpers/shared/app_colors.dart';
import 'package:test/helpers/shared/app_images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/helpers/shared/customText.dart';
import 'package:test/presentation/views/success/controller/success_controller.dart';
import 'package:test/presentation/widgets/custom_button.dart';

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SuccessController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 58.w, right: 58.w, top: 100.h),
                child: Image.asset(CustomImages.successsignup),
              ),
              SizedBox(
                height: 56.h,
              ),
              Center(
                child: customText(
                  'Congratulations',
                  24.sp,
                  FontWeight.w700,
                  AppColors.blackop1,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 60.w,
                    right: 60.w,
                  ),
                  child: customText(
                    'Hey ${controller.name}, your account has been successfully created 👋 ',
                    15.sp,
                    FontWeight.w400,
                    AppColors.blackop1,
                  ),
                ),
              ),
              SizedBox(
                height: 247.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                ),
                child: customButton(
                  'Proceed to home',
                  () {
                    controller.navigateToHome();
                  },
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  fontColor: AppColors.white,
                  backgroundColor: AppColors.blackop1,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
