import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/image.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class SecuritySection extends GetResponsiveView {
  SecuritySection({
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
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return CustomSection(
      children: [
        _mainTitleBuilder(textTheme),
        verticalSpace(AppDecoration.spaceLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: _textBuilder(
                title: "1005@home".tr,
                description: "1006@home".tr,
                textTheme: textTheme,
              ),
            ),
            Flexible(
              child: _imageBuilder(AppImages.theme("walletLogin")),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: _imageBuilder(AppImages.theme("walletAuth")),
            ),
            Flexible(
              child: _textBuilder(
                title: "1007@home".tr,
                description: "1008@home".tr,
                textTheme: textTheme,
              ),
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
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return CustomSection(
      children: [
        _mainTitleBuilder(textTheme),
        verticalSpace(AppDecoration.spaceLarge),
        _textBuilder(
          title: "1005@home".tr,
          description: "1006@home".tr,
          textTheme: textTheme,
        ),
        verticalSpace(AppDecoration.spaceBig),
        _imageBuilder(AppImages.theme("walletLogin")),
        verticalSpace(AppDecoration.spaceBig),
        _textBuilder(
          title: "1007@home".tr,
          description: "1008@home".tr,
          textTheme: textTheme,
        ),
        verticalSpace(AppDecoration.spaceBig),
        _imageBuilder(AppImages.theme("walletAuth")),
      ],
    );
  }
}

Widget _mainTitleBuilder(TextTheme textTheme) {
  return CustomText(
    text: "1004@home".tr,
    textAlign: TextAlign.center,
    style: textTheme.headlineLarge,
  );
}

Widget _textBuilder({
  required String title,
  required String description,
  required TextTheme textTheme,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(
        text: title,
        maxWidth: 400.0,
        style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),
      ),
      verticalSpace(),
      CustomText(
        text: description,
        maxWidth: 400.0,
        blueLightColor: true,
      ),
    ],
  );
}

Widget _imageBuilder(String path) {
  return CustomImage(
    path: path,
    width: 400.0,
    height: 400.0,
  );
}
