import 'package:get/get.dart';
import 'package:test/presentation/views/country_picker/controller/country_controller.dart';
import 'package:test/services/local_storage.dart';

class CountryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountryController());
    Get.lazyPut(() => LocalSharedPreferences());
  }
}
