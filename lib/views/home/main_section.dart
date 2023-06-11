import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/button.dart';
import '../widgets/image.dart';
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
}

class _DesktopView extends StatelessWidget {
  const _DesktopView();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return CustomSection(
      height: 800.0,
      layout: SectionLayout.wrap,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "1000@home".tr,
              maxWidth: 360.0,
              style: textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            verticalSpace(AppDecoration.spaceMedium),
            CustomText(
              text: "1001@home".tr,
              maxWidth: 360.0,
              blueLightColor: true,
            ),
            verticalSpace(AppDecoration.spaceLarge),
            SizedBox(
              width: 380.0,
              child: Wrap(
                spacing: AppDecoration.space,
                runSpacing: AppDecoration.space,
                children: [
                  CustomButton(
                    onPressed: _googleStore,
                    imagePath: AppImages.googleStore,
                    type: ButtonType.image,
                    width: 185.0,
                    height: 55.0,
                  ),
                  CustomButton(
                    onPressed: _windowsStore,
                    imagePath: AppImages.windowsStore,
                    type: ButtonType.image,
                    width: 185.0,
                    height: 55.0,
                  ),
                  CustomButton(
                    onPressed: _morePackages,
                    text: "1005@global".tr,
                    type: ButtonType.outlined,
                    width: 185.0,
                    height: 55.0,
                  ),
                ],
              ),
            ),
          ],
        ),
        CustomImage(
          path: AppImages.theme("walletApp"),
          width: 450.0,
          height: 535.0,
        ),
      ],
    );
  }

  void _googleStore() {
    Get.offNamed(AppPages.download);
  }

  void _windowsStore() {
    Get.offNamed(AppPages.download);
  }

  void _morePackages() {
    Get.offNamed(AppPages.download);
  }
}
