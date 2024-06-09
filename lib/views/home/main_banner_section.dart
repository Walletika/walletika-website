import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/active_status.dart';
import '../widgets/button.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class MainBannerSection extends GetResponsiveView {
  MainBannerSection({
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
    final ColorScheme colorScheme = themeData.colorScheme;

    return CustomSection(
      stretch: true,
      padding: const EdgeInsets.all(AppDecoration.padding),
      backgroundColor: colorScheme.secondary,
      layout: SectionLayout.wrap,
      wrapSpacing: AppDecoration.space,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomActiveStatus(isActive: true),
            horizontalSpace(),
            Flexible(
              child: CustomText(
                text: "1029@home".tr,
                textAlign: TextAlign.center,
                style: textTheme.titleMedium,
              ),
            ),
          ],
        ),
        CustomButton(
          onPressed: () => Get.offNamed(AppPages.presale),
          text: "1006@global".tr,
          type: ButtonType.outlined,
          width: 120.0,
          height: 30.0,
        ),
      ],
    );
  }
}
