import 'package:diyaar/app/bindings/FavoriteBinding.dart';
import 'package:diyaar/app/bindings/profile_binding.dart';
import 'package:diyaar/app/views/favorite_view.dart';
import 'package:diyaar/app/views/profile_view.dart';
import 'package:get/get.dart';

import '../views/splash_view.dart';
import '../views/onboarding_view.dart';
import '../views/home_view.dart';
import '../views/detail_view.dart';
import '../views/SignupView.dart';
import '../views/OtpVerificationPage.dart';
import '../views/LoginView.dart';
import '../views/booking_tour_view.dart';

// ✅ Chat imports
import '../views/chat_view.dart';
import '../bindings/chat_binding.dart';

import '../bindings/home_binding.dart';
import '../bindings/onboarding_binding.dart';
import '../bindings/SignupBinding.dart';
import '../bindings/OtpBinding.dart';
import '../bindings/LoginBinding.dart';
import '../bindings/booking_tour_binding.dart';

class AppPages {
  static const initial = '/splash';
  static const otp = '/otp';
  static const login = '/login';
  static const booking = '/booking';
  static const profile = '/profile';
  static const favorite = '/favorite';
  static const chat = '/chat'; // ✅ cusub

  static final routes = [
    GetPage(name: '/splash', page: () => const SplashView()),
    GetPage(
      name: '/onboarding',
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(name: '/', page: () => const HomeView(), binding: HomeBinding()),
    GetPage(name: '/detail', page: () => const DetailView()),

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

    // Login
    GetPage(
      name: '/login',
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
    ),

    // Booking Tour
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
      page: () => const FavoriteView(),
      binding: FavoriteBinding(),
      transition: Transition.rightToLeft,
    ),

    // ✅ Chat
    GetPage(
      name: '/chat',
      page: () => const ChatView(),
      binding: ChatBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
