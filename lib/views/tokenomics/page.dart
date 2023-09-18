import 'package:flutter/material.dart';

import '../widgets/page.dart';
import 'distribution_section.dart';
import 'features_section.dart';
import 'follow_section.dart';
import 'main_section.dart';
import 'presale_section.dart';
import 'private_sale_section.dart';
import 'rate_section.dart';

class TokenomicsView extends StatelessWidget {
  const TokenomicsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPage([
      const MainTokenomicsSection(),
      const TokenomicsFeaturesSection(),
      const TokenDistributionSection(),
      PrivateSaleSection(),
      const FollowSaleSection(),
      PresaleSection(),
      const TokenomicsRateSection(),
    ]);
  }
}
