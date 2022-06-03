import 'package:get/get.dart';
import 'package:test/presentation/views/pin/controller/pin_controller.dart';

class PinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PinController());
  }
}
