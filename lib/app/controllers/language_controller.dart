import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final _storage = GetStorage();
  var locale = const Locale('en', 'US').obs;

  @override
  void onInit() {
    super.onInit();
    // Load saved locale
    final langCode = _storage.read('lang_code') ?? 'en';
    final countryCode = _storage.read('country_code') ?? 'US';
    locale.value = Locale(langCode, countryCode);
    Get.updateLocale(locale.value);
  }

  void changeLanguage(Locale newLocale) {
    locale.value = newLocale;
    Get.updateLocale(newLocale);

    // Save to storage
    _storage.write('lang_code', newLocale.languageCode);
    _storage.write('country_code', newLocale.countryCode);
  }
}
