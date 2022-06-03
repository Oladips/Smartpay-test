import 'package:get/get.dart';
import 'package:test/presentation/views/otp/controller/otp_controller.dart';
import 'package:test/services/local_storage.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpController());
    Get.lazyPut(() => LocalSharedPreferences());
  }
}
