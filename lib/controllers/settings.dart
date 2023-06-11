import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../locales/locales.dart';
import '../models/page.dart';
import '../utils/constants.dart';

class SettingsController extends GetxController {
  // States
  final RxBool _isDarkMode = false.obs;
  final RxString _currentLanguage = AppLanguages.en.obs;

  final List<PageModel> _pages = [
    PageModel(visible: true, path: AppPages.home, text: "1000@global"),
    PageModel(visible: true, path: AppPages.download, text: "1001@global"),
    PageModel(visible: false, path: AppPages.token, text: "1002@global"),
    PageModel(visible: true, path: AppPages.documents, text: "1003@global"),
  ];

  // Getter methods
  bool get isDarkMode => _isDarkMode.value;

  String get currentLanguage => _currentLanguage.value;

  ThemeMode get theme => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  Locale get locale => Locale(currentLanguage);

  Map<String, String> get languages => AppTranslator.locales;

  Iterable<PageModel> get pages => _pages.where((page) => page.visible);

  // Setter methods
  Future<void> themeUpdate() async {
    _isDarkMode.value = !isDarkMode;
    Get.changeThemeMode(theme);
  }

  Future<void> languageUpdate(String? language) async {
    _currentLanguage.value = language!;
    await Get.updateLocale(locale);
  }
}
