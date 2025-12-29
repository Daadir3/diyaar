import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/translations/app_translations.dart';
import 'app/utils/app_colors.dart';
import 'app/bindings/initial_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  final box = GetStorage();

  // ✅ onboarding default = false (app cusub)
  final bool isOnboardingCompleted =
      box.read('isOnboardingCompleted') ?? false;

  runApp(MyApp(isOnboardingCompleted: isOnboardingCompleted));
}

class MyApp extends StatelessWidget {
  final bool isOnboardingCompleted;

  const MyApp({super.key, required this.isOnboardingCompleted});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Professional GetX App',

      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),

      initialBinding: InitialBinding(),

      // ✅ ONBOARDING HAL MAR KALIYA
      initialRoute: isOnboardingCompleted ? '/' : '/onboarding',

      getPages: AppPages.routes,

      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textWhite,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.secondary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
