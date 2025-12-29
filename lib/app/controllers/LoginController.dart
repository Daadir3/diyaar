import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';
import '../services/token_storage.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading.value = true;

      final auth = await AuthService.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // 🔐 Save token securely
      await TokenStorage.saveToken(auth.accessToken);

      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
        "Login Failed",
        "Email ama password khalad ah",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
