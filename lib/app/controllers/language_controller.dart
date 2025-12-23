import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final box = GetStorage();
  static const _key = 'language';

  Rx<Locale> locale = const Locale('en', 'US').obs;

  @override
  void onInit() {
    loadLanguage();
    super.onInit();
  }

  void changeLanguage(Locale newLocale) {
    locale.value = newLocale;
    Get.updateLocale(newLocale);

    box.write(
      _key,
      '${newLocale.languageCode}_${newLocale.countryCode}',
    );
  }

  void loadLanguage() {
    final saved = box.read<String>(_key);

    if (saved != null) {
      final parts = saved.split('_');
      final savedLocale = Locale(parts[0], parts[1]);
      locale.value = savedLocale;
      Get.updateLocale(savedLocale);
    }
  }
}
