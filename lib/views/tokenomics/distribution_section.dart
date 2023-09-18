import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/launch_url.dart';
import '../widgets/button.dart';
import '../widgets/pie_chart.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class TokenDistributionSection extends StatelessWidget {
  const TokenDistributionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return CustomSection(
      children: [
        CustomText(
          text: "1010@tokenomics".tr,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium,
        ),
        verticalSpace(AppDecoration.spaceMedium),
        CustomText(
          text: "1016@tokenomics".tr,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpace(AppDecoration.spaceBig),
        CustomButton(
          onPressed: () => openNewTab(AppInfo.tokenSmartContract),
          text: "1057@global".tr,
          width: 300.0,
        ),
        verticalSpace(AppDecoration.spaceLarge),
        CustomPieChart(
          indicatorWidth: 400.0,
          items: {
            "1011@tokenomics".tr: 35.0,
            "1012@tokenomics".tr: 5.0,
            "1013@tokenomics".tr: 13.0,
            "1014@tokenomics".tr: 30.0,
            "1015@tokenomics".tr: 17.0,
          },
        ),
      ],
    );
  }
}
