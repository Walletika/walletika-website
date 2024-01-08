import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../controllers/home.dart';
import '../../controllers/settings.dart';
import '../../models/team_member.dart';
import '../../utils/constants.dart';
import '../../utils/launch_url.dart';
import '../widgets/button.dart';
import '../widgets/image.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class TeamSection extends GetResponsiveView {
  TeamSection({
    super.settings = AppDecoration.responsiveScreenSettings,
    super.key,
  });

  @override
  Widget? desktop() {
    return _DesktopView();
  }

  @override
  Widget? phone() {
    return _PhoneView();
  }
}

class _DesktopView extends GetView<HomeController> {
  _DesktopView();

  final SettingsController _settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return CustomSection(
      children: [
        CustomText(
          text: "1063@global".tr,
          style: textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w900),
        ),
        verticalSpace(AppDecoration.spaceLarge),
        Obx(() {
          final List<TeamMemberModel>? members = controller.teamMembers;

          if (members == null) {
            return const CircularProgressIndicator();
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: _imageBuilder(AppImages.ownerPhoto),
              ),
              horizontalSpace(AppDecoration.spaceLarge),
              Flexible(
                child: _textBuilder(
                  context: context,
                  member: members.first,
                  language: _settingsController.currentLanguage,
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}

class _PhoneView extends GetView<HomeController> {
  _PhoneView();

  final SettingsController _settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return CustomSection(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDecoration.padding,
        vertical: AppDecoration.paddingLargest,
      ),
      children: [
        CustomText(
          text: "1063@global".tr,
          style: textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w900),
        ),
        verticalSpace(AppDecoration.spaceLarge),
        Obx(() {
          final List<TeamMemberModel>? members = controller.teamMembers;

          if (members == null) {
            return const CircularProgressIndicator();
          }

          return Column(
            children: [
              _imageBuilder(AppImages.ownerPhoto),
              verticalSpace(AppDecoration.spaceBig),
              _textBuilder(
                context: context,
                member: members.first,
                language: _settingsController.currentLanguage,
                crossAxisAlignment: CrossAxisAlignment.center,
                textAlign: TextAlign.center,
              ),
            ],
          );
        }),
      ],
    );
  }
}

Widget _textBuilder({
  required BuildContext context,
  required TeamMemberModel member,
  required String language,
  CrossAxisAlignment? crossAxisAlignment,
  TextAlign? textAlign,
}) {
  final ThemeData themeData = Theme.of(context);
  final TextTheme textTheme = themeData.textTheme;

  return Column(
    crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
    children: [
      CustomText(
        text: member.name,
        textAlign: textAlign ?? TextAlign.start,
        maxWidth: 400.0,
        style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      verticalSpace(),
      CustomText(
        text: member.description.translate(language),
        textAlign: textAlign ?? TextAlign.start,
        maxWidth: 400.0,
        blueLightColor: true,
      ),
      verticalSpace(AppDecoration.spaceBig),
      Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          CustomButton(
            onPressed: () => openNewTab(AppInfo.kyc),
            text: "1069@global".tr,
            type: ButtonType.outlined,
            height: AppDecoration.buttonHeight,
          ),
          if (member.telegram != null)
            CustomButton(
              onPressed: () => openNewTab(member.telegram!),
              icon: const Icon(LineIcons.telegram),
              type: ButtonType.icon,
              standardSize: false,
            ),
          if (member.twitter != null)
            CustomButton(
              onPressed: () => openNewTab(member.twitter!),
              icon: const Icon(LineIcons.twitter),
              type: ButtonType.icon,
              standardSize: false,
            ),
          if (member.linkedin != null)
            CustomButton(
              onPressed: () => openNewTab(member.linkedin!),
              icon: const Icon(LineIcons.linkedin),
              type: ButtonType.icon,
              standardSize: false,
            ),
          if (member.github != null)
            CustomButton(
              onPressed: () => openNewTab(member.github!),
              icon: const Icon(LineIcons.github),
              type: ButtonType.icon,
              standardSize: false,
            ),
        ],
      ),
    ],
  );
}

Widget _imageBuilder(String path) {
  return CustomImage(path: path, width: 250.0);
}
