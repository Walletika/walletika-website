import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
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
        name: "1009@global".tr,
        buttons: {
          "1012@global".tr: () {},
          "1013@global".tr: () {},
          "1014@global".tr: () {},
        },
      ),
      _subSection(
        textTheme: textTheme,
        name: "1010@global".tr,
        buttons: {
          "1015@global".tr: () {},
          "1016@global".tr: () {},
          "1017@global".tr: () {},
        },
      ),
      _subSection(
        textTheme: textTheme,
        name: "1011@global".tr,
        buttons: {
          "1018@global".tr: () {},
          "1019@global".tr: () {},
          "1020@global".tr: () {},
          "1021@global".tr: () {},
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: name, style: textTheme.titleMedium),
        verticalSpace(),
        const SizedBox(width: 100.0, child: Divider()),
        verticalSpace(),
        for (final MapEntry<String, void Function()> button in buttons.entries)
          CustomButton(
            onPressed: button.value,
            text: button.key,
            textAlignment: Alignment.centerLeft,
            type: ButtonType.text,
            height: 40.0,
          ),
      ],
    ),
  );
}
