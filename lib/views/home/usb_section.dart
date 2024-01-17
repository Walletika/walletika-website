import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/section.dart';
import '../widgets/text.dart';

class USBSection extends GetResponsiveView {
  USBSection({
    super.settings = AppDecoration.responsiveScreenSettings,
    super.key,
  });

  @override
  Widget? desktop() {
    return const _DesktopView();
  }

  @override
  Widget? tablet() {
    return const _TabletView();
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView();

  @override
  Widget build(BuildContext context) {
    return _sectionBuilder(
      context: context,
      borderRadius: BorderRadius.circular(AppDecoration.radiusBig),
    );
  }
}

class _TabletView extends StatelessWidget {
  const _TabletView();

  @override
  Widget build(BuildContext context) {
    return _sectionBuilder(context: context);
  }
}

Widget _sectionBuilder({
  required BuildContext context,
  BorderRadiusGeometry? borderRadius,
}) {
  final ThemeData themeData = Theme.of(context);
  final TextTheme textTheme = themeData.textTheme;

  return CustomSection(
    height: AppDecoration.sectionHeight,
    borderRadius: borderRadius,
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    padding: const EdgeInsets.symmetric(
      horizontal: AppDecoration.paddingBig,
      vertical: AppDecoration.paddingLarge,
    ),
    image: const DecorationImage(
      image: ExactAssetImage(AppImages.usbBackground),
      fit: BoxFit.cover,
      filterQuality: FilterQuality.medium,
    ),
    children: [
      CustomText(
        text: "1009@home".tr,
        style: textTheme.displaySmall!.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      CustomText(
        text: "1010@home".tr,
        style: textTheme.bodyLarge!.copyWith(color: AppColors.white),
      ),
    ],
  );
}
