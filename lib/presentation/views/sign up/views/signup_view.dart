import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/helpers/shared/app_colors.dart';
import 'package:test/helpers/shared/app_images.dart';
import 'package:test/helpers/shared/customText.dart';
import 'package:test/presentation/views/sign%20up/controller/signup_controller.dart';
import 'package:test/presentation/widgets/back_button.dart';
import 'package:test/presentation/widgets/custom_button.dart';
import 'package:test/presentation/widgets/custom_textFfield.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
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
                  left: 24.h,
                ),
                child: Container(
                  height: 65.h,
                  width: 235.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          customText(
                            'Create a',
                            24.sp,
                            FontWeight.w700,
                            AppColors.blackop1,
                          ),
                          customText(
                            ' Smartpay',
                            24.sp,
                            FontWeight.w700,
                            AppColors.orangeop1,
                          ),
                        ],
                      ),
                      customText(
                        'account',
                        24.sp,
                        FontWeight.w700,
                        AppColors.blackop1,
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
                child: Container(
                  height: 56.h,
                  child: customTextField(
                    obscureText: false,
                    filled: true,
                    controller: controller.fullname,
                    errorText: controller.isSubmitted.value == true
                        ? controller.usernameErrorText
                        : null,
                    fillColor: AppColors.textbutton,
                    hint: 'Full name',
                    fontsize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                ),
                child: Container(
                  height: 56.h,
                  child: customTextField(
                    obscureText: false,
                    filled: true,
                    errorText: controller.isSubmitted.value == true
                        ? controller.emailerrorText
                        : null,
                    controller: controller.email,
                    fillColor: AppColors.textbutton,
                    hint: 'Email',
                    fontsize: 16.sp,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                ),
                child: Container(
                  height: 56.h,
                  child: customTextField(
                    obscureText: controller.obscureText,
                    filled: true,
                    errorText: controller.isSubmitted.value == true
                        ? controller.passwordErrorText
                        : null,
                    controller: controller.password,
                    fillColor: AppColors.textbutton,
                    hint: 'Password',
                    fontsize: 16.sp,
                    suffixWidget: Padding(
                      padding: EdgeInsets.only(bottom: 0.h),
                      child: TextButton(
                        onPressed: () {
                          if (!controller.obscureText) {
                            controller.obscureTextChange(true);
                          } else {
                            controller.obscureTextChange(false);
                          }
                        },
                        child: controller.obscureText
                            ? Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: Icon(
                                  Icons.visibility_off_outlined,
                                  color: AppColors.lightGrey2,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: Icon(
                                  Icons.visibility_outlined,
                                  color: AppColors.lightGrey2,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                ),
                child: customButton(
                  'Sign up',
                  () {
                    FocusScope.of(context).unfocus();
                    controller.signup();
                    // controller.navigateToVerification();
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
                  fontSize: 16.sp,
                  fontColor: AppColors.white,
                  fontWeight: FontWeight.w600,
                  backgroundColor: AppColors.blackop1,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IgnorePointer(
                    child: Container(
                      width: 142.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.1),
                            Colors.white.withOpacity(0.8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  customText(
                    'OR',
                    14.sp,
                    FontWeight.w400,
                    AppColors.greyop1,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  IgnorePointer(
                    child: Container(
                      width: 142.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.1),
                            Colors.white.withOpacity(0.8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 34.5.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 56.h,
                      width: 155.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.lightGrey2,
                      ),
                      child: Container(
                        height: 56.h,
                        width: 155.w,
                        margin: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.white,
                        ),
                        child: Container(
                          height: 15.18.h,
                          width: 15.18.w,
                          child: Image(
                            image: AssetImage(CustomImages.google),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 56.h,
                      width: 155.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.lightGrey2,
                      ),
                      child: Container(
                        height: 56.h,
                        width: 155.w,
                        margin: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.white,
                        ),
                        child: Container(
                            height: 15.18.h,
                            width: 15.18.w,
                            margin: EdgeInsets.all(10),
                            child: Image.asset(CustomImages.apple)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 117.h,
              ),
              GestureDetector(
                onTap: () {
                  controller.navigateToLogin();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customText(
                      "Already have an account?",
                      16.sp,
                      FontWeight.w400,
                      AppColors.lightGrey2,
                    ),
                    customText(
                      " Sign In",
                      16.sp,
                      FontWeight.w600,
                      AppColors.orangeop1,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
