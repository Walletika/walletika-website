import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../controllers/settings.dart';
import '../../models/page.dart';
import '../../utils/constants.dart';
import '../../utils/screen_mode.dart';
import 'button.dart';
import 'image.dart';
import 'spacer.dart';
import 'text.dart';

class CustomHeader extends StatelessWidget {
  CustomHeader({super.key});

  final SettingsController _settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

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
          CustomText(
            text: AppInfo.name,
            softWrap: false,
            style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
        ]),
        actions: _actions(context),
      ),
    );
  }

  List<Widget>? _actions(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    if (ScreenMode(context.width).isPhone) return null;

    return [
      for (final PageModel page in _settingsController.pages)
        CustomButton(
          onPressed: () => Get.offNamed(page.path),
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
          value: _settingsController.currentLanguage,
          onChanged: _settingsController.languageUpdate,
          items: _settingsController.languages
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
        onPressed: _settingsController.themeUpdate,
        text: "1004@global".tr,
        type: ButtonType.icon,
        standardSize: false,
        icon: const Icon(LineIcons.moon),
      ),
      horizontalSpace(AppDecoration.spaceMedium),
    ];
  }
}
