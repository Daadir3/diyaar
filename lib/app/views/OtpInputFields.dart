import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/OtpController.dart';

class OtpInputFields extends StatelessWidget {
  final OtpController controller = Get.find<OtpController>();
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  OtpInputFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (i) {
        return SizedBox(
          width: 60,
          height: 60,
          child: Obx(
            () => TextField(
              focusNode: focusNodes[i],
              maxLength: 1,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white, // text color inside box
              ),
              onChanged: (val) {
                controller.updateOtp(i, val);
                if (val.isNotEmpty && i < 3) {
                  FocusScope.of(context).requestFocus(focusNodes[i + 1]);
                } else if (val.isEmpty && i > 0) {
                  FocusScope.of(context).requestFocus(focusNodes[i - 1]);
                }
              },
              controller: TextEditingController(text: controller.otpCode[i]),
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                fillColor: const Color(0xFF0A2940), // navy/dark blue background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
