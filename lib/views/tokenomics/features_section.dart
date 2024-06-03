import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../utils/constants.dart';
import '../widgets/feature.dart';
import '../widgets/section.dart';

class TokenomicsFeaturesSection extends GetResponsiveView {
  TokenomicsFeaturesSection({
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
    return _sectionBuilder(
      context: context,
      isPhone: false,
    );
  }
}

class _PhoneView extends StatelessWidget {
  const _PhoneView();

  @override
  Widget build(BuildContext context) {
    return _sectionBuilder(
      context: context,
      isPhone: true,
    );
  }
}

Widget _sectionBuilder({
  required BuildContext context,
  required bool isPhone,
}) {
  final double? width = isPhone ? null : 250.0;

  return CustomSection(
    layout: SectionLayout.wrap,
    children: [
      CustomFeature(
        icon: const Icon(
          LineIcons.coins,
          size: AppDecoration.iconBigSize,
        ),
        title: "1004@tokenomics".tr,
        description: "1005@tokenomics".tr,
        width: width,
      ),
      CustomFeature(
        icon: const Icon(
          LineIcons.recycle,
          size: AppDecoration.iconBigSize,
        ),
        title: "1006@tokenomics".tr,
        description: "1007@tokenomics".tr,
        width: width,
      ),
      CustomFeature(
        icon: const Icon(
          LineIcons.wiredNetwork,
          size: AppDecoration.iconBigSize,
        ),
        title: "1008@tokenomics".tr,
        description: "1009@tokenomics".tr,
        width: width,
      ),
    ],
  );
}
