import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/feature.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class BuyStepsSection extends GetResponsiveView {
  BuyStepsSection({
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
    const double width = 225.0;

    return CustomSection(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDecoration.paddingBig,
        vertical: 0,
      ),
      wrapSpacing: AppDecoration.spaceMedium,
      wrapCrossAlignment: WrapCrossAlignment.start,
      layout: SectionLayout.wrap,
      children: [
        Column(
          children: [
            SizedBox(
              width: AppDecoration.textSectionWidth,
              child: CustomText(
                text: "1046@tokenomics".tr,
                textAlign: TextAlign.center,
                maxWidth: 900.0,
                style: textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            verticalSpace(AppDecoration.spaceMedium),
          ],
        ),
        CustomFeature(
          title: "1047@tokenomics".tr,
          description: "1048@tokenomics".tr,
          width: width,
        ),
        CustomFeature(
          title: "1049@tokenomics".tr,
          description: "1050@tokenomics".tr,
          width: width,
        ),
        CustomFeature(
          title: "1051@tokenomics".tr,
          description: "1052@tokenomics".tr,
          width: width,
        ),
        CustomFeature(
          title: "1053@tokenomics".tr,
          description: "1054@tokenomics".tr,
          width: width,
        ),
      ],
    );
  }
}
