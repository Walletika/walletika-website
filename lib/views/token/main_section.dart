import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class MainTokenSection extends StatelessWidget {
  const MainTokenSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    return CustomSection(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(AppDecoration.radiusBig),
      ),
      backgroundColor: colorScheme.secondary,
      children: [
        CustomText(
          text: "1000@token".tr,
          textAlign: TextAlign.center,
          style: textTheme.displayMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        verticalSpace(),
        CustomText(
          text: "1001@token".tr,
          textAlign: TextAlign.center,
          style: textTheme.headlineSmall,
        ),
      ],
    );
  }
}
