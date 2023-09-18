import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

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
    return const _DesktopView();
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView();

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
      layout: SectionLayout.wrap,
      children: [
        SizedBox(
          width: AppDecoration.docsPageWidth,
          child: Column(
            children: [
              CustomText(
                text: "1029@home".tr,
                style: textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(AppDecoration.spaceBig),
            ],
          ),
        ),
        _memberBuilder(
          context: context,
          imageURL:
              "https://raw.githubusercontent.com/Walletika/walletika-web-fetch/main/images/mahmoud_picture.jpg",
          name: "Mahmoud Khalid",
          description: "1030@home".tr,
          telegram: "https://t.me/WalletikaCEO",
          twitter: "https://twitter.com/MahmoudKEA",
          linkedin: "https://www.linkedin.com/in/MahmoudKEA",
          github: "https://github.com/MahmoudKhalid",
        ),
      ],
    );
  }
}

Widget _memberBuilder({
  required BuildContext context,
  required String imageURL,
  required String name,
  required String description,
  required String telegram,
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
            padding: const EdgeInsets.symmetric(
              horizontal: AppDecoration.paddingMedium,
              vertical: AppDecoration.paddingLarge,
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
