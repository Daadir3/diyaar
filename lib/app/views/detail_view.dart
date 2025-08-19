import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_text_styles.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};
    final counter = (args['counter'] as int?) ?? 0;

    return Scaffold(
      appBar: AppBar(title: Text("detail_title".tr)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${"value_from_home".tr}: $counter", style: AppTextStyles.heading, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () => Get.back(), child: const Text("Back")),
          ],
        ),
      ),
    );
  }
}
