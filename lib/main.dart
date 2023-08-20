import 'package:flutter/material.dart';
// import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'controllers/dependencies.dart';
import 'controllers/settings.dart';
import 'locales/locales.dart';
import 'utils/constants.dart';
import 'views/widgets/theme.dart';

void main() {
  // setUrlStrategy(PathUrlStrategy());

  WidgetsFlutterBinding.ensureInitialized();

  InitialBinding().dependencies();

  timeago.setLocaleMessages('ar', timeago.ArMessages());

  runApp(const AppLauncher());
}

class AppLauncher extends GetView<SettingsController> {
  const AppLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppInfo.titlePage,
      theme: applicationLightTheme,
      darkTheme: applicationDarkTheme,
      themeMode: controller.theme,
      locale: controller.locale,
      translations: AppTranslator(),
      defaultTransition: Transition.fadeIn,
      initialRoute: controller.initialPage,
      getPages: controller.getPages,
    );
  }
}
