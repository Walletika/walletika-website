import 'package:get/get.dart';

class ScreenMode {
  const ScreenMode(this.width);

  final double width;

  ScreenType get screenType {
    switch (width) {
      case <= 630.0:
        return ScreenType.Phone;
      case <= 800.0:
        return ScreenType.Tablet;
      default:
        return ScreenType.Desktop;
    }
  }

  bool get isPhone => screenType == ScreenType.Phone;

  bool get isTablet => screenType == ScreenType.Tablet;

  bool get isTabletOrPhone => isPhone || isTablet;

  bool get isDesktop => screenType == ScreenType.Desktop;
}
