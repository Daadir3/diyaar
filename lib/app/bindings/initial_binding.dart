import 'package:diyaar/app/controllers/FavoriteController.dart';
import 'package:get/get.dart';
import '../controllers/language_controller.dart';
import '../controllers/home_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Language
    Get.put<LanguageController>(LanguageController(), permanent: true);

    // HomeController
    Get.put<HomeController>(HomeController(), permanent: true);

    // FavoriteController
    Get.put<FavoriteController>(FavoriteController(), permanent: true);
  }
}
