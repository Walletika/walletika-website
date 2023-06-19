import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../widgets/reaction.dart';
import '../widgets/section.dart';

class RateSection extends StatelessWidget {
  const RateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      padding: const EdgeInsets.all(AppDecoration.paddingBig),
      children: [
        CustomReaction(title: "1006@download".tr),
      ],
    );
  }
}
