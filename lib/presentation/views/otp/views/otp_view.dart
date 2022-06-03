import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test/helpers/shared/app_colors.dart';
import 'package:test/helpers/shared/customText.dart';
import 'package:test/presentation/views/otp/controller/otp_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/presentation/widgets/back_button.dart';
import 'package:test/presentation/widgets/custom_button.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OtpController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 52.h, left: 24.w),
                    child: backButton(ontap: () {
                      controller.navigateToBack();
                    })),
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.w,
                  ),
                  child: customText(
                    "Verify it\'s you",
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
                          'We send a code to ( *****@mail.com ).',
                          16.sp,
                          FontWeight.w400,
                          AppColors.greyop1,
                        ),
                        customText(
                          'Enter it here to verify your identity',
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
                    obscureText: true,
                    obscuringCharacter: '*',
                    animationType: AnimationType.fade,
                    appContext: context,
                    length: 5,
                    onChanged: (value) {},
                    enableActiveFill: true,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(13.r),
                        fieldHeight: 56.h,
                        fieldWidth: 56.w,
                        inactiveFillColor: AppColors.textbutton,
                        activeFillColor: AppColors.textbutton,
                        selectedFillColor: AppColors.textbutton,
                        activeColor: AppColors.lightGrey.withOpacity(0.6),
                        disabledColor: AppColors.textbutton,
                        inactiveColor: AppColors.lightGrey.withOpacity(0.6),
                        selectedColor: AppColors.orangeop1),
                    onCompleted: (v) {
                      controller.updateOtp(v);
                    },
                  ),
                ),
                SizedBox(height: 32.h),
                GestureDetector(
                  child: Center(
                    child: customText(
                      'Resend Code',
                      16.sp,
                      FontWeight.w600,
                      AppColors.orangeop1,
                    ),
                  ),
                ),
                SizedBox(height: 67.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.w,
                    right: 24.w,
                  ),
                  child: customButton('Confirm', () {
                    controller.confirm();
                  },
                      condition: controller.isLoading.value == true,
                      conditionWidget: SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                          // backgroundColor: CasmartColors.green,
                          strokeWidth: 2.sp,
                        ),
                      ),
                      backgroundColor: AppColors.blackop1,
                      fontColor: AppColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
