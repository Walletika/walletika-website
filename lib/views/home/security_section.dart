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
    return CustomSection(
      children: [
        Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: _imageBuilder(AppImages.walletLogin),
            ),
            Flexible(
              child: _textBuilder(
                context: context,
                title: "1005@home".tr,
                description: "1006@home".tr,
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
                title: "1007@home".tr,
                description: "1008@home".tr,
              ),
            ),
            Flexible(
              child: _imageBuilder(AppImages.walletAuth),
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
          title: "1005@home".tr,
          description: "1006@home".tr,
          crossAxisAlignment: CrossAxisAlignment.center,
          textAlign: TextAlign.center,
        ),
        verticalSpace(AppDecoration.spaceBig),
        _imageBuilder(AppImages.walletLogin),
        verticalSpace(AppDecoration.spaceLarge),
        _textBuilder(
          context: context,
          title: "1007@home".tr,
          description: "1008@home".tr,
          crossAxisAlignment: CrossAxisAlignment.center,
          textAlign: TextAlign.center,
        ),
        verticalSpace(AppDecoration.spaceBig),
        _imageBuilder(AppImages.walletAuth),
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

  return Column(
    crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
    children: [
      CustomText(
        text: title,
        textAlign: textAlign ?? TextAlign.start,
        maxWidth: 400.0,
        style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
      ),
      verticalSpace(),
      CustomText(
        text: description,
        textAlign: textAlign ?? TextAlign.start,
        maxWidth: 400.0,
        blueLightColor: true,
      ),
    ],
  );
}

Widget _imageBuilder(String path) {
  return CustomImage(path: path, width: 550.0);
}
