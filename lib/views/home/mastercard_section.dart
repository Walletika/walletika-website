import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/launch_url.dart';
import '../widgets/button.dart';
import '../widgets/image.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class MastercardSection extends GetResponsiveView {
  MastercardSection({
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
      layout: SectionLayout.row,
      children: [
        _textBuilder(context: context, textWidth: 420.0),
        const Flexible(
          child: CustomImage(path: AppImages.cardsIllustrations),
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
      children: [
        const CustomImage(path: AppImages.cardsIllustrations, width: 600.0),
        verticalSpace(AppDecoration.spaceBig),
        _textBuilder(
          context: context,
          textWidth: AppDecoration.textSectionWidth,
          isTablet: true,
        ),
      ],
    );
  }
}

Widget _textBuilder({
  required BuildContext context,
  required double textWidth,
  bool isTablet = false,
}) {
  final ThemeData themeData = Theme.of(context);
  final TextTheme textTheme = themeData.textTheme;

  return Column(
    crossAxisAlignment:
        isTablet ? CrossAxisAlignment.center : CrossAxisAlignment.start,
    children: [
      CustomText(
        text: "1030@home".tr,
        textAlign: isTablet ? TextAlign.center : TextAlign.start,
        maxWidth: textWidth,
        style: textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w900),
      ),
      verticalSpace(),
      CustomText(
        text: "1031@home".tr,
        textAlign: isTablet ? TextAlign.center : TextAlign.start,
        maxWidth: textWidth,
        blueLightColor: true,
        style: textTheme.bodyLarge,
      ),
      verticalSpace(AppDecoration.spaceLarge),
      CustomButton(
        onPressed: () => openNewTab(AppInfo.whitepaperPDF),
        text: "1067@global".tr,
      ),
    ],
  );
}
