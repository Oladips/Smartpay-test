import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test/helpers/shared/app_colors.dart';
import 'package:test/helpers/shared/customText.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/presentation/views/pin/controller/pin_controller.dart';
import 'package:test/presentation/widgets/back_button.dart';
import 'package:test/presentation/widgets/custom_button.dart';

class PinView extends StatelessWidget {
  const PinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GetBuilder<PinController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 52.h, left: 24.w),
                    child: backButton(ontap: () {})),
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.w,
                  ),
                  child: customText(
                    "Set your PIN code",
                    24.sp,
                    FontWeight.w700,
                    AppColors.blackop1,
                  ),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.w,
                  ),
                  child: SizedBox(
                    height: 48.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                          'We use state-of-the-art security measures to',
                          16.sp,
                          FontWeight.w400,
                          AppColors.greyop1,
                        ),
                        customText(
                          'protect your information at all times',
                          16.sp,
                          FontWeight.w400,
                          AppColors.greyop1,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.w,
                    right: 24.w,
                  ),
                  child: PinCodeTextField(
                    keyboardType: TextInputType.number,
                    cursorColor: AppColors.orangeop1,
                    obscureText: true,
                    obscuringCharacter: '*',
                    animationType: AnimationType.fade,
                    appContext: context,
                    length: 5,
                    onChanged: (value) {},
                    enableActiveFill: true,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      fieldHeight: 56.h,
                      fieldWidth: 56.w,
                      inactiveFillColor: AppColors.white,
                      activeFillColor: AppColors.white,
                      selectedFillColor: AppColors.white,
                      activeColor: AppColors.orangeop1,
                      disabledColor: AppColors.orangeop1,
                      inactiveColor: AppColors.orangeop1,
                      selectedColor: AppColors.orangeop1,
                    ),
                    onCompleted: (v) {
                      // verificationController.com(v);
                    },
                  ),
                ),
                SizedBox(height: 32.h),
                SizedBox(height: 67.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.w,
                    right: 24.w,
                  ),
                  child: customButton(
                    'Confirm',
                    () {
                      controller.navigateToSuccess();
                    },
                    backgroundColor: AppColors.blackop1,
                    fontColor: AppColors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
