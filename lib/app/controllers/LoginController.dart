import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;

  void login() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      // 👇 Halkan waxaad ku dari kartaa API call
      Future.delayed(const Duration(seconds: 2), () {
        isLoading.value = false;
        // Haddii login success
        Get.offAllNamed('/home'); // to Splash/Home
        // haddii error:
        // Get.snackbar("Error", "Invalid email or password");
      });
    }
  }
}
