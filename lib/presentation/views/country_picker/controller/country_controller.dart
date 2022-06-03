import 'dart:convert';

import 'package:get/get.dart';
import 'package:test/helpers/shared/app_colors.dart';
import 'package:test/helpers/storage_keys.dart';
import 'package:test/services/auth_service.dart';
import 'package:test/services/connectivity.dart';
import 'package:test/services/local_storage.dart';

class CountryController extends GetxController {
  final auth = AuthService();
  final prefs = Get.find<LocalSharedPreferences>();
  final _connectivityService = Get.find<ConnectivityService>();

  ///Variables that updates the UI
  var country = ''.obs;
  var countryCode = ''.obs;
  var isLoading = false.obs;

  loading(bool status) {
    isLoading.value = status;
    update();
  }

  void countryUpdate(String value, String code) {
    country.value = value;
    countryCode.value = code;
    update();
  }

  ///Navigation

  void navigateToPin() {
    Get.toNamed('/pin');
  }

  void navigateToBack() {
    Get.back();
  }

  ///Confirm button logic
  Future confirm() async {
    if (country.value != '') {
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
        final email = prefs.getString(StorageKeys.email) ?? '';
        final username = prefs.getString(StorageKeys.username) ?? '';
        final password = prefs.getString(StorageKeys.password) ?? '';
        final fullname = prefs.getString(StorageKeys.fullname) ?? '';
        loading(true);
        await Future.delayed(Duration(seconds: 2));
        final response = await auth.registerUser(
          email: email,
          username: username,
          fullname: fullname,
          country: countryCode.value,
          password: password,
          device_name: 'web',
        );

        loading(false);

        if (response.statusCode == 200) {
          print('success');
          final jsonrespon = json.decode(response.data);
          prefs.setString(
              StorageKeys.email, jsonrespon['data']['user']['email']);
          prefs.setString(StorageKeys.username,
              jsonrespon['data']['user']['username'].toString());
          prefs.setString(
              StorageKeys.fullname, jsonrespon['data']['user']['full_name']);
          prefs.setString(
              StorageKeys.country, jsonrespon['data']['user']['country']);
          prefs.setString(StorageKeys.userId, jsonrespon['data']['user']['id']);
          prefs.setString(StorageKeys.dashToken, jsonrespon['data']['token']);

          navigateToPin();
        } else if (response.statusCode == 422) {
          print('Email in use');
          Get.snackbar(
            'Error',
            'This email is currently in use',
            snackPosition: SnackPosition.BOTTOM,
            snackStyle: SnackStyle.FLOATING,
          );
        } else {
          Get.snackbar(
            'Error',
            'Sorry, you cannot complete at this time, Please check your connection and try again',
            snackPosition: SnackPosition.BOTTOM,
            snackStyle: SnackStyle.FLOATING,
          );
        }
      }
    } else {
      Get.snackbar(
            'Error',
            'Please choose a country of residence',
            snackPosition: SnackPosition.BOTTOM,
            snackStyle: SnackStyle.FLOATING,
          );
    }
  }
}
