import 'package:get/get.dart';
import 'package:test/presentation/views/success/controller/success_controller.dart';
import 'package:test/services/local_storage.dart';

class SuccessBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessController());
    Get.lazyPut(() => LocalSharedPreferences());
  }
}
