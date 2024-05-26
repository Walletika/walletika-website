import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class NoDataSection extends StatelessWidget {
  const NoDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return CustomSection(
      padding: const EdgeInsets.only(
        top: AppDecoration.paddingLargest,
        bottom: AppDecoration.paddingMedium,
        right: AppDecoration.paddingBig,
        left: AppDecoration.paddingBig,
      ),
      wrapSpacing: AppDecoration.spaceMedium,
      layout: SectionLayout.wrap,
      children: [
        Column(
          children: [
            CustomText(
              text: "1002@home".tr,
              textAlign: TextAlign.center,
              style: textTheme.displayMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(),
            CustomText(
              text: "1003@home".tr,
              textAlign: TextAlign.center,
              style: textTheme.titleLarge,
              blueLightColor: true,
              maxWidth: AppDecoration.pageWidth,
            )
          ],
        ),
      ],
    );
  }
}
