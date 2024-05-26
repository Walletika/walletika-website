import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/button.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class AIBannerSection extends GetResponsiveView {
  AIBannerSection({
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
    height: 550.0,
    borderRadius: borderRadius,
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    padding: const EdgeInsets.symmetric(
      horizontal: AppDecoration.paddingBig,
      vertical: AppDecoration.paddingLarge,
    ),
    image: const DecorationImage(
      image: ExactAssetImage(AppImages.aiBackground),
      fit: BoxFit.cover,
      filterQuality: FilterQuality.medium,
    ),
    children: [
      CustomText(
        text: "1032@home".tr,
        style: textTheme.displaySmall!.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      verticalSpace(),
      CustomText(
        text: "1033@home".tr,
        style: textTheme.titleLarge!.copyWith(color: AppColors.white),
        maxWidth: AppDecoration.pageWidth,
      ),
      verticalSpace(AppDecoration.spaceBig),
      CustomButton(
        onPressed: () =>
            Get.offNamed('${AppPages.documents}/${AppPages.aiArticle}'),
        width: 170.0,
        height: 51.0,
        text: "1080@global".tr,
      ),
    ],
  );
}
