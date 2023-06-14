import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../locales/locales.dart';
import '../models/page.dart';
import '../utils/constants.dart';
import '../views/documents/page.dart';
import '../views/download/page.dart';
import '../views/home/page.dart';

class SettingsController extends GetxController {
  // States
  final RxBool _isDarkMode = false.obs;
  final RxString _currentLanguage = AppLanguages.en.obs;

  final String initialPage = AppPages.home;
  final List<PageModel> _pages = [
    PageModel(
      visible: true,
      name: AppPages.home,
      text: "1000@global",
      widget: () => const HomeView(),
    ),
    PageModel(
      visible: true,
      name: AppPages.download,
      text: "1001@global",
      widget: () => const DownloadView(),
    ),
    PageModel(
      visible: true,
      name: AppPages.documents,
      text: "1003@global",
      widget: () => const DocumentsView(),
    ),
  ];

  // Getter methods
  bool get isDarkMode => _isDarkMode.value;

  String get currentLanguage => _currentLanguage.value;

  ThemeMode get theme => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  Locale get locale => Locale(currentLanguage);

  Map<String, String> get languages => AppTranslator.locales;

  Iterable<PageModel> get pages => _pages.where((page) => page.visible);

  List<GetPage> get getPages => _pages
      .map((page) => GetPage(name: page.name, page: page.widget))
      .toList();

  // Setter methods
  Future<void> themeUpdate() async {
    _isDarkMode.value = !isDarkMode;
    Get.changeThemeMode(theme);
  }

  Future<void> languageUpdate(String? language) async {
    _currentLanguage.value = language!;
    await Get.updateLocale(locale);
  }

  void addPage(PageModel page) {
    _pages.add(page);
  }
}
