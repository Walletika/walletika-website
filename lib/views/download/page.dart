import 'package:flutter/material.dart';

import '../widgets/page.dart';
import 'platforms_section.dart';
import 'main_section.dart';
import 'rate_section.dart';
import 'beta_section.dart';

class DownloadView extends StatelessWidget {
  const DownloadView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPage(const [
      MainDownloadSection(),
      BetaSection(),
      PlatformsSection(),
      RateSection(),
    ]);
  }
}
