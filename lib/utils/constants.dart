import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppInfo {
  static const String name = 'Walletika';
  static const String officialPublisher = 'Walletika Team';
  static const String titlePage = 'Walletika - Best Secure Crypto Wallet';
  static const String twitter = 'https://twitter.com/WalletikaApp';
  static const String telegramChannel = 'https://t.me/walletika';
  static const String telegramGroup = 'https://t.me/walletikacommunity';
  static const String github = 'https://github.com/Walletika';
  static const String topicsAPI =
      'https://raw.githubusercontent.com/Walletika/walletika-web-docs/main/topics.json';
  static const String packagesAPI =
      'https://raw.githubusercontent.com/Walletika/walletika-web-packages/main/packages.json';
}

class AppDecoration {
  static const double radiusSmall = 5.0;
  static const double radius = 10.0;
  static const double radiusMedium = 20.0;
  static const double radiusBig = 30.0;
  static const double radiusLarge = 50.0;
  static const double margin = 10.0;
  static const double marginMedium = 20.0;
  static const double paddingSmall = 5.0;
  static const double padding = 10.0;
  static const double paddingMedium = 20.0;
  static const double paddingBig = 30.0;
  static const double paddingLarge = 50.0;
  static const double spaceSmall = 5.0;
  static const double space = 10.0;
  static const double spaceMedium = 20.0;
  static const double spaceBig = 30.0;
  static const double spaceLarge = 50.0;
  static const double elevationSmall = 10.0;
  static const double elevation = 20.0;
  static const double iconSize = 24.0;
  static const double iconSmallSize = 20.0;
  static const double iconMediumSize = 30.0;
  static const double iconBigSize = 40.0;
  static const double iconLargeSize = 50.0;
  static const double dividerPadding = 20.0;
  static const double widgetWidth = 300.0;
  static const double minButtonWidth = 150.0;
  static const double buttonHeight = 35.0;
  static const double buttonHeightMedium = 40.0;
  static const double buttonHeightLarge = 50.0;
  static const double pageWidth = 1024.0;
  static const double docsPageWidth = 700.0;
  static const double sectionHeight = 400.0;
  static const double textSectionWidth = 800.0;
  static const double headerHeight = 90.0;
  static const ResponsiveScreenSettings responsiveScreenSettings =
      ResponsiveScreenSettings(desktopChangePoint: 1024.0);
  static const TextOverflow textOverflow = TextOverflow.fade;
}

class AppColors {
  static const Color font = Color(0xff000000);
  static const Color fontDark = Color(0xffffffff);
  static const Color font2 = Color(0xff747f8c);
  static const Color font2Dark = Color(0xff747f8c);
  static const Color background = Color(0xffffffff);
  static const Color backgroundDark = Color(0xff141416);
  static const Color background2 = Color(0xfff0f2f5);
  static const Color background2Dark = Color(0xff1a1a1d);
  static const Color background3 = Color(0xffe4e6eb);
  static const Color background3Dark = Color(0xff23262f);
  static const Color icon = Color(0xff606770);
  static const Color iconDark = Color(0xff606770);
  static const Color highlight = Color(0xff1652f0);
  static const Color shadow = Color(0xff000000);
  static const Color shadowLight = Color(0x73000000);
  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color red = Color(0xfff44336);
  static const Color green = Color(0xff05b169);
  static const Color orange = Color(0xffff9800);
  static const Color grey = Color(0xff9e9e9e);
  static const Color purple = Color(0xff9c27b0);
  static const Color purpleAccent = Color(0xffe040fb);
}

class AppImages {
  static const String logo = 'assets/logos/app_logo.png';
  static const String searchIllustrations = 'assets/illustrations/search.png';
  static const String usbIllustrations = 'assets/illustrations/usb.png';
  static const String telegramIllustrations =
      'assets/illustrations/telegram.png';
  static const String pageNotFoundIllustrations =
      'assets/illustrations/page_not_found.png';

  static const Map<String, Map<String, String>> _images = {
    "walletApp": {
      "light": 'assets/illustrations/wallet.png',
      "dark": 'assets/illustrations/wallet_dark.png',
    },
    "walletLogin": {
      "light": 'assets/illustrations/wallet_login.png',
      "dark": 'assets/illustrations/wallet_login_dark.png',
    },
    "walletAuth": {
      "light": 'assets/illustrations/wallet_auth.png',
      "dark": 'assets/illustrations/wallet_auth_dark.png',
    },
    "mobile": {
      "light": 'assets/illustrations/mobile.png',
      "dark": 'assets/illustrations/mobile_dark.png',
    },
    "desktop": {
      "light": 'assets/illustrations/desktop.png',
      "dark": 'assets/illustrations/desktop_dark.png',
    },
  };

  static String theme(String name) {
    return _images[name]![Get.isDarkMode ? "dark" : "light"]!;
  }
}

class AppLanguages {
  static const String en = 'en';
  static const String ar = 'ar';
}

class AppPages {
  static const String home = '/';
  static const String download = '/download';
  static const String documents = '/documents';
}
