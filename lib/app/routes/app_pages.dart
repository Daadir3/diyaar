import 'package:get/get.dart';
import '../views/splash_view.dart';
import '../views/onboarding_view.dart';
import '../views/home_view.dart';
import '../views/detail_view.dart';
import '../views/SignupView.dart';
import '../views/OtpVerificationPage.dart';
import '../views/LoginView.dart'; // 👈 import Login view
import '../bindings/home_binding.dart';
import '../bindings/onboarding_binding.dart';
import '../bindings/SignupBinding.dart';
import '../bindings/OtpBinding.dart';
import '../bindings/LoginBinding.dart'; // 👈 import Login binding

class AppPages {
  static const initial = '/splash';
  static const otp = '/otp';
  static const login = '/login';

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

    // 👇 Login
    GetPage(
      name: '/login',
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
