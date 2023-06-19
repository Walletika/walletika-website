import 'package:flutter/material.dart';

import '../home/features_section.dart';
import '../widgets/page.dart';
import 'platforms_section.dart';
import 'main_section.dart';
import 'rate_section.dart';

class DownloadView extends StatelessWidget {
  const DownloadView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPage([
      const MainDownloadSection(),
      const PlatformsSection(),
      const RateSection(),
      FeaturesSection(),
    ]);
  }
}
