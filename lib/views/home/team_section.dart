import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../controllers/home.dart';
import '../../controllers/settings.dart';
import '../../models/team_member.dart';
import '../../utils/constants.dart';
import '../../utils/launch_url.dart';
import '../widgets/button.dart';
import '../widgets/feature.dart';
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

          return Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: AppDecoration.spaceLarge,
            runSpacing: AppDecoration.spaceLarge,
            children: members
                .map((member) => CustomFeature(
                      width: 350.0,
                      iconBordered: false,
                      icon: CustomImage(
                        url: member.imageURL,
                        width: 100.0,
                        height: 100.0,
                        circled: true,
                      ),
                      title: member.name,
                      description: member.description.translate(
                        _settingsController.currentLanguage,
                      ),
                      body: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                    ))
                .toList(),
          );
        }),
      ],
    );
  }
}
