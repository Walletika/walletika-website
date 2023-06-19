import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/button.dart';
import '../widgets/image.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class PlatformsSection extends StatelessWidget {
  const PlatformsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      layout: SectionLayout.wrap,
      children: [
        _platformBuilder(
          context: context,
          title: "1002@download".tr,
          description: "1003@download".tr,
          path: AppImages.theme("mobile"),
          buttons: [
            _buttonBuilder(
              onPressed: _googleStore,
              imagePath: AppImages.googleStore,
            ),
            _buttonBuilder(
              onPressed: _androidAPK,
              imagePath: AppImages.androidAPK,
            ),
          ],
        ),
        _platformBuilder(
          context: context,
          title: "1004@download".tr,
          description: "1005@download".tr,
          path: AppImages.theme("desktop"),
          buttons: [
            _buttonBuilder(
              onPressed: _windowsStore,
              imagePath: AppImages.windowsStore,
            ),
            _buttonBuilder(
              onPressed: _windowsEXE,
              imagePath: AppImages.windowsEXE,
            ),
          ],
        ),
      ],
    );
  }
}

Widget _platformBuilder({
  required BuildContext context,
  required String title,
  required String description,
  required String path,
  required List<Widget> buttons,
}) {
  final ThemeData themeData = Theme.of(context);
  final TextTheme textTheme = themeData.textTheme;

  return Column(
    children: [
      CustomText(
        text: title,
        textAlign: TextAlign.center,
        maxWidth: 400.0,
        style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
      ),
      verticalSpace(),
      CustomText(
        text: description,
        textAlign: TextAlign.center,
        maxWidth: 400.0,
        blueLightColor: true,
      ),
      verticalSpace(AppDecoration.spaceLarge),
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: AppDecoration.space,
        runSpacing: AppDecoration.space,
        children: buttons,
      ),
      verticalSpace(AppDecoration.spaceLarge),
      CustomImage(
        path: path,
        width: 400.0,
      ),
    ],
  );
}

Widget _buttonBuilder({
  required void Function()? onPressed,
  required String imagePath,
}) {
  return CustomButton(
    onPressed: onPressed,
    imagePath: imagePath,
    type: ButtonType.image,
    width: 170.0,
    height: 51.0,
  );
}

void _googleStore() {}

void _androidAPK() {}

void _windowsStore() {}

void _windowsEXE() {}
