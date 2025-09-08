import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BookingTourController extends GetxController {
  // Form Key
  final formKey = GlobalKey<FormState>();

  // Controllers
  final nameController = TextEditingController(text: "Abdikadir Mohamed Maye");
  final emailController =
      TextEditingController(text: "abdikadiirmohamedmaye@gmail.com");
  final phoneController = TextEditingController();

  // Dropdown values
  var selectedGender = "Select".obs;
  var selectedCountry = "Egypt".obs;
  var selectedCode = "+252".obs;

  // Continue button pressed
  void onContinue() {
    if (formKey.currentState!.validate()) {
      Get.snackbar("Success", "Form submitted successfully ✅",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
