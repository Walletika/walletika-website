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
      height: 800.0,
      layout: SectionLayout.wrap,
      children: [
        SizedBox(
          width: 360.0,
          child: _textBuilder(context: context),
        ),
        CustomImage(
          path: AppImages.theme("walletApp"),
          width: 450.0,
        ),
      ],
    );
  }
}

class _TabletView extends StatelessWidget {
  const _TabletView();

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      layout: SectionLayout.wrap,
      children: [
        _textBuilder(context: context, isTablet: true),
        CustomImage(path: AppImages.theme("walletApp")),
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

  return Column(
    crossAxisAlignment:
        isTablet ? CrossAxisAlignment.center : CrossAxisAlignment.start,
    children: [
      CustomText(
        text: "1000@home".tr,
        textAlign: isTablet ? TextAlign.center : TextAlign.start,
        maxWidth: 360.0,
        style: titleStyle,
      ),
      verticalSpace(),
      CustomText(
        text: "1001@home".tr,
        textAlign: isTablet ? TextAlign.center : TextAlign.start,
        maxWidth: 360.0,
        blueLightColor: true,
      ),
      verticalSpace(AppDecoration.spaceLarge),
      Wrap(
        spacing: AppDecoration.space,
        runSpacing: AppDecoration.space,
        children: [
          const CustomButton(
            onPressed: _googleStore,
            imagePath: AppImages.googleStore,
            type: ButtonType.image,
            width: 170.0,
            height: 51.0,
          ),
          const CustomButton(
            onPressed: _windowsStore,
            imagePath: AppImages.windowsStore,
            type: ButtonType.image,
            width: 170.0,
            height: 51.0,
          ),
          CustomButton(
            onPressed: _morePackages,
            text: "1005@global".tr,
            type: ButtonType.outlined,
            width: 170.0,
            height: 51.0,
          ),
        ],
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
