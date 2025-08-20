import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/OtpController.dart';
import '../views/OtpInputFields.dart';

class OtpVerificationPage extends StatelessWidget {
  final String email;

  OtpVerificationPage({super.key, required this.email});

  final OtpController controller = Get.find<OtpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, size: 28),
                onPressed: () => Get.back(),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Verify Code",
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0A2940)),
            ),
            const SizedBox(height: 10),
            const Text(
              "Please enter the code we just sent to email",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 5),
            Text(
              email,
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFFB95D25)),
            ),
            const SizedBox(height: 30),

            // OTP Fields
            OtpInputFields(),
            const SizedBox(height: 25),

            // Resend OTP
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn’t receive OTP? ",
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                GestureDetector(
                  onTap: controller.resendCode,
                  child: const Text(
                    "Resend Code",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB95D25),
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Verify Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: controller.verifyOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB95D25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Verify",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
