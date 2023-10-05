import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../locales/locales.dart';
import '../models/page.dart';
import '../utils/constants.dart';
import '../views/article/page.dart';
import '../views/documents/page.dart';
import '../views/download/page.dart';
import '../views/home/page.dart';
import '../views/tokenomics/page.dart';
import '../views/topic/page.dart';
import 'dependencies.dart';

class SettingsController extends GetxController {
  // States
  final RxBool _scrollable = false.obs;
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
      binding: () => DownloadBinding(),
    ),
    PageModel(
      // This page is deprecated
      visible: false,
      name: AppPages.token,
      text: "1002@global",
      widget: () => const TokenomicsView(),
      binding: () => TokenomicsBinding(),
    ),
    PageModel(
      visible: true,
      name: AppPages.tokenomics,
      text: "1002@global",
      widget: () => const TokenomicsView(),
      binding: () => TokenomicsBinding(),
    ),
    PageModel(
      visible: true,
      name: AppPages.documents,
      text: "1003@global",
      widget: () => const DocumentsView(),
      binding: () => DocumentsBinding(),
    ),
    PageModel(
      visible: false,
      name: '${AppPages.documents}/:id',
      text: "",
      widget: () => const TopicView(),
      binding: () => DocumentsBinding(),
    ),
    PageModel(
      visible: false,
      name: '${AppPages.documents}/:id/:id',
      text: "",
      widget: () => const ArticleView(),
      binding: () => DocumentsBinding(),
    ),
  ];

  // Getter methods
  bool get scrollable => _scrollable.value;

  String get currentLanguage => _currentLanguage.value;

  Locale get locale => Locale(currentLanguage);

  Map<String, String> get languages => AppTranslator.locales;

  Iterable<PageModel> get pages => _pages.where((page) => page.visible);

  List<GetPage> get getPages => _pages
      .map((page) => GetPage(
            name: page.name,
            page: page.widget,
            binding: page.binding?.call(),
          ))
      .toList();

  // Setter methods
  Future<void> languageUpdate(String? language) async {
    if (language == null) return;

    _currentLanguage.value = language;
    await Get.updateLocale(locale);
  }

  void pageScrollableUpdate(ScrollController controller) {
    final double pixels = controller.position.pixels;
    final bool status = _scrollable.value;

    if (!status && pixels >= 200.0) {
      _scrollable.value = true;
    } else if (status && pixels < 200.0) {
      _scrollable.value = false;
    }
  }
}
