import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:test/helpers/shared/app_colors.dart';
import 'package:test/helpers/shared/app_images.dart';
import 'package:test/helpers/shared/customText.dart';
import 'package:test/presentation/views/onboarding/controller/onboarding_controller.dart';
import 'package:test/presentation/widgets/custom_button.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 68.h,
            right: 24.w,
            child: GestureDetector(
              child: customText(
                'skip',
                16.sp,
                FontWeight.w700,
                AppColors.orangeop1,
              ),
            ),
          ),
          IntroductionScreen(
            animationDuration: 0,
            dotsDecorator: DotsDecorator(
              color: AppColors.lightGreyop1,
              activeColor: AppColors.blackop1,
              spacing: EdgeInsets.only(left: 4.w, right: 4.w),
              activeSize: Size(32.w, 6.w),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
            globalFooter: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 44.w,
                    right: 44.w,
                  ),
                  child: SizedBox(
                    height: 65.h,
                    child: customButton(
                      'Get started',
                      () {
                        controller.navugateToLogin();
                      },
                      fontSize: 14.sp,
                      fontColor: AppColors.white,
                      fontWeight: FontWeight.w700,
                      backgroundColor: AppColors.blackop1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 58.h,
                )
              ],
            ),
            isBottomSafeArea: true,
            scrollPhysics: const ClampingScrollPhysics(),
            globalBackgroundColor: Colors.white,
            onDone: null,
            overrideDone: Container(),
            showNextButton: false,
            next: null,
            overrideNext: null,
            pages: [
              PageViewModel(
                image: SizedBox(
                  height: 300.h,
                  width: 300.w,
                  child: Image.asset(CustomImages.onboarding1),
                ),
                titleWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 44.w),
                      child: SizedBox(
                        // height: 287.h,
                        width: 62.w,
                        child: customText(
                          'Finance app the safest\n and most trusted',
                          24.sp,
                          FontWeight.w700,
                          AppColors.blackop1,
                        ),
                      ),
                    ),
                  ],
                ),
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 44.w),
                      child: SizedBox(
                        width: 62.w,
                        child: customText(
                          'Your finance work starts here. Our here to help you track and deal with speeding up your transactions.',
                          16.sp,
                          FontWeight.w400,
                          AppColors.blackop1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              PageViewModel(
                image: SizedBox(
                  height: 300.h,
                  width: 300.w,
                  child: Image.asset(CustomImages.onboarding2),
                ),
                titleWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 55.w),
                      child: SizedBox(
                        width: 62.w,
                        child: customText(
                          'The fastest transaction process only here',
                          24.sp,
                          FontWeight.w700,
                          AppColors.blackop1,
                        ),
                      ),
                    ),
                  ],
                ),
                bodyWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 51.w),
                      child: SizedBox(
                        width: 62.w,
                        child: customText(
                          'Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.',
                          16.sp,
                          FontWeight.w400,
                          AppColors.blackop1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
