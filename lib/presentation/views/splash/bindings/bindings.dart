import 'package:get/get.dart';
import 'package:test/presentation/views/splash/controller/splash_controller.dart';
import 'package:test/services/local_storage.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => LocalSharedPreferences());
  }
}
