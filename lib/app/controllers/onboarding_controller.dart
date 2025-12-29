import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/home_controller.dart';
import '../views/SignupView.dart'; // ✅ Import this

class OnboardingController extends GetxController {
  final pageController = PageController();
  final currentPage = 0.obs;

  void updatePage(int index) => currentPage.value = index;

  void nextPage() {
    if (pageController.hasClients) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (pageController.hasClients) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void finishOnboarding() {
    final box = GetStorage();
    box.write('isOnboardingCompleted', true); // ✅ Save flag
    Get.put(HomeController());
    Get.offAll(() => SignupView()); // ✅ Now it works
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
