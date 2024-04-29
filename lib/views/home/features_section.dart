import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/image.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class FeaturesSection extends GetResponsiveView {
  FeaturesSection({
    super.settings = AppDecoration.responsiveScreenSettings,
    super.key,
  });

  @override
  Widget? desktop() {
    return const _DesktopView();
  }

  @override
  Widget? phone() {
    return const _PhoneView();
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView();

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      children: [
        Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: _textBuilder(
                context: context,
                title: "1014@home".tr,
                description: "1015@home".tr,
              ),
            ),
            Flexible(
              child: _imageBuilder(AppImages.wallets),
            ),
          ],
        ),
        Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: _imageBuilder(AppImages.walletBlockchains),
            ),
            Flexible(
              child: _textBuilder(
                context: context,
                title: "1012@home".tr,
                description: "1013@home".tr,
              ),
            ),
          ],
        ),
        Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: _textBuilder(
                context: context,
                title: "1018@home".tr,
                description: "1019@home".tr,
              ),
            ),
            Flexible(
              child: _imageBuilder(AppImages.walletStaking),
            ),
          ],
        ),
      ],
    );
  }
}

class _PhoneView extends StatelessWidget {
  const _PhoneView();

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      children: [
        _textBuilder(
          context: context,
          title: "1014@home".tr,
          description: "1015@home".tr,
          crossAxisAlignment: CrossAxisAlignment.center,
          textAlign: TextAlign.center,
        ),
        verticalSpace(AppDecoration.spaceBig),
        _imageBuilder(AppImages.wallets),
        verticalSpace(AppDecoration.spaceLarge),
        _textBuilder(
          context: context,
          title: "1012@home".tr,
          description: "1013@home".tr,
          crossAxisAlignment: CrossAxisAlignment.center,
          textAlign: TextAlign.center,
        ),
        verticalSpace(AppDecoration.spaceBig),
        _imageBuilder(AppImages.walletBlockchains),
        verticalSpace(AppDecoration.spaceLarge),
        _textBuilder(
          context: context,
          title: "1018@home".tr,
          description: "1019@home".tr,
          crossAxisAlignment: CrossAxisAlignment.center,
          textAlign: TextAlign.center,
        ),
        verticalSpace(AppDecoration.spaceBig),
        _imageBuilder(AppImages.walletStaking),
      ],
    );
  }
}

Widget _textBuilder({
  required BuildContext context,
  required String title,
  required String description,
  CrossAxisAlignment? crossAxisAlignment,
  TextAlign? textAlign,
}) {
  final ThemeData themeData = Theme.of(context);
  final TextTheme textTheme = themeData.textTheme;
  final ColorScheme colorScheme = themeData.colorScheme;

  return Column(
    crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
    children: [
      CustomText(
        text: title,
        textAlign: textAlign ?? TextAlign.start,
        maxWidth: 400.0,
        style: textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      verticalSpace(),
      CustomText(
        text: description,
        textAlign: textAlign ?? TextAlign.start,
        maxWidth: 400.0,
        style: textTheme.titleLarge,
        blueLightColor: true,
      ),
      verticalSpace(AppDecoration.spaceBig),
      SizedBox(
        width: 100.0,
        height: 7.0,
        child: Material(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(AppDecoration.radiusSmall),
        ),
      ),
    ],
  );
}

Widget _imageBuilder(String path) {
  return CustomImage(path: path, width: 550.0);
}
