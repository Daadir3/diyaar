import 'package:diyaar/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/SignupController.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "create_account".tr,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "fill_info_or_social".tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black54, fontSize: 14),
                ),
                const SizedBox(height: 30),

                // Name
                TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    labelText: "name".tr,
                    filled: true,
                    fillColor: Colors.black12,
                  ),
                  validator: (value) => value!.isEmpty ? "enter_name".tr : null,
                ),
                const SizedBox(height: 15),

                // Email
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    labelText: "email".tr,
                    filled: true,
                    fillColor: Colors.black12,
                  ),
                  validator:
                      (value) =>
                          !GetUtils.isEmail(value!)
                              ? "enter_valid_email".tr
                              : null,
                ),
                const SizedBox(height: 15),

                // Password
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    labelText: "password".tr,
                    filled: true,
                    fillColor: Colors.black12,
                  ),
                  obscureText: true,
                  validator:
                      (value) =>
                          value!.length < 6 ? "password_min_chars".tr : null,
                ),
                const SizedBox(height: 20),

                // Terms Checkbox
                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                        value: controller.agreeTerms.value,
                        onChanged: (val) => controller.agreeTerms.value = val!,
                        activeColor: Colors.brown,
                      ),
                      Text("agree_with".tr),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "terms_conditions".tr,
                          style: const TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.org,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: controller.signup,
                    child: Text(
                      "sign_up".tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
