import 'package:get/get.dart';
import 'package:test/presentation/views/onboarding/controller/onboarding_controller.dart';
import 'package:test/services/local_storage.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
    Get.lazyPut(() => LocalSharedPreferences());
  }
}
