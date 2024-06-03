import 'package:firebase_analytics/firebase_analytics.dart';
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
  AppLauncher({super.key}) {
    final referralID = Uri.base.queryParameters['id'];

    if (referralID != null) {
      FirebaseAnalytics.instance.logEvent(name: "Referral", parameters: {
        "referrals": referralID,
      });
    }
  }

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
      initialRoute: controller.initialPage,
      getPages: controller.getPages,
    );
  }
}
