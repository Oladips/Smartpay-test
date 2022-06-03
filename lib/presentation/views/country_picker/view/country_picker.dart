import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/helpers/shared/app_colors.dart';
import 'package:test/helpers/shared/customText.dart';
import 'package:test/presentation/views/country_picker/controller/country_controller.dart';
import 'package:test/presentation/widgets/back_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/presentation/widgets/custom_button.dart';

class CountryPickerView extends StatelessWidget {
  const CountryPickerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CountryController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 52.h, left: 24.w),
                  child: backButton(
                    ontap: () {
                      controller.navigateToBack();
                    },
                  ),
                ),
                SizedBox(height: 32.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.w,
                  ),
                  child: customText(
                    "Country of Residence",
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
                          "Please select all the countries that you\'re",
                          16.sp,
                          FontWeight.w400,
                          AppColors.greyop1,
                        ),
                        customText(
                          'a tax recident in',
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
                  child: Obx(
                    () => Container(
                      height: 56.h,
                      child: customButton(
                        controller.country.value != ''
                            ? controller.country.value
                            : 'Select Country',
                        () {
                          showCountryPicker(
                            showPhoneCode: false,
                            context: context,
                            onSelect: (Country country) {
                              controller.countryUpdate(
                                country.name,
                                country.countryCode,
                              );
                            },
                            countryListTheme: CountryListThemeData(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.r),
                                topRight: Radius.circular(40.r),
                              ),
                              inputDecoration: InputDecoration(
                                  labelText: 'Search',
                                  hintText: 'Start typing to search',
                                  hintStyle: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  labelStyle: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: const Color(0xFF8C98A8)
                                            .withOpacity(0.2),
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(20.r))),
                              textStyle: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                        backgroundColor: AppColors.lightGrey.withOpacity(0.6),
                        fontColor: AppColors.blackop1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 403.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 24.w,
                    right: 24.w,
                  ),
                  child: customButton(
                    'Continue',
                    () {
                      controller.confirm();
                    },
                    backgroundColor: AppColors.blackop1,
                    fontColor: AppColors.white,
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
                    fontWeight: FontWeight.w700,
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
