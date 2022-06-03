import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/helpers/shared/app_colors.dart';
import 'package:test/helpers/shared/customText.dart';
import 'package:test/helpers/storage_keys.dart';
import 'package:test/models/token.dart';
import 'package:test/presentation/views/home/controller/home_controller.dart';
import 'package:test/services/auth_service.dart';
import 'package:test/services/local_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<Secret> getString() async {
      return AuthService().dashboard(
        token: LocalSharedPreferences().getString(StorageKeys.dashToken) ?? '',
      );
    }

    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller) => FutureBuilder<Secret>(
          future: getString(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.connectionState == ConnectionState.done) {
                var test = snapshot.data!.data;
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 24.w,
                      right: 24.w,
                    ),
                    child: customText(
                      test.secret,
                      32.sp,
                      FontWeight.w400,
                      AppColors.blackop1,
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.orangeop1,
                  ),
                );
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
