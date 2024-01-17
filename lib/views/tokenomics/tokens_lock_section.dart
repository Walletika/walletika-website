import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/launch_url.dart';
import '../widgets/button.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class TokensLockSection extends GetResponsiveView {
  TokensLockSection({
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
      borderRadius: BorderRadius.circular(AppDecoration.radiusBig),
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

  return CustomSection(
    height: AppDecoration.sectionHeight,
    borderRadius: borderRadius,
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    padding: const EdgeInsets.symmetric(
      horizontal: AppDecoration.paddingBig,
      vertical: AppDecoration.paddingBig,
    ),
    image: const DecorationImage(
      image: ExactAssetImage(AppImages.lockerBackground),
      fit: BoxFit.cover,
      filterQuality: FilterQuality.medium,
    ),
    children: [
      CustomText(
        text: "1031@tokenomics".tr,
        style: textTheme.displaySmall!.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      CustomText(
        text: "1032@tokenomics".tr,
        style: textTheme.bodyLarge!.copyWith(color: AppColors.white),
      ),
      verticalSpace(AppDecoration.spaceMedium),
      CustomButton(
        onPressed: () => openNewTab(AppInfo.whitepaperPDF),
        text: "1072@global".tr,
      ),
    ],
  );
}
