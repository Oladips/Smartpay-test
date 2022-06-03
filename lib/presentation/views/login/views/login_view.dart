import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/helpers/shared/app_colors.dart';
import 'package:test/helpers/shared/app_images.dart';
import 'package:test/helpers/shared/customText.dart';
import 'package:test/presentation/views/login/controller/login_controller.dart';
import 'package:test/presentation/widgets/back_button.dart';
import 'package:test/presentation/widgets/custom_button.dart';
import 'package:test/presentation/widgets/custom_textFfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
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
                  left: 24.h,
                ),
                child: customText(
                  'Hi There! 👋',
                  24.sp,
                  FontWeight.w700,
                  AppColors.blackop1,
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.h,
                ),
                child: customText(
                  'Welcome back, Sign in to your account',
                  16.sp,
                  FontWeight.w400,
                  AppColors.blackop1,
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
                    fillColor: AppColors.textbutton,
                    hint: 'Email',
                    controller: controller.email,
                    fontsize: 16.sp,
                    errorText: controller.isSubmitted.value == true
                        ? controller.emailerrorText
                        : null,
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
                    fillColor: AppColors.textbutton,
                    hint: 'Password',
                    controller: controller.password,
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
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.h,
                ),
                child: customText(
                  'Forgot Password?',
                  16.sp,
                  FontWeight.w700,
                  AppColors.orangeop1,
                ),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                ),
                child: customButton(
                  'Sign in',
                  () {
                    FocusScope.of(context).unfocus();
                    controller.login();
                    // controller.submitted(true);
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
                height: 138.h,
              ),
              GestureDetector(
                onTap: () {
                  controller.navigateToSignup();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customText(
                      "Don\'t have an account?",
                      16.sp,
                      FontWeight.w400,
                      AppColors.lightGrey2,
                    ),
                    customText(
                      " Sign up",
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
