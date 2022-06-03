import 'package:get/get.dart';
import 'package:test/presentation/views/home/controller/home_controller.dart';
import 'package:test/services/local_storage.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => LocalSharedPreferences());
  }
}
