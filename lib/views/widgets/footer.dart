import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../utils/constants.dart';
import '../../utils/launch_url.dart';
import 'address.dart';
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
  Widget? phone() {
    return const _PhoneView();
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
      layout: SectionLayout.column,
      children: [
        SizedBox(
          width: AppDecoration.textSectionWidth,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _brandBuilder(textTheme),
              horizontalSpace(AppDecoration.spaceBig),
              const SizedBox(
                height: AppDecoration.buttonHeightMedium,
                child: VerticalDivider(),
              ),
              horizontalSpace(AppDecoration.spaceBig),
              CustomText(
                text: '${"1026@home".tr}\n${"1027@home".tr}',
                blueLightColor: true,
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        verticalSpace(AppDecoration.spaceLarge),
        CustomText(
          text: "1028@home".tr,
          blueLightColor: true,
          style: textTheme.bodyMedium,
        ),
        verticalSpace(),
        SizedBox(
          width: AppDecoration.textSectionWidth,
          child: _donateBuilder(textTheme),
        ),
        SizedBox(
          width: AppDecoration.textSectionWidth,
          child: _contactUsBuilder(textTheme),
        ),
        verticalSpace(AppDecoration.spaceBig),
        _socialMediaBuilder(),
        verticalSpace(),
        SizedBox(
          width: AppDecoration.textSectionWidth,
          child: _agreementBuilder(MainAxisAlignment.end),
        ),
      ],
    );
  }
}

class _PhoneView extends StatelessWidget {
  const _PhoneView();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    return CustomSection(
      stretch: true,
      backgroundColor: colorScheme.secondary,
      layout: SectionLayout.column,
      children: [
        _brandBuilder(textTheme),
        verticalSpace(),
        CustomText(
          text: '${"1026@home".tr}\n${"1027@home".tr}',
          textAlign: TextAlign.center,
          blueLightColor: true,
          style: textTheme.bodyMedium,
        ),
        verticalSpace(AppDecoration.spaceBig),
        CustomText(
          text: "1028@home".tr,
          textAlign: TextAlign.center,
          blueLightColor: true,
          style: textTheme.bodyMedium,
        ),
        verticalSpace(),
        _donateBuilder(textTheme),
        _contactUsBuilder(textTheme),
        verticalSpace(AppDecoration.spaceBig),
        _socialMediaBuilder(),
        verticalSpace(),
        _agreementBuilder(MainAxisAlignment.center),
      ],
    );
  }
}

Widget _brandBuilder(TextTheme textTheme) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    textDirection: TextDirection.ltr,
    children: [
      const CustomImage(
        path: AppImages.logo,
        width: 50.0,
        height: 50.0,
      ),
      horizontalSpace(),
      CustomText(
        text: AppInfo.name,
        softWrap: false,
        style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Widget _socialMediaBuilder() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Flexible(
        child: CustomButton(
          onPressed: () => openNewTab(AppInfo.twitter),
          icon: const Icon(LineIcons.twitter, size: AppDecoration.iconBigSize),
          type: ButtonType.icon,
          width: 80.0,
        ),
      ),
      Flexible(
        child: CustomButton(
          onPressed: () => openNewTab(AppInfo.telegramChannel),
          icon: const Icon(LineIcons.telegram, size: AppDecoration.iconBigSize),
          type: ButtonType.icon,
          width: 80.0,
        ),
      ),
      Flexible(
        child: CustomButton(
          onPressed: () => openNewTab(AppInfo.youtube),
          icon: const Icon(LineIcons.youtube, size: AppDecoration.iconBigSize),
          type: ButtonType.icon,
          width: 80.0,
        ),
      ),
      Flexible(
        child: CustomButton(
          onPressed: () => openNewTab(AppInfo.github),
          icon: const Icon(LineIcons.github, size: AppDecoration.iconBigSize),
          type: ButtonType.icon,
          width: 80.0,
        ),
      ),
    ],
  );
}

Widget _donateBuilder(TextTheme textTheme) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      CustomText(text: "1059@global".tr, style: textTheme.bodyMedium),
      horizontalSpace(AppDecoration.spaceSmall),
      const Flexible(
        child: CustomAddressText(AppInfo.donateAddress, width: 340.0),
      ),
    ],
  );
}

Widget _contactUsBuilder(TextTheme textTheme) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      CustomText(text: "1064@global".tr, style: textTheme.bodyMedium),
      horizontalSpace(AppDecoration.spaceSmall),
      Flexible(
        child: CustomText(
          text: AppInfo.supportMail,
          blueLightColor: true,
          style: textTheme.bodyMedium,
        ),
      ),
    ],
  );
}

Widget _agreementBuilder(MainAxisAlignment mainAxisAlignment) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    children: [
      CustomButton(
        onPressed: () => Get.offNamed(
          '${AppPages.documents}/user-agreement/terms-of-use',
        ),
        text: "1013@global".tr,
        type: ButtonType.text,
        width: 130.0,
      ),
      CustomButton(
        onPressed: () => Get.offNamed(
          '${AppPages.documents}/user-agreement/privacy-policy',
        ),
        text: "1014@global".tr,
        type: ButtonType.text,
        width: 130.0,
      ),
    ],
  );
}

// Widget _subSectionsBuilder(TextTheme textTheme) {
//   return Wrap(
//     spacing: AppDecoration.spaceMedium,
//     runSpacing: AppDecoration.spaceMedium,
//     children: [
//       _subSection(
//         textTheme: textTheme,
//         name: "1011@global".tr,
//         buttons: {
//           "1029@global".tr: () =>
//               Get.offNamed('/documents/about/what-is-keyless'),
//           "1018@global".tr: () =>
//               Get.offNamed('/documents/guide/how-to-install'),
//           "1019@global".tr: () =>
//               Get.offNamed('/documents/guide/how-to-setup-2fa'),
//           "1020@global".tr: () =>
//               Get.offNamed('/documents/guide/how-to-receive'),
//           "1021@global".tr: () => Get.offNamed('/documents/guide/how-to-send'),
//           "1018@home".tr: () => Get.offNamed('/documents/guide/how-to-stake'),
//           "1020@home".tr: () => Get.offNamed('/documents/guide/how-to-backup'),
//         },
//       ),
//       _subSection(
//         textTheme: textTheme,
//         name: "1009@global".tr,
//         buttons: {
//           "1012@global".tr: () => Get.offNamed('/documents/about'),
//           "1030@global".tr: () => Get.offNamed('/documents/about/whitepaper'),
//           "1013@global".tr: () =>
//               Get.offNamed('/documents/user-agreement/terms-of-use'),
//           "1014@global".tr: () =>
//               Get.offNamed('/documents/user-agreement/privacy-policy'),
//         },
//       ),
//       _subSection(
//         textTheme: textTheme,
//         name: "1010@global".tr,
//         buttons: {
//           "1015@global".tr: () => openNewTab(AppInfo.twitter),
//           "1016@global".tr: () => openNewTab(AppInfo.telegramChannel),
//           "1017@global".tr: () => openNewTab(AppInfo.github),
//         },
//       ),
//     ],
//   );
// }

// Widget _subSection({
//   required TextTheme textTheme,
//   required String name,
//   required Map<String, void Function()> buttons,
// }) {
//   return SizedBox(
//     width: 200.0,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         CustomText(text: name, style: textTheme.titleMedium),
//         verticalSpace(),
//         const SizedBox(width: 100.0, child: Divider()),
//         verticalSpace(),
//         for (final MapEntry<String, void Function()> button in buttons.entries)
//           CustomButton(
//             onPressed: button.value,
//             text: button.key,
//             type: ButtonType.text,
//             height: 40.0,
//           ),
//       ],
//     ),
//   );
// }
