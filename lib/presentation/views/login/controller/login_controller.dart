import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test/helpers/shared/app_colors.dart';
import 'package:test/helpers/storage_keys.dart';
import 'package:test/services/auth_service.dart';
import 'package:test/services/connectivity.dart';
import 'package:test/services/local_storage.dart';

class LoginController extends GetxController {
  final auth = AuthService();
  final _connectivityService = Get.find<ConnectivityService>();

  ///Editing controllers
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final prefs = Get.find<LocalSharedPreferences>();
  Future init() async {
    final dormantEmail = await prefs.getString(StorageKeys.email) ?? '';

    email.text = dormantEmail;
  }

  ///initializers of the controller
  void onInit() async {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
    await init();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  ///Variables to update the UI
  var isLoading = false.obs;
  var text = '';
  var isSubmitted = false.obs;
  var obscureText = true;

  ///-----------------------------
  loading(bool status) {
    isLoading.value = status;
    update();
  }

  submitted(bool status) {
    isSubmitted.value = status;
    update();
  }

  obscureTextChange(bool status) {
    obscureText = status;
    update();
  }

  void updaterrorText(newtext) {
    text = newtext;
  }

  /// Error Texts to be displayed on the UI
  String? get emailerrorText {
    final text = email.value.text;
    if (text.isEmpty) {
      return 'Email is required';
    } else if (!EmailValidator.validate(text)) {
      return 'Email is invalid or badly formatted';
    }
    return null;
  }

  String? get passwordErrorText {
    final text = password.value.text;
    if (text.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  /// navigation

  void navigateToBack() {
    Get.back();
  }

  navigateToHome() {
    Get.offNamed('/home');
  }

  void navigateToSignup() {
    Get.toNamed('/signup');
  }

  ///Logic of Button pressed
  void login() async {
    submitted(true);
    if (emailerrorText == null && passwordErrorText == null) {
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

        final response = await auth.loginUser(
          email: email.text,
          password: password.text,
          device_name: 'web',
        );
        loading(false);
        if (response?.statusCode == 200) {
          print('success');
          final jsonrespon = json.decode(response.data);
          prefs.setString(
              StorageKeys.email, jsonrespon['data']['user']['email']);
          prefs.setString(StorageKeys.username,
              jsonrespon['data']['user']['username'].toString());
          // prefs.setString(StorageKeys.fullname,
          //     response.data['data']['user']['fullname'].toString());
          prefs.setString(
              StorageKeys.country, jsonrespon['data']['user']['country']);
          prefs.setString(StorageKeys.userId, jsonrespon['data']['user']['id']);
          prefs
              .setString(StorageKeys.dashToken, jsonrespon['data']['token'])
              .toString();
          navigateToHome();
        } else if (response?.statusCode == 422) {
          Get.snackbar(
            'Error',
            'The credentials do not match our records',
            snackPosition: SnackPosition.BOTTOM,
            snackStyle: SnackStyle.FLOATING,
            colorText: AppColors.blackop1,
          );
        }
      }
    }
  }
}
