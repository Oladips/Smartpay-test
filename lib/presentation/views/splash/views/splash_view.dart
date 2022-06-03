import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/helpers/shared/app_colors.dart';
import 'package:test/helpers/shared/app_images.dart';
import 'package:test/helpers/shared/customText.dart';
import 'package:test/presentation/views/splash/controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          child: Stack(
            children: [
              Positioned(
                top: 333.h,
                left: 151.5.w,
                right: 151.5.w,
                child: SizedBox(
                  height: 72.h,
                  width: 72.w,
                  child: Image(
                    image: AssetImage(CustomImages.logo),
                  ),
                ),
              ),
              Positioned(
                top: 421.h,
                left: 100.w,
                right: 100.w,
                child: SizedBox(
                  height: 42.h,
                  width: 149.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customText(
                        'Smart',
                        32.sp,
                        FontWeight.w700,
                        AppColors.blackop1,
                      ),
                      customText(
                        'pay.',
                        32.sp,
                        FontWeight.w700,
                        AppColors.orange2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
