import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../utils/constants.dart';
import '../../utils/launch_url.dart';
import '../widgets/button.dart';
import '../widgets/section.dart';
import '../widgets/text.dart';

class FollowSaleSection extends StatelessWidget {
  const FollowSaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    return CustomSection(
      children: [
        Container(
          padding: const EdgeInsets.all(AppDecoration.paddingMedium),
          decoration: BoxDecoration(
            color: colorScheme.primary.withAlpha(10),
            border: Border.all(color: colorScheme.primary),
            borderRadius: BorderRadius.circular(AppDecoration.radiusBig),
          ),
          child: Column(
            children: [
              CustomText(
                text: "1017@tokenomics".tr,
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge!.copyWith(
                  color: colorScheme.primary,
                ),
              ),
              CustomButton(
                onPressed: () => openNewTab(AppInfo.telegramGroup),
                text: "1008@global".tr,
                icon: const Icon(LineIcons.telegram),
                type: ButtonType.text,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
