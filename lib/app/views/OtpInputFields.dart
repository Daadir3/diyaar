import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/OtpController.dart';

class OtpInputFields extends StatelessWidget {
  final OtpController controller = Get.find<OtpController>();
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  OtpInputFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (index) {
          return SizedBox(
            width: 55,
            child: TextField(
              focusNode: focusNodes[index],
              maxLength: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A2940),
              ),
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                fillColor: const Color(0xFFEFEFEF),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (val) {
                if (val.isNotEmpty) {
                  controller.updateOtp(index, val);
                  if (index < 3) {
                    FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                  } else {
                    FocusScope.of(context).unfocus();
                  }
                } else {
                  controller.updateOtp(index, "");
                  if (index > 0) {
                    FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                  }
                }
              },
            ),
          );
        }),
      ),
    );
  }
}
