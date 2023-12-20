import 'package:flutter/material.dart';

import '../widgets/page.dart';
import 'community_section.dart';
// import 'main_banner.dart';
import 'mastercard_section.dart';
import 'sub_features_section.dart';
import 'main_section.dart';
import 'partners_section.dart';
import 'security_section.dart';
import 'features_section.dart';
import 'team_section.dart';
import 'usb_section.dart';
import 'no_data_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPage([
      // MainBannerSection(),
      MainSection(),
      NoDataSection(),
      SecuritySection(),
      USBSection(),
      MastercardSection(),
      SubFeaturesSection(),
      FeaturesSection(),
      PartnersSection(),
      TeamSection(),
      CommunitySection(),
    ]);
  }
}
