import 'package:flutter/material.dart';

import '../widgets/page.dart';
import 'buy_steps_section.dart';
import 'distribution_section.dart';
import 'features_section.dart';
import 'follow_section.dart';
import 'main_section.dart';
import 'presale_section.dart';
// import 'private_sale_section.dart';
import 'prices_section.dart';
import 'rate_section.dart';
import 'tokens_lock_section.dart';

class TokenomicsView extends StatelessWidget {
  const TokenomicsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPage([
      const MainTokenomicsSection(),
      PresaleSection(),
      PricesSection(),
      BuyStepsSection(),
      const FollowSaleSection(),
      const TokenDistributionSection(),
      const TokenomicsFeaturesSection(),
      TokensLockSection(),
      // PrivateSaleSection(),
      const TokenomicsRateSection(),
    ]);
  }
}
