import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:device_preview/device_preview.dart';

import 'controllers/dependencies.dart';
import 'controllers/settings.dart';
import 'firebase_options.dart';
import 'locales/locales.dart';
import 'utils/constants.dart';
import 'views/home/page.dart';
import 'views/splash/page.dart';
import 'views/widgets/theme.dart';

void main() async {
  setUrlStrategy(PathUrlStrategy());

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  InitialBinding().dependencies();

  timeago.setLocaleMessages('ar', timeago.ArMessages());

  runApp(AppLauncher());
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const AppLauncher(), // Wrap your app
  //   ),
  // );
}

class AppLauncher extends GetView<SettingsController> {
  AppLauncher({super.key});
  final Future _initialization = Future.delayed(const Duration(seconds: 1));

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // useInheritedMediaQuery: true,
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: AppInfo.titlePage,
      theme: applicationLightTheme,
      locale: controller.locale,
      translations: AppTranslator(),
      defaultTransition: Transition.fadeIn,
      getPages: controller.getPages,
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashView();
          } else {
            return const HomeView();
          }
        },
      ),
    );
  }
}
