import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';

import 'controllers/dependencies.dart';
import 'controllers/settings.dart';
import 'locales/locales.dart';
import 'utils/constants.dart';
import 'views/documents/page.dart';
import 'views/download/page.dart';
import 'views/home/page.dart';
import 'views/token/page.dart';
import 'views/widgets/theme.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());

  WidgetsFlutterBinding.ensureInitialized();

  InitialBinding().dependencies();

  runApp(AppLauncher());
}

class AppLauncher extends StatelessWidget {
  AppLauncher({super.key});

  final SettingsController settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppInfo.titlePage,
      theme: applicationLightTheme,
      darkTheme: applicationDarkTheme,
      themeMode: settingsController.theme,
      locale: settingsController.locale,
      translations: AppTranslator(),
      defaultTransition: Transition.fadeIn,
      initialRoute: AppPages.home,
      getPages: [
        GetPage(
          name: AppPages.home,
          page: () => const HomeView(),
        ),
        GetPage(
          name: AppPages.download,
          page: () => const DownloadView(),
        ),
        GetPage(
          name: AppPages.token,
          page: () => const TokenView(),
        ),
        GetPage(
          name: AppPages.documents,
          page: () => const DocumentsView(),
        ),
      ],
    );
  }
}
