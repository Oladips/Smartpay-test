import 'dart:convert';

import 'package:get/get.dart';
import 'package:test/helpers/shared/app_colors.dart';
import 'package:test/helpers/storage_keys.dart';
import 'package:test/services/auth_service.dart';
import 'package:test/services/connectivity.dart';
import 'package:test/services/local_storage.dart';

class OtpController extends GetxController {
  final _connectivityService = Get.find<ConnectivityService>();
  final prefs = Get.find<LocalSharedPreferences>();
  final auth = AuthService();
  var otp = ''.obs;
  var isLoading = false.obs;

  updateOtp(String value) {
    otp.value = value;
    update();
  }

  loading(bool status) {
    isLoading.value = status;
    update();
  }

  void navigateToBack() {
    Get.back();
  }

  void navigateToCountryPicker() {
    Get.toNamed('/country');
  }

  Future confirm() async {
    final token = prefs.getString(StorageKeys.token) ?? '';
    final email = prefs.getString(StorageKeys.email) ?? '';
    print(otp.value);
    if (otp.value.toString() == token.toString()) {
      if (_connectivityService.connectionType == 0) {
        Get.snackbar(
          'No Internet',
          'Please check your internet connection',
          duration: const Duration(milliseconds: 2500),
          backgroundColor: AppColors.red,
          colorText: AppColors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        loading(true);
        await Future.delayed(Duration(seconds: 2));
        final response = await auth.verifyEmailToken(
          email: email,
          token: token,
        );

        loading(false);

        if (response.statusCode == 200) {
          print('success');
          final jsonrespon = json.decode(response.data);
          prefs.setString(StorageKeys.email, jsonrespon['data']['email']);

          navigateToCountryPicker();
        } else {
          Get.snackbar(
            'Error',
            'You have supplied an incorrect code',
            snackPosition: SnackPosition.BOTTOM,
            snackStyle: SnackStyle.FLOATING,
          );
        }
      }
    }
  }
}
