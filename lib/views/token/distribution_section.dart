import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/pie_chart.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class DistributionTokenSection extends StatelessWidget {
  const DistributionTokenSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return CustomSection(
      children: [
        CustomText(
          text: "1010@token".tr,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium,
        ),
        verticalSpace(AppDecoration.spaceMedium),
        CustomText(
          text: "1016@token".tr,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpace(AppDecoration.spaceLarge),
        CustomPieChart(
          indicatorWidth: 400.0,
          items: {
            "1011@token".tr: 35.0,
            "1012@token".tr: 5.0,
            "1013@token".tr: 13.0,
            "1014@token".tr: 30.0,
            "1015@token".tr: 17.0,
          },
        ),
      ],
    );
  }
}
