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
    const double width = 350.0;

    return CustomSection(
      padding: const EdgeInsets.only(
        top: 100.0,
        bottom: AppDecoration.paddingBig,
        right: AppDecoration.paddingBig,
        left: AppDecoration.paddingBig,
      ),
      layout: SectionLayout.wrap,
      children: [
        CustomFeature(
          icon: LineIcons.alternateShield,
          title: "1002@tokenomics".tr,
          description: "1003@tokenomics".tr,
          width: width,
        ),
        CustomFeature(
          icon: LineIcons.coins,
          title: "1004@tokenomics".tr,
          description: "1005@tokenomics".tr,
          width: width,
        ),
        CustomFeature(
          icon: LineIcons.recycle,
          title: "1006@tokenomics".tr,
          description: "1007@tokenomics".tr,
          width: width,
        ),
        CustomFeature(
          icon: LineIcons.wiredNetwork,
          title: "1008@tokenomics".tr,
          description: "1009@tokenomics".tr,
          width: width,
        ),
      ],
    );
  }
}
