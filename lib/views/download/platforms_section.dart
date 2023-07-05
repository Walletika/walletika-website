import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletika_website/utils/launch_url.dart';

import '../../controllers/download.dart';
import '../../models/package.dart';
import '../../utils/constants.dart';
import '../widgets/button.dart';
import '../widgets/image.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class PlatformsSection extends GetView<DownloadController> {
  const PlatformsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      layout: SectionLayout.wrap,
      children: [
        _platformBuilder(
          context: context,
          title: "1002@download".tr,
          description: "1003@download".tr,
          path: AppImages.theme("mobile"),
          packageType: PackageType.mobile,
          controller: controller,
        ),
        _platformBuilder(
          context: context,
          title: "1004@download".tr,
          description: "1005@download".tr,
          path: AppImages.theme("desktop"),
          packageType: PackageType.desktop,
          controller: controller,
        ),
      ],
    );
  }
}

Widget _platformBuilder({
  required BuildContext context,
  required String title,
  required String description,
  required String path,
  required PackageType packageType,
  required DownloadController controller,
}) {
  final ThemeData themeData = Theme.of(context);
  final TextTheme textTheme = themeData.textTheme;

  return Column(
    children: [
      CustomText(
        text: title,
        textAlign: TextAlign.center,
        maxWidth: 400.0,
        style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
      ),
      verticalSpace(),
      CustomText(
        text: description,
        textAlign: TextAlign.center,
        maxWidth: 400.0,
        blueLightColor: true,
      ),
      verticalSpace(AppDecoration.spaceLarge),
      SizedBox(
        width: 350.0,
        child: Obx(() {
          final List<PackageModel>? packages = controller.packages;

          if (packages == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: AppDecoration.space,
            runSpacing: AppDecoration.space,
            children: [
              for (final PackageModel package in packages)
                if (package.packageType == packageType) _buttonBuilder(package),
            ],
          );
        }),
      ),
      verticalSpace(AppDecoration.spaceLarge),
      CustomImage(
        path: path,
        width: 400.0,
      ),
    ],
  );
}

Widget _buttonBuilder(PackageModel package) {
  void Function()? onPressed;
  String? tooltip;

  if (package.packageURL != null) {
    onPressed = () => openNewTab(package.packageURL!);
  } else {
    tooltip = "1007@download".tr;
  }

  return CustomButton(
    onPressed: onPressed,
    imageURL: package.imageURL,
    type: ButtonType.image,
    width: 170.0,
    height: 51.0,
    tooltip: tooltip,
  );
}
