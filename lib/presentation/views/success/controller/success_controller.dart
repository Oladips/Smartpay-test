import 'package:get/get.dart';
import 'package:test/helpers/storage_keys.dart';
import 'package:test/services/local_storage.dart';

class SuccessController extends GetxController {
  final name = LocalSharedPreferences().getString(StorageKeys.fullname);

  navigateToHome() {
    Get.offNamed('/home');
  }

  
}
