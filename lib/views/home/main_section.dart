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
      verticalSpace(AppDecoration.spaceMedium),
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
          CustomButton(
            onPressed: () => Get.offNamed(AppPages.download),
            text: "1005@global".tr,
            width: 170.0,
            height: 51.0,
          ),
          CustomButton(
            onPressed: () => Get.offNamed(AppPages.token),
            text: "1056@global".tr,
            type: ButtonType.outlined,
            width: 170.0,
            height: 51.0,
          ),
          CustomButton(
            onPressed: () => Get.offNamed(
              '${AppPages.documents}/about/whitepaper',
            ),
            text: "1030@global".tr,
            type: ButtonType.outlined,
            width: 170.0,
            height: 51.0,
          ),
        ],
      ),
    ],
  );
}
