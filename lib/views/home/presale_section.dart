import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/launch_url.dart';
import '../widgets/button.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class PresaleSection extends GetResponsiveView {
  PresaleSection({
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
    return _sectionBuilder(
      context: context,
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(AppDecoration.radiusBig),
      ),
    );
  }
}

class _TabletView extends StatelessWidget {
  const _TabletView();

  @override
  Widget build(BuildContext context) {
    return _sectionBuilder(context: context);
  }
}

Widget _sectionBuilder({
  required BuildContext context,
  BorderRadiusGeometry? borderRadius,
}) {
  final ThemeData themeData = Theme.of(context);
  final TextTheme textTheme = themeData.textTheme;
  final ColorScheme colorScheme = themeData.colorScheme;

  return CustomSection(
    padding: const EdgeInsets.symmetric(
      horizontal: AppDecoration.paddingBig,
      vertical: AppDecoration.paddingLarge,
    ),
    borderRadius: borderRadius,
    backgroundColor: const Color(0xff00236d),
    children: [
      CustomText(
        text: "1029@home".tr,
        textAlign: TextAlign.center,
        style: textTheme.displayLarge!.copyWith(
          color: colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
      verticalSpace(),
      CustomText(
        text: "1062@tokenomics".tr,
        textAlign: TextAlign.center,
        style: textTheme.headlineSmall!.copyWith(
          color: colorScheme.onPrimary,
        ),
      ),
      verticalSpace(AppDecoration.spaceBig),
      Wrap(
        spacing: AppDecoration.spaceMedium,
        runSpacing: AppDecoration.spaceMedium,
        children: [
          CustomButton(
            onPressed: () => Get.offNamed(AppPages.presale),
            width: 170.0,
            height: 51.0,
            text: "1006@global".tr,
          ),
          CustomButton(
            onPressed: () => openNewTab(AppInfo.howToBuy),
            type: ButtonType.outlined,
            width: 170.0,
            height: 51.0,
            text: "1046@tokenomics".tr,
            style: themeData.outlinedButtonTheme.style!.copyWith(
              foregroundColor: MaterialStateProperty.all<Color>(
                colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
