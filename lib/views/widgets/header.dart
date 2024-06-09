import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../controllers/settings.dart';
import '../../models/page.dart';
import '../../utils/constants.dart';
import '../../utils/launch_url.dart';
import 'active_status.dart';
import 'button.dart';
import 'clickable_widget.dart';
import 'image.dart';
import 'page.dart';
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
    return _appBarBuilder(
      context: context,
      actions: [
        for (final PageModel page in controller.pages)
          CustomButton(
            onPressed: () => Get.offNamed(page.name),
            text: page.text.tr,
            icon: page.isNew ? const CustomActiveStatus(isActive: true) : null,
            type: ButtonType.text,
            standardSize: false,
          ),
      ],
    );
  }
}

class _PhoneView extends GetView<SettingsController> {
  const _PhoneView();

  @override
  Widget build(BuildContext context) {
    return _appBarBuilder(
      context: context,
      actions: [
        for (final PageModel page in controller.pages)
          if (page.isPinned)
            CustomButton(
              onPressed: () => Get.offNamed(page.name),
              text: page.text.tr,
              icon:
                  page.isNew ? const CustomActiveStatus(isActive: true) : null,
              type: ButtonType.text,
              standardSize: false,
            ),
      ],
    );
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
        CustomClickableWidget(
          onTap: () => Get.offNamed(AppPages.home),
          child: const CustomImage(
            padding: EdgeInsets.only(left: AppDecoration.spaceBig),
            path: AppImages.logo,
            width: 40.0,
            height: 40.0,
          ),
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
      actions: [
        ...?actions,
        horizontalSpace(),
        const SizedBox(
          height: AppDecoration.buttonHeight,
          child: VerticalDivider(),
        ),
        horizontalSpace(),
        IconButton(
          icon: const Icon(LineIcons.gift),
          tooltip: "1083@global".tr,
          onPressed: () => openNewTab(AppInfo.airdrop),
        ),
        IconButton(
          icon: const Icon(Icons.menu),
          tooltip: "1032@global".tr,
          onPressed: CustomPage.scaffoldKey.currentState?.openEndDrawer,
        ),
        horizontalSpace(AppDecoration.spaceMedium),
      ],
    ),
  );
}
