import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../controllers/settings.dart';
import '../../models/page.dart';
import '../../utils/constants.dart';
import 'button.dart';
import 'image.dart';
import 'spacer.dart';
import 'text.dart';

class CustomHeader extends GetResponsiveView {
  CustomHeader({
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

class _DesktopView extends GetView<SettingsController> {
  const _DesktopView();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return _appBarBuilder(
      context: context,
      actions: [
        for (final PageModel page in controller.pages)
          CustomButton(
            onPressed: () => Get.offNamed(page.name),
            text: page.text.tr,
            type: ButtonType.text,
            standardSize: false,
          ),
        horizontalSpace(),
        const SizedBox(
          height: AppDecoration.buttonHeight,
          child: VerticalDivider(),
        ),
        horizontalSpace(),
        Obx(() {
          return DropdownButton(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDecoration.padding,
            ),
            style: textTheme.labelLarge,
            icon: const Icon(Icons.arrow_drop_down_rounded),
            borderRadius: BorderRadius.circular(AppDecoration.radius),
            dropdownColor: themeData.popupMenuTheme.color,
            underline: zeroSpace(),
            value: controller.currentLanguage,
            onChanged: controller.languageUpdate,
            items: controller.languages
                .map((key, value) {
                  return MapEntry(
                    key,
                    DropdownMenuItem(value: key, child: Text(value)),
                  );
                })
                .values
                .toList(),
          );
        }),
        horizontalSpace(),
        CustomButton(
          onPressed: controller.themeUpdate,
          text: "1004@global".tr,
          type: ButtonType.icon,
          standardSize: false,
          icon: Icon(controller.isDarkMode ? LineIcons.sun : LineIcons.moon),
        ),
        horizontalSpace(AppDecoration.spaceMedium),
      ],
    );
  }
}

class _PhoneView extends GetView<SettingsController> {
  const _PhoneView();

  @override
  Widget build(BuildContext context) {
    return _appBarBuilder(context: context);
  }
}

Widget _appBarBuilder({required BuildContext context, List<Widget>? actions}) {
  final ThemeData themeData = Theme.of(context);
  final TextTheme textTheme = themeData.textTheme;

  return Directionality(
    textDirection: TextDirection.ltr,
    child: AppBar(
      toolbarHeight: AppDecoration.headerHeight,
      title: Row(children: [
        const CustomImage(
          padding: EdgeInsets.only(left: AppDecoration.spaceBig),
          path: AppImages.logo,
          width: 40.0,
          height: 40.0,
        ),
        horizontalSpace(),
        Flexible(
          child: CustomText(
            text: AppInfo.name,
            softWrap: false,
            style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ]),
      actions: actions,
    ),
  );
}
