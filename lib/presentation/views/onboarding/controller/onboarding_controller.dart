import 'package:get/get.dart';
import 'package:test/helpers/storage_keys.dart';
import 'package:test/services/local_storage.dart';

class OnboardingController extends GetxController {
  final prefs = Get.find<LocalSharedPreferences>();
  void navugateToLogin() {
    prefs.setBool(StorageKeys.onboarded, true);
    Get.offNamed('/login');
  }
}
