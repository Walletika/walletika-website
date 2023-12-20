import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../utils/constants.dart';
import '../widgets/feature.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class SubFeaturesSection extends GetResponsiveView {
  SubFeaturesSection({
    super.settings = AppDecoration.responsiveScreenSettings,
    super.key,
  });

  @override
  Widget? desktop() {
    return const _DesktopView();
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    const double width = 285.0;

    return CustomSection(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDecoration.paddingBig,
        vertical: 0,
      ),
      layout: SectionLayout.wrap,
      children: [
        Column(
          children: [
            CustomText(
              text: "1011@home".tr,
              textAlign: TextAlign.center,
              maxWidth: 900.0,
              style: textTheme.headlineLarge,
            ),
            verticalSpace(AppDecoration.spaceMedium),
          ],
        ),
        CustomFeature(
          icon: const Icon(
            LineIcons.alternateExchange,
            size: AppDecoration.iconBigSize,
          ),
          title: "1022@home".tr,
          description: "1023@home".tr,
          width: width,
        ),
        CustomFeature(
          icon: const Icon(
            LineIcons.wavyMoneyBill,
            size: AppDecoration.iconBigSize,
          ),
          title: "1016@home".tr,
          description: "1017@home".tr,
          width: width,
        ),
        CustomFeature(
          icon: const Icon(
            LineIcons.wallet,
            size: AppDecoration.iconBigSize,
          ),
          title: "1020@home".tr,
          description: "1021@home".tr,
          width: width,
        ),
      ],
    );
  }
}
