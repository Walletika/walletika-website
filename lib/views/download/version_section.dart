import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class VersionSection extends StatelessWidget {
  const VersionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return CustomSection(
      padding: const EdgeInsets.only(
        top: AppDecoration.spaceLarge,
        bottom: 0,
        right: AppDecoration.spaceBig,
        left: AppDecoration.spaceBig,
      ),
      children: [
        CustomText(
          text: "1007@download".tr,
          textAlign: TextAlign.center,
          style: textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        verticalSpace(),
        CustomText(
          text: "1009@download".tr,
          textAlign: TextAlign.center,
          style: textTheme.headlineSmall,
        ),
      ],
    );
  }
}
