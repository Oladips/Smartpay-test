import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/helpers/shared/app_colors.dart';
import 'package:test/helpers/storage_keys.dart';
import 'package:test/services/auth_service.dart';
import 'package:test/services/connectivity.dart';
import 'package:test/services/local_storage.dart';

class SignupController extends GetxController {
  final prefs = Get.find<LocalSharedPreferences>();
  final _connectivityService = Get.find<ConnectivityService>();
  final auth = AuthService();

  ///Controllers
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
    } else if (text.length < 6) {
      return 'Password must be at least 6 characters';
    } else if (text.isAlphabetOnly) {
      return 'Password must have at least one numeric value';
    } else if (text.toLowerCase() == text) {
      return 'Password must have at least one Uppercase value';
    }
    return null;
  }

  String? get usernameErrorText {
    final text = fullname.value.text;
    if (text.isEmpty) {
      return 'Full name is required';
    }
    return null;
  }

  ///GetX Controller initializatiion
  @override
  void onInit() {
    super.onInit();
    fullname = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    fullname.dispose();
    email.dispose();
    password.dispose();
  }

  /// navigation

  void navigateToVerification() {
    Get.offNamed('/otp');
  }

  void navigateToBack() {
    Get.back();
  }

  void navigateToLogin() {
    Get.toNamed('/login');
  }

  /// SIgn up logic
  Future signup() async {
    submitted(true);
    if (emailerrorText == null &&
        passwordErrorText == null &&
        usernameErrorText == null) {
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
        final response = await auth.getEmailToken(
          email: email.text,
        );

        loading(false);
        if (response.statusCode == 200) {
          print('success');
          final jsonrespon = json.decode(response.data);
          prefs.setString(StorageKeys.token, jsonrespon['data']['token']);
          prefs.setString(StorageKeys.email, email.text);
          prefs.setString(StorageKeys.fullname, fullname.text);
          prefs.setString(StorageKeys.password, password.text);
          print(jsonrespon['data']['token']);

          navigateToVerification();
        } else {
          print(response.body);
          Get.snackbar(
            'Error',
            'Sorry we couldnt get your token at this time',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    }
  }
}
