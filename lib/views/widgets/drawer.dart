import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/settings.dart';
import '../../models/page.dart';
import '../../utils/constants.dart';
import '../../utils/launch_url.dart';
import 'active_status.dart';
import 'clickable_widget.dart';
import 'image.dart';
import 'spacer.dart';

class CustomDrawer extends GetView<SettingsController> {
  const CustomDrawer({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomClickableWidget(
                  onTap: () => Get.offNamed(AppPages.home),
                  child: const CustomImage(
                    padding: EdgeInsets.only(left: AppDecoration.spaceBig),
                    path: AppImages.logo,
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
                const SizedBox(
                  height: AppDecoration.buttonHeightLarge,
                  child: VerticalDivider(),
                ),
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
                    onChanged: _languageUpdate,
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
              ],
            ),
          ),
          for (final PageModel page in controller.pages)
            ListTile(
              onTap: () => Get.offNamed(page.name),
              title: Text(page.text.tr),
              trailing:
                  page.isNew ? const CustomActiveStatus(isActive: true) : null,
            ),
          ListTile(
            title: Text(
              "1011@global".tr,
              style: textTheme.bodySmall!.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () =>
                Get.offNamed('${AppPages.documents}/about/what-is-keyless'),
            title: Text("1029@global".tr),
          ),
          ListTile(
            onTap: () =>
                Get.offNamed('${AppPages.documents}/guide/how-to-install'),
            title: Text("1018@global".tr),
          ),
          ListTile(
            onTap: () =>
                Get.offNamed('${AppPages.documents}/guide/how-to-setup-2fa'),
            title: Text("1019@global".tr),
          ),
          ListTile(
            onTap: () =>
                Get.offNamed('${AppPages.documents}/guide/how-to-receive'),
            title: Text("1020@global".tr),
          ),
          ListTile(
            onTap: () =>
                Get.offNamed('${AppPages.documents}/guide/how-to-send'),
            title: Text("1021@global".tr),
          ),
          ListTile(
            onTap: () =>
                Get.offNamed('${AppPages.documents}/guide/how-to-stake'),
            title: Text("1018@home".tr),
          ),
          ListTile(
            onTap: () =>
                Get.offNamed('${AppPages.documents}/guide/how-to-backup'),
            title: Text("1020@home".tr),
          ),
          ListTile(
            title: Text(
              "1012@global".tr,
              style: textTheme.bodySmall!.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () =>
                Get.offNamed('${AppPages.documents}/about/what-is-walletika'),
            title: Text("1031@global".tr),
          ),
          ListTile(
            onTap: () => openNewTab(AppInfo.whitepaperPDF),
            title: Text("1030@global".tr),
          ),
          ListTile(
            onTap: () => openNewTab(AppInfo.tokenSmartContract),
            title: Text("1058@global".tr),
          ),
          ListTile(
            onTap: () => openNewTab(AppInfo.audit),
            title: Text("1070@global".tr),
          ),
          ListTile(
            onTap: () => openNewTab(AppInfo.kyc),
            title: Text("1069@global".tr),
          ),
          ListTile(
            onTap: () => Get.offNamed(
                '${AppPages.documents}/user-agreement/terms-of-use'),
            title: Text("1013@global".tr),
          ),
          ListTile(
            onTap: () => Get.offNamed(
                '${AppPages.documents}/user-agreement/privacy-policy'),
            title: Text("1014@global".tr),
          ),
          ListTile(
            title: Text(
              "1010@global".tr,
              style: textTheme.bodySmall!.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () => openNewTab(AppInfo.twitter),
            title: Text("1015@global".tr),
          ),
          ListTile(
            onTap: () => openNewTab(AppInfo.telegramChannel),
            title: Text("1016@global".tr),
          ),
          ListTile(
            onTap: () => openNewTab(AppInfo.telegramGroup),
            title: Text("1066@global".tr),
          ),
          ListTile(
            onTap: () => openNewTab(AppInfo.youtube),
            title: Text("1065@global".tr),
          ),
          ListTile(
            onTap: () => openNewTab(AppInfo.github),
            title: Text("1017@global".tr),
          ),
        ],
      ),
    );
  }

  void _languageUpdate(String? language) async {
    await controller.languageUpdate(language);
    Get.back();
  }
}
