import 'package:diyaar/app/controllers/home_controller.dart';
import 'package:diyaar/app/views/SignupView.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../views/home_view.dart'; // hubi path-ka saxda ah

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
    // gacanta ku register controller-ka
    Get.put(HomeController());
    Get.offAll(() =>  SignupView());
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
