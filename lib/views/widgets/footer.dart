import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/launch_url.dart';
import 'button.dart';
import 'image.dart';
import 'section.dart';
import 'spacer.dart';
import 'text.dart';

class CustomFooterSection extends GetResponsiveView {
  CustomFooterSection({
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
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    return CustomSection(
      stretch: true,
      backgroundColor: colorScheme.secondary,
      crossAxisAlignment: CrossAxisAlignment.start,
      layout: SectionLayout.row,
      children: [
        SizedBox(
          width: 250.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _brandBuilder(textTheme),
          ),
        ),
        Flexible(
          child: _subSectionsBuilder(textTheme),
        )
      ],
    );
  }
}

class _TabletView extends StatelessWidget {
  const _TabletView();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    return CustomSection(
      stretch: true,
      backgroundColor: colorScheme.secondary,
      children: [
        Column(children: _brandBuilder(textTheme)),
        verticalSpace(AppDecoration.spaceLarge),
        _subSectionsBuilder(textTheme),
      ],
    );
  }
}

List<Widget> _brandBuilder(TextTheme textTheme) {
  return [
    const CustomImage(
      path: AppImages.logo,
      width: 100.0,
      height: 100.0,
    ),
    verticalSpace(),
    CustomText(
      text: AppInfo.name,
      softWrap: false,
      style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
    ),
    CustomText(
      text: "1026@home".tr,
      blueLightColor: true,
      style: textTheme.bodyMedium,
    ),
  ];
}

Widget _subSectionsBuilder(TextTheme textTheme) {
  return Wrap(
    spacing: AppDecoration.spaceMedium,
    runSpacing: AppDecoration.spaceMedium,
    children: [
      _subSection(
        textTheme: textTheme,
        name: "1011@global".tr,
        buttons: {
          "1029@global".tr: () =>
              Get.offNamed('/documents/about/what-is-keyless'),
          "1018@global".tr: () =>
              Get.offNamed('/documents/guide/how-to-install'),
          "1019@global".tr: () =>
              Get.offNamed('/documents/guide/how-to-setup-2fa'),
          "1020@global".tr: () =>
              Get.offNamed('/documents/guide/how-to-receive'),
          "1021@global".tr: () => Get.offNamed('/documents/guide/how-to-send'),
          "1018@home".tr: () => Get.offNamed('/documents/guide/how-to-stake'),
          "1020@home".tr: () => Get.offNamed('/documents/guide/how-to-backup'),
        },
      ),
      _subSection(
        textTheme: textTheme,
        name: "1009@global".tr,
        buttons: {
          "1012@global".tr: () => Get.offNamed('/documents/about'),
          "1013@global".tr: () =>
              Get.offNamed('/documents/user-agreement/terms-of-use'),
          "1014@global".tr: () =>
              Get.offNamed('/documents/user-agreement/privacy-policy'),
          "1030@global".tr: () => Get.offNamed('/documents/about/whitepaper'),
        },
      ),
      _subSection(
        textTheme: textTheme,
        name: "1010@global".tr,
        buttons: {
          "1015@global".tr: () => openNewTab(AppInfo.twitter),
          "1016@global".tr: () => openNewTab(AppInfo.telegramChannel),
          "1017@global".tr: () => openNewTab(AppInfo.github),
        },
      ),
    ],
  );
}

Widget _subSection({
  required TextTheme textTheme,
  required String name,
  required Map<String, void Function()> buttons,
}) {
  return SizedBox(
    width: 200.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(text: name, style: textTheme.titleMedium),
        verticalSpace(),
        const SizedBox(width: 100.0, child: Divider()),
        verticalSpace(),
        for (final MapEntry<String, void Function()> button in buttons.entries)
          CustomButton(
            onPressed: button.value,
            text: button.key,
            type: ButtonType.text,
            height: 40.0,
          ),
      ],
    ),
  );
}
