import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class WhatIsSection extends GetResponsiveView {
  WhatIsSection({
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

CustomSection _sectionBuilder({
  required BuildContext context,
  BorderRadiusGeometry? borderRadius,
}) {
  final ThemeData themeData = Theme.of(context);
  final ColorScheme colorScheme = themeData.colorScheme;
  final TextTheme textTheme = themeData.textTheme;

  return CustomSection(
    height: 300.0,
    backgroundColor: colorScheme.primary,
    borderRadius: borderRadius,
    children: [
      CustomText(
        text: "1002@home".tr,
        textAlign: TextAlign.center,
        style: textTheme.displaySmall!.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      verticalSpace(),
      CustomText(
        text: "1003@home".tr,
        textAlign: TextAlign.center,
        style: textTheme.bodyLarge!.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
    ],
  );
}
