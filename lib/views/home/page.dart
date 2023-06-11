import 'package:flutter/material.dart';

import '../widgets/page.dart';
import 'community_section.dart';
import 'features.dart';
import 'main_section.dart';
import 'security_section.dart';
import 'usb_section.dart';
import 'what_is_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPage([
      MainSection(),
      WhatIsSection(),
      SecuritySection(),
      USBSection(),
      FeaturesSection(),
      CommunitySection(),
    ]);
  }
}
