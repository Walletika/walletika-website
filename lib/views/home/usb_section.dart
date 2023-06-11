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
    return _sectionBuilder(context: context);
  }
}

Widget _sectionBuilder({
  required BuildContext context,
  BorderRadiusGeometry? borderRadius,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "1009@home".tr,
            maxWidth: 420.0,
            style:
                textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
          ),
          verticalSpace(),
          CustomText(
            text: "1010@home".tr,
            maxWidth: 420.0,
            blueLightColor: true,
          ),
        ],
      ),
      const CustomImage(
        path: AppImages.usbIllustrations,
        width: 300.0,
        height: 200.0,
      ),
    ],
  );
}
