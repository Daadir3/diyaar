import 'package:diyaar/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/SignupController.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  // ✅ Halkan ayaan ku register gareynaa controller-ka
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
                const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Fill your information below or register\nwith your social account.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                const SizedBox(height: 30),

                // Name
                TextFormField(
                  controller: controller.nameController,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    filled: true,
                    fillColor: Colors.black12,
                  ),
                  validator:
                      (value) => value!.isEmpty ? "Enter your name" : null,
                ),
                const SizedBox(height: 15),

                // Email
                TextFormField(
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    filled: true,
                    fillColor: Colors.black12,
                  ),
                  validator:
                      (value) =>
                          !GetUtils.isEmail(value!)
                              ? "Enter valid email"
                              : null,
                ),
                const SizedBox(height: 15),

                // Password
                TextFormField(
                  controller: controller.passwordController,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    filled: true,
                    fillColor: Colors.black12,
                  ),
                  obscureText: true,
                  validator:
                      (value) =>
                          value!.length < 6
                              ? "Password must be at least 6 chars"
                              : null,
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
                      const Text("Agree with "),
                      GestureDetector(
                        onTap: () {
                          // TODO: Navigate to terms screen
                        },
                        child: const Text(
                          "Terms & Conditions",
                          style: TextStyle(
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
                    onPressed: controller.signup, // ✅ sax
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
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
