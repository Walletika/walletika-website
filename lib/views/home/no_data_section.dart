import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../utils/constants.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class NoDataSection extends GetResponsiveView {
  NoDataSection({
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
    return _sectionBuilder(
      context: context,
      textAlign: TextAlign.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}

CustomSection _sectionBuilder({
  required BuildContext context,
  BorderRadiusGeometry? borderRadius,
  CrossAxisAlignment? crossAxisAlignment,
  TextAlign? textAlign,
}) {
  final ThemeData themeData = Theme.of(context);
  final ColorScheme colorScheme = themeData.colorScheme;
  final TextTheme textTheme = themeData.textTheme;

  return CustomSection(
    borderRadius: borderRadius,
    backgroundColor: colorScheme.primary,
    wrapSpacing: AppDecoration.spaceMedium,
    layout: SectionLayout.wrap,
    children: [
      const Icon(
        LineIcons.alternateShield,
        size: 120.0,
        color: AppColors.white,
      ),
      Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "1002@home".tr,
            textAlign: textAlign ?? TextAlign.start,
            maxWidth: 650.0,
            style: textTheme.displaySmall!.copyWith(color: AppColors.white),
          ),
          verticalSpace(AppDecoration.spaceSmall),
          CustomText(
            text: "1003@home".tr,
            textAlign: textAlign ?? TextAlign.start,
            maxWidth: 600.0,
            style: textTheme.bodyLarge!.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    ],
  );
}
