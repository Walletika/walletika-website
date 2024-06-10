import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/launch_url.dart';
import '../widgets/button.dart';
import '../widgets/image.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class AirdropSection extends GetResponsiveView {
  AirdropSection({
    super.settings = AppDecoration.responsiveScreenSettings,
    super.key,
  });

  @override
  Widget? desktop() {
    return const _DesktopView();
  }

  @override
  Widget? tablet() {
    return const _TabletView();
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView();

  @override
  Widget build(BuildContext context) {
    return _textBuilder(context: context);
  }
}

class _TabletView extends StatelessWidget {
  const _TabletView();

  @override
  Widget build(BuildContext context) {
    return _textBuilder(
      context: context,
      isTablet: true,
    );
  }
}

Widget _textBuilder({
  required BuildContext context,
  bool isTablet = false,
}) {
  final ThemeData themeData = Theme.of(context);
  final TextTheme textTheme = themeData.textTheme;
  final ColorScheme colorScheme = themeData.colorScheme;

  return CustomSection(
    stretch: true,
    backgroundColor: colorScheme.tertiary,
    layout: SectionLayout.wrap,
    padding: EdgeInsets.symmetric(
      horizontal: AppDecoration.padding,
      vertical:
          isTablet ? AppDecoration.paddingBig : AppDecoration.paddingMedium,
    ),
    children: [
      if (!isTablet)
        const CustomImage(path: AppImages.airdropIllustrations, width: 300.0),
      Column(
        crossAxisAlignment:
            isTablet ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "1035@home".tr,
            textAlign: isTablet ? TextAlign.center : TextAlign.start,
            maxWidth: isTablet ? AppDecoration.textSectionWidth : 450.0,
            style:
                textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w900),
          ),
          verticalSpace(),
          CustomText(
            text: "1036@home".tr,
            textAlign: isTablet ? TextAlign.center : TextAlign.start,
            maxWidth: isTablet ? AppDecoration.textSectionWidth : 450.0,
            blueLightColor: true,
            style: textTheme.titleLarge,
          ),
          verticalSpace(AppDecoration.spaceLarge),
          CustomButton(
            onPressed: () => openNewTab(AppInfo.airdrop),
            text: "1083@global".tr,
          ),
        ],
      ),
      if (isTablet)
        const CustomImage(path: AppImages.airdropIllustrations, width: 300.0),
    ],
  );
}
