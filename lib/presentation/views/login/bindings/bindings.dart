import 'package:get/get.dart';
import 'package:test/presentation/views/login/controller/login_controller.dart';
import 'package:test/services/local_storage.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => LocalSharedPreferences());
  }
}
