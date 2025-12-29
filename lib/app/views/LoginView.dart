import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/LoginController.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A2940),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Welcome back, please login to continue",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const SizedBox(height: 40),

              /// Email
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A2940),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              TextFormField(
                controller: controller.emailController,
                validator: (v) => v!.isEmpty ? "Email is required" : null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Password
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A2940),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              TextFormField(
                controller: controller.passwordController,
                obscureText: true,
                validator: (v) => v!.isEmpty ? "Password is required" : null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// 🔹 Forget password
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.snackbar(
                      "Forgot Password",
                      "Reset link sent to your email",
                    );
                  },
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Color(0xFFB95D25),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// Login button
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed:
                        controller.isLoading.value ? null : controller.login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB95D25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child:
                        controller.isLoading.value
                            ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                            : const Text(
                              "LOGIN",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () => Get.offAllNamed('/signup'),
                child: const Text(
                  "Create new account",
                  style: TextStyle(
                    color: Color(0xFFB95D25),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
