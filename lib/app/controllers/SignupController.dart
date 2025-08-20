import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var agreeTerms = false.obs;

  void signup() {
    print("Signup clicked");
    if (formKey.currentState!.validate() && agreeTerms.value) {
      print("Navigating to OTP with email: ${emailController.text}");
      Get.toNamed(AppPages.otp, arguments: emailController.text);
    } else if (!agreeTerms.value) {
      Get.snackbar("Error", "You must agree with Terms & Conditions");
    }
  }
}
