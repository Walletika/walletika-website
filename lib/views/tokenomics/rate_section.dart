import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/reaction.dart';
import '../widgets/section.dart';

class TokenomicsRateSection extends StatelessWidget {
  const TokenomicsRateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      children: [
        CustomReaction(title: "1018@tokenomics".tr),
      ],
    );
  }
}
