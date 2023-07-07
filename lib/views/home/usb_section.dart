import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/image.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
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
    return _sectionBuilder(
      context: context,
      crossAxisAlignment: CrossAxisAlignment.center,
      textAlign: TextAlign.center,
    );
  }
}

Widget _sectionBuilder({
  required BuildContext context,
  BorderRadiusGeometry? borderRadius,
  CrossAxisAlignment? crossAxisAlignment,
  TextAlign? textAlign,
}) {
  final ThemeData themeData = Theme.of(context);
  final TextTheme textTheme = themeData.textTheme;
  final ColorScheme colorScheme = themeData.colorScheme;

  return CustomSection(
    borderRadius: borderRadius,
    backgroundColor: colorScheme.secondary,
    layout: SectionLayout.wrap,
    children: [
      Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "1009@home".tr,
            textAlign: textAlign ?? TextAlign.start,
            maxWidth: 390.0,
            style: textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(),
          CustomText(
            text: "1010@home".tr,
            textAlign: textAlign ?? TextAlign.start,
            maxWidth: 390.0,
            blueLightColor: true,
          ),
        ],
      ),
      const CustomImage(
        path: AppImages.usbIllustrations,
        width: 300.0,
      ),
    ],
  );
}
