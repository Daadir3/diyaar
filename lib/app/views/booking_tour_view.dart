import 'package:diyaar/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/booking_tour_controller.dart';

class BookingTourView extends GetView<BookingTourController> {
  const BookingTourView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back + Title
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Get.back(),
                    ),
                    const Spacer(),
                    Text(
                      "Booking Tour",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.org, // ✅ const ka saaray
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),

                const SizedBox(height: 20),

                const Text(
                  "Your Information Details",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // Name
                const Text(
                  "Name",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: controller.nameController,
                  readOnly: true,
                  decoration: _inputDecoration(),
                ),
                const SizedBox(height: 16),

                // Email
                const Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: controller.emailController,
                  readOnly: true,
                  decoration: _inputDecoration(),
                ),
                const SizedBox(height: 16),

                // Phone
                const Text(
                  "Phone",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    // Country Code dropdown
                    Obx(
                      () => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 0.8,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: controller.selectedCode.value,
                            items:
                                ["+252", "+20", "+254", "+971"]
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (val) {
                              controller.selectedCode.value = val!;
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Phone number input
                    Expanded(
                      child: TextFormField(
                        controller: controller.phoneController,
                        decoration: _inputDecoration(
                          hint: "Enter Phone Number",
                        ),
                        keyboardType: TextInputType.phone,
                        validator:
                            (val) =>
                                val == null || val.isEmpty
                                    ? "Phone required"
                                    : null,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Gender
                const Text(
                  "Gender",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Obx(
                  () => DropdownButtonFormField<String>(
                    value: controller.selectedGender.value,
                    items:
                        ["Select", "Male", "Female", "Other"]
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                    onChanged: (val) => controller.selectedGender.value = val!,
                    decoration: _inputDecoration(),
                    validator:
                        (val) =>
                            val == "Select" ? "Please select gender" : null,
                  ),
                ),
                const SizedBox(height: 16),

                // Country
                const Text(
                  "Country",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Obx(
                  () => DropdownButtonFormField<String>(
                    value: controller.selectedCountry.value,
                    items:
                        ["Egypt", "Somalia", "Kenya", "UAE", "USA"]
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                    onChanged: (val) => controller.selectedCountry.value = val!,
                    decoration: _inputDecoration(),
                  ),
                ),
                const SizedBox(height: 20),

                // Continue button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.org,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: controller.onContinue,
                    child: const Text(
                      "Continue",
                      style: TextStyle(fontSize: 16, color: Colors.white),
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

  InputDecoration _inputDecoration({String? hint}) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey.shade300,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
  }
}
