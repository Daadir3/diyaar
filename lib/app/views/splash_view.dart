import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      bool seenOnboarding = box.read('seenOnboarding') ?? false;
      if (seenOnboarding) {
        Get.offAllNamed('/');
      } else {
        Get.offAllNamed('/onboarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.customBlue, // ✅ custom color
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/diyaar1.png', // ✅ hubi path image kaaga
              width: 220,
              height: 220,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
