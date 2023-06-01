import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../controllers/settings.dart';
import '../../models/page.dart';
import '../../utils/constants.dart';
import 'button.dart';
import 'spacer.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final SettingsController _settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: colorScheme.secondary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: _settingsController.themeUpdate,
                  text: "1004@global".tr,
                  type: ButtonType.icon,
                  standardSize: false,
                  icon: const Icon(
                    LineIcons.moon,
                    size: AppDecoration.iconLargeSize,
                  ),
                ),
                horizontalSpace(AppDecoration.spaceMedium),
                const SizedBox(
                  height: AppDecoration.buttonHeightLarge,
                  child: VerticalDivider(),
                ),
                horizontalSpace(AppDecoration.spaceMedium),
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
              ],
            ),
          ),
          for (final PageModel page in _settingsController.pages)
            ListTile(
              onTap: () => Get.offNamed(page.path),
              title: Text(page.text.tr),
            ),
        ],
      ),
    );
  }
}
