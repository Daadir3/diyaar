import 'package:get/get.dart';
import '../controllers/language_controller.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    // permanent → mar walba wuu noolaanayaa
    Get.put<LanguageController>(LanguageController(), permanent: true);
  }
}
