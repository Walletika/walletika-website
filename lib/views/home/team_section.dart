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
}

class _DesktopView extends GetView<HomeController> {
  _DesktopView();

  final SettingsController _settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return CustomSection(
      padding: const EdgeInsets.only(
        top: AppDecoration.paddingBig,
        bottom: AppDecoration.paddingLarge,
        left: AppDecoration.paddingBig,
        right: AppDecoration.paddingBig,
      ),
      children: [
        CustomText(
          text: "1029@home".tr,
          style: textTheme.displaySmall!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpace(AppDecoration.spaceLarge),
        Obx(() {
          final List<TeamMemberModel>? members = controller.teamMembers;

          if (members == null) {
            return const CircularProgressIndicator();
          }

          return Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: AppDecoration.spaceLarge,
            runSpacing: AppDecoration.spaceLarge,
            children: members
                .map((member) => _memberBuilder(
                      context: context,
                      imageURL: member.imageURL,
                      name: member.name,
                      description: member.description.translate(
                        _settingsController.currentLanguage,
                      ),
                      telegram: member.telegram,
                      twitter: member.twitter,
                      linkedin: member.linkedin,
                      github: member.github,
                    ))
                .toList(),
          );
        }),
      ],
    );
  }
}

Widget _memberBuilder({
  required BuildContext context,
  required String imageURL,
  required String name,
  required String description,
  String? telegram,
  String? twitter,
  String? linkedin,
  String? github,
}) {
  final ThemeData themeData = Theme.of(context);
  final TextTheme textTheme = themeData.textTheme;
  final ColorScheme colorScheme = themeData.colorScheme;

  return Stack(
    alignment: Alignment.topCenter,
    children: [
      Column(
        children: [
          verticalSpace(60.0),
          Container(
            width: 350.0,
            height: 250.0,
            padding: const EdgeInsets.only(
              top: AppDecoration.paddingLarge,
              bottom: AppDecoration.paddingMedium,
              left: AppDecoration.paddingMedium,
              right: AppDecoration.paddingMedium,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: colorScheme.tertiary),
              borderRadius: BorderRadius.circular(AppDecoration.radiusBig),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text: name,
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium,
                ),
                verticalSpace(),
                CustomText(
                  text: description,
                  textAlign: TextAlign.center,
                  blueLightColor: true,
                  style: textTheme.bodyMedium,
                ),
                verticalSpace(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (telegram != null)
                      CustomButton(
                        onPressed: () => openNewTab(telegram),
                        icon: const Icon(LineIcons.telegram),
                        type: ButtonType.icon,
                        standardSize: false,
                        // width: 80.0,
                      ),
                    if (twitter != null)
                      CustomButton(
                        onPressed: () => openNewTab(twitter),
                        icon: const Icon(LineIcons.twitter),
                        type: ButtonType.icon,
                        standardSize: false,
                      ),
                    if (linkedin != null)
                      CustomButton(
                        onPressed: () => openNewTab(linkedin),
                        icon: const Icon(LineIcons.linkedin),
                        type: ButtonType.icon,
                        standardSize: false,
                      ),
                    if (github != null)
                      CustomButton(
                        onPressed: () => openNewTab(github),
                        icon: const Icon(LineIcons.github),
                        type: ButtonType.icon,
                        standardSize: false,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      CustomImage(
        url: imageURL,
        width: 100.0,
        height: 100.0,
        circled: true,
      ),
    ],
  );
}
