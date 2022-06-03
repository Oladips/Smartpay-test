import 'package:get/get.dart';
import 'package:test/services/local_storage.dart';

class HomeController extends GetxController {
  final prefs = Get.find<LocalSharedPreferences>();
}
