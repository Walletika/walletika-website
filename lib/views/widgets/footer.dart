import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'section.dart';

class CustomFooterSection extends StatelessWidget {
  const CustomFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomSection(
      stretch: true,
      height: 500.0,
      backgroundColor: AppColors.background2Dark,
      children: [],
    );
  }
}
