import 'dart:async';

import 'package:get/get.dart';
import 'package:test/helpers/storage_keys.dart';
import 'package:test/services/local_storage.dart';

class SplashController extends GetxController {
  final prefs = Get.find<LocalSharedPreferences>();
  onReady() {
    final onboarded = prefs.getBool(StorageKeys.onboarded);
    super.onReady();
    Timer(
      const Duration(milliseconds: 1500),
      () {
        if (onboarded == true) {
          Get.offNamed('/login');
        } else {
          Get.offNamed('/onboarding');
        }
      },
    );
    update();
  }
}
