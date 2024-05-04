import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../utils/constants.dart';
import '../widgets/feature.dart';
import '../widgets/section.dart';

class TokenomicsFeaturesSection extends StatelessWidget {
  const TokenomicsFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    const double width = 300.0;

    return CustomSection(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDecoration.padding,
        vertical: AppDecoration.paddingLargest,
      ),
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
}
