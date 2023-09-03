import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
// import 'package:flutter_web_plugins/flutter_web_plugins.dart';
// import 'package:flutter/foundation.dart';
// import 'package:device_preview/device_preview.dart';

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
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const AppLauncher(), // Wrap your app
  //   ),
  // );
}

class AppLauncher extends GetView<SettingsController> {
  const AppLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // useInheritedMediaQuery: true,
      // builder: DevicePreview.appBuilder,
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
