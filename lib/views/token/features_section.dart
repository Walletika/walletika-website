import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../widgets/feature.dart';
import '../widgets/section.dart';

class TokenFeaturesSection extends StatelessWidget {
  const TokenFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    const double width = 350.0;
    const double height = 200.0;

    return CustomSection(
      layout: SectionLayout.wrap,
      children: [
        CustomFeature(
          icon: LineIcons.ban,
          title: "1002@token".tr,
          description: "1003@token".tr,
          width: width,
          height: height,
        ),
        CustomFeature(
          icon: LineIcons.coins,
          title: "1004@token".tr,
          description: "1005@token".tr,
          width: width,
          height: height,
        ),
        CustomFeature(
          icon: LineIcons.recycle,
          title: "1006@token".tr,
          description: "1007@token".tr,
          width: width,
          height: height,
        ),
        CustomFeature(
          icon: LineIcons.alternateShield,
          title: "1008@token".tr,
          description: "1009@token".tr,
          width: width,
          height: height,
        ),
      ],
    );
  }
}