import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("home_title".tr)),
      body: Center(child: Obx(() => Text("${"counter".tr}: ${controller.count}", style: AppTextStyles.heading))),
      floatingActionButton: FloatingActionButton(onPressed: () => controller.increment(), child: const Icon(Icons.add)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () => Get.toNamed('/detail', arguments: {"counter": controller.count.value}),
          child: Text("go_detail".tr, style: AppTextStyles.button),
        ),
      ),
    );
  }
}
