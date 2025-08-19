import 'package:get/get.dart';
import '../views/splash_view.dart';
import '../views/onboarding_view.dart';
import '../views/home_view.dart';
import '../views/detail_view.dart';
import '../bindings/home_binding.dart';
import '../bindings/onboarding_binding.dart';

class AppPages {
  static const initial = '/splash';

  static final routes = [
    GetPage(name: '/splash', page: () => const SplashView()),
    GetPage(
      name: '/onboarding',
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    // AppPages
    GetPage(name: '/', page: () => const HomeView(), binding: HomeBinding()),

    GetPage(name: '/detail', page: () => const DetailView()),
  ];
}
