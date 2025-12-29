import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/SignupController.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A2940),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Fill in the info to continue",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 30),

              // Name
              const Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.nameController,
                validator: (v) => v!.isEmpty ? "Name required" : null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 12),
                ),
              ),
              const SizedBox(height: 20),

              // Email
              const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.emailController,
                validator: (v) =>
                    !GetUtils.isEmail(v!) ? "Valid email required" : null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 12),
                ),
              ),
              const SizedBox(height: 20),

              // Phone Number
              const Text("Phone Number", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButton<String>(
                        value: controller.selectedCountry.value,
                        items: controller.countries.map((country) {
                          return DropdownMenuItem<String>(
                            value: country['dialCode'],
                            child: Text("${country['flag']} ${country['dialCode']}"),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) controller.selectedCountry.value = val;
                        },
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: controller.phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (v) =>
                          v == null || v.isEmpty ? "Phone number required" : null,
                      decoration: InputDecoration(
                        hintText: "Enter phone number",
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Password
              const Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Obx(
                () => TextFormField(
                  controller: controller.passwordController,
                  obscureText: controller.isPasswordHidden.value,
                  validator: (v) =>
                      v!.length < 6 ? "Password must be 6+ chars" : null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(controller.isPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        controller.isPasswordHidden.value =
                            !controller.isPasswordHidden.value;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Confirm Password
              const Text("Confirm Password", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Obx(
                () => TextFormField(
                  controller: controller.confirmPasswordController,
                  obscureText: controller.isConfirmPasswordHidden.value,
                  validator: (v) {
                    if (v == null || v.isEmpty) return "Confirm password required";
                    if (v != controller.passwordController.text)
                      return "Passwords do not match";
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(controller.isConfirmPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        controller.isConfirmPasswordHidden.value =
                            !controller.isConfirmPasswordHidden.value;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Terms
              Obx(
                () => Row(
                  children: [
                    Checkbox(
                      value: controller.agreeTerms.value,
                      onChanged: (val) => controller.agreeTerms.value = val!,
                      activeColor: const Color(0xFFB95D25),
                    ),
                    const Text("I agree with "),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Terms & Conditions",
                        style: TextStyle(
                          color: Color(0xFFB95D25),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Signup Button
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed:
                        controller.isLoading.value ? null : controller.signup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB95D25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "SIGN UP",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
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
