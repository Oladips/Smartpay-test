import 'package:get/get.dart';
import 'package:test/presentation/views/sign%20up/controller/signup_controller.dart';
import 'package:test/services/local_storage.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => LocalSharedPreferences());
  }
}
