import 'package:diyaar/app/bindings/FavoriteBinding.dart';
import 'package:diyaar/app/bindings/LoginBinding.dart';
import 'package:diyaar/app/bindings/OtpBinding.dart';
import 'package:diyaar/app/bindings/SignupBinding.dart';
import 'package:diyaar/app/bindings/booking_tour_binding.dart';
import 'package:diyaar/app/bindings/chat_binding.dart';
import 'package:diyaar/app/bindings/profile_binding.dart';
import 'package:diyaar/app/views/LoginView.dart';
import 'package:diyaar/app/views/OtpVerificationPage.dart';
import 'package:diyaar/app/views/SignupView.dart';
import 'package:diyaar/app/views/booking_tour_view.dart';
import 'package:diyaar/app/views/chat_view.dart';
import 'package:diyaar/app/views/detail_view.dart';
import 'package:diyaar/app/views/favorite_view.dart' show FavoriteView;
import 'package:diyaar/app/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/onboarding_view.dart';
import '../views/home_view.dart';
import '../views/splash_view.dart';
import '../bindings/onboarding_binding.dart';
import '../bindings/home_binding.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final box = GetStorage();
    final isCompleted = box.read('isOnboardingCompleted') ?? false;
    if (isCompleted) {
      return const RouteSettings(name: '/login');
    }
    return null;
  }
}

class AppPages {
  static final routes = [
    // Splash
    GetPage(name: '/splash', page: () => const SplashView()),

    // Onboarding
    GetPage(
      name: '/onboarding',
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
      middlewares: [OnboardingMiddleware()],
    ),

    // Home
    GetPage(name: '/', page: () =>  HomeView(), binding: HomeBinding()),

    // Login
    GetPage(
      name: '/login',
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
    ),

    // Signup
    GetPage(
      name: '/signup',
      page: () => SignupView(),
      binding: SignupBinding(),
    ),

    // OTP Verification
    GetPage(
      name: '/otp',
      page: () => OtpVerificationPage(email: Get.arguments ?? ""),
      binding: OtpBinding(),
      transition: Transition.rightToLeft,
    ),

    // Booking
    GetPage(
      name: '/booking',
      page: () => const BookingTourView(),
      binding: BookingTourBinding(),
      transition: Transition.rightToLeft,
    ),

    // Profile
    GetPage(
      name: '/profile',
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),

    // Favorite
    GetPage(
      name: '/favorite',
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
      transition: Transition.rightToLeft,
    ),

    // Chat
    GetPage(
      name: '/chat',
      page: () => const ChatView(),
      binding: ChatBinding(),
      transition: Transition.rightToLeft,
    ),

    // Detail
    GetPage(name: '/detail', page: () => const DetailView()),
  ];
}
