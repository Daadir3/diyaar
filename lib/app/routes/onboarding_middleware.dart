import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final box = GetStorage();
    final isCompleted = box.read('isOnboardingCompleted') ?? false;

    if (isCompleted) {
      return const RouteSettings(name: '/login'); // onboarding dhamaaday
    }
    return null; // sii wad onboarding
  }
}
