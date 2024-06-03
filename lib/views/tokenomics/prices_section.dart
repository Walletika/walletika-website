import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/image.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class PricesSection extends GetResponsiveView {
  PricesSection({
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
    padding: const EdgeInsets.all(AppDecoration.paddingBig),
    backgroundColor: colorScheme.secondary,
    layout: SectionLayout.wrap,
    wrapSpacing: 0,
    wrapCrossAlignment: WrapCrossAlignment.start,
    children: [
      Column(
        children: [
          CustomText(
            text: "1003@tokenomics".tr,
            maxWidth: 400.0,
            style: textTheme.displayMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(),
          CustomText(
            text: "1062@tokenomics".tr,
            maxWidth: 400.0,
            style: textTheme.headlineSmall,
          ),
        ],
      ),
      const CustomImage(path: AppImages.pricesBackground, height: 300.0),
    ],
  );
}
