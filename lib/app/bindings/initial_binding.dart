import 'package:get/get.dart';
import '../controllers/language_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LanguageController>(
      LanguageController(),
      permanent: true, // 👈 MUHIIM
    );
  }
}
