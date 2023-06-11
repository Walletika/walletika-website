import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/launch_url.dart';
import '../widgets/button.dart';
import '../widgets/image.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class CommunitySection extends GetResponsiveView {
  CommunitySection({
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
      padding: const EdgeInsets.only(
        left: AppDecoration.paddingBig,
        right: AppDecoration.paddingBig,
        top: AppDecoration.padding,
        bottom: 70.0,
      ),
      layout: SectionLayout.row,
      children: [
        _textBuilder(context: context, textWidth: 380.0),
        const Flexible(
          child: CustomImage(path: AppImages.telegramIllustrations),
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
      padding: const EdgeInsets.only(
        left: AppDecoration.paddingBig,
        right: AppDecoration.paddingBig,
        top: AppDecoration.padding,
        bottom: AppDecoration.paddingBig,
      ),
      children: [
        _textBuilder(context: context, textWidth: 500.0),
        const CustomImage(
          path: AppImages.telegramIllustrations,
          width: 600.0,
          height: 400.0,
        ),
      ],
    );
  }
}

Widget _textBuilder({
  required BuildContext context,
  required double textWidth,
}) {
  final ThemeData themeData = Theme.of(context);
  final TextTheme textTheme = themeData.textTheme;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(
        text: "1024@home".tr,
        maxWidth: textWidth,
        style: textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w900),
      ),
      verticalSpace(),
      CustomText(
        text: "1025@home".tr,
        maxWidth: textWidth,
        blueLightColor: true,
        style: textTheme.bodyLarge,
      ),
      verticalSpace(AppDecoration.spaceLarge),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
            onPressed: () => openNewTab(AppInfo.telegramChannel),
            text: "1007@global".tr,
          ),
          horizontalSpace(),
          CustomButton(
            onPressed: () => openNewTab(AppInfo.telegramGroup),
            text: "1008@global".tr,
            type: ButtonType.outlined,
          ),
        ],
      ),
    ],
  );
}
