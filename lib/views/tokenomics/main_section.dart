import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/launch_url.dart';
import '../widgets/button.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class MainTokenomicsSection extends StatelessWidget {
  const MainTokenomicsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    return CustomSection(
      padding: const EdgeInsets.only(
        top: AppDecoration.paddingLargest,
        bottom: AppDecoration.paddingBig,
        right: AppDecoration.paddingBig,
        left: AppDecoration.paddingBig,
      ),
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(AppDecoration.radiusBig),
      ),
      backgroundColor: colorScheme.secondary,
      children: [
        CustomText(
          text: "1021@tokenomics".tr,
          textAlign: TextAlign.center,
          style: textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        verticalSpace(),
        CustomText(
          text: "1022@tokenomics".tr,
          textAlign: TextAlign.center,
          style: textTheme.headlineSmall,
        ),
        verticalSpace(AppDecoration.spaceBig),
        Wrap(
          spacing: AppDecoration.spaceMedium,
          runSpacing: AppDecoration.space,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            CustomButton(
              onPressed: () => openNewTab(AppInfo.audit),
              text: "1070@global".tr,
              width: 250.0,
            ),
            CustomButton(
              onPressed: () => openNewTab(AppInfo.tokenSmartContract),
              text: "1057@global".tr,
              type: ButtonType.outlined,
              width: 250.0,
            ),
          ],
        )
      ],
    );
  }
}
