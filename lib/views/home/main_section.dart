import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/launch_url.dart';
import '../widgets/button.dart';
import '../widgets/image.dart';
import '../widgets/multiple_transition.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class MainSection extends GetResponsiveView {
  MainSection({
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
    return CustomSection(
      layout: SectionLayout.wrap,
      children: [
        SizedBox(
          width: 360.0,
          child: _textBuilder(context: context),
        ),
        const CustomImage(path: AppImages.wallet, width: 550.0),
      ],
    );
  }
}

class _TabletView extends StatelessWidget {
  const _TabletView();

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDecoration.padding,
        vertical: AppDecoration.paddingLargest,
      ),
      layout: SectionLayout.wrap,
      children: [
        _textBuilder(context: context, isTablet: true),
        const CustomImage(path: AppImages.wallet, width: 550.0),
      ],
    );
  }
}

Widget _textBuilder({
  required BuildContext context,
  bool isTablet = false,
}) {
  final ThemeData themeData = Theme.of(context);
  final TextTheme textTheme = themeData.textTheme;
  final TextStyle titleStyle = (context.width > 400.0
          ? textTheme.displayLarge
          : textTheme.displayMedium)!
      .copyWith(fontWeight: FontWeight.w900);
  final ColorScheme colorScheme = themeData.colorScheme;

  return Column(
    crossAxisAlignment:
        isTablet ? CrossAxisAlignment.center : CrossAxisAlignment.start,
    children: [
      CustomMultipleTransition(
        children: [
          CustomText(
            key: const ValueKey<int>(1),
            text: "1000@home".tr,
            textAlign: isTablet ? TextAlign.center : TextAlign.start,
            maxWidth: 360.0,
            style: titleStyle,
          ),
          CustomText(
            key: const ValueKey<int>(2),
            text: "1004@home".tr,
            textAlign: isTablet ? TextAlign.center : TextAlign.start,
            maxWidth: 360.0,
            style: titleStyle,
          ),
        ],
      ),
      verticalSpace(AppDecoration.spaceMedium),
      CustomText(
        text: "1001@home".tr,
        textAlign: isTablet ? TextAlign.center : TextAlign.start,
        maxWidth: 360.0,
        style: textTheme.titleLarge,
        blueLightColor: true,
      ),
      verticalSpace(AppDecoration.spaceLarge),
      Wrap(
        spacing: AppDecoration.space,
        runSpacing: AppDecoration.space,
        children: [
          CustomButton(
            onPressed: () => Get.offNamed(AppPages.download),
            imageURL: AppImages.androidPackage,
            type: ButtonType.image,
            width: 170.0,
            height: 51.0,
          ),
          CustomButton(
            onPressed: () => Get.offNamed(AppPages.download),
            imageURL: AppImages.windowsPackage,
            type: ButtonType.image,
            width: 170.0,
            height: 51.0,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 170.0, minHeight: 51.0),
            child: OutlinedButton(
              onPressed: () => openNewTab(AppInfo.whitepaperPDF),
              child: Column(
                children: [
                  Text("1030@global".tr),
                  CustomText(
                    text: "1071@global".tr,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
