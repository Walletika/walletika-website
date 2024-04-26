import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/tokenomics.dart';
import '../../models/round.dart';
import '../../utils/constants.dart';
import '../widgets/sale_round.dart';
import '../widgets/active_status.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class PresaleSection extends GetView<TokenomicsController> {
  const PresaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    return CustomSection(
      children: [
        CustomText(
          text: "1021@tokenomics".tr,
          textAlign: TextAlign.center,
          style: textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        verticalSpace(),
        CustomText(
          text: "1022@tokenomics".tr,
          textAlign: TextAlign.center,
          style: textTheme.headlineSmall,
        ),
        verticalSpace(AppDecoration.spaceLarge),
        Wrap(
          spacing: AppDecoration.paddingBig,
          runSpacing: AppDecoration.paddingBig,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SizedBox(
              width: 400.0,
              child: Column(
                children: [
                  CustomText(
                    text: "1033@tokenomics".tr,
                    style: textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  verticalSpace(),
                  for (final String text in [
                    "1034@tokenomics",
                    "1035@tokenomics",
                    "1036@tokenomics",
                    "1037@tokenomics",
                    "1038@tokenomics",
                    "1039@tokenomics",
                    "1040@tokenomics"
                  ]) ...[
                    Row(
                      children: [
                        CustomActiveStatus(
                          isActive: true,
                          customColor: colorScheme.primary,
                        ),
                        horizontalSpace(),
                        Flexible(child: CustomText(text: text.tr)),
                      ],
                    ),
                    verticalSpace(AppDecoration.spaceMedium)
                  ],
                ],
              ),
            ),
            Obx(() {
              final List<RoundModel>? rounds = controller.presale;

              if (rounds == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return CustomSaleRound(
                model: rounds.first,
                acceptedCoins: controller.acceptedCoins,
                acceptedNetworks: controller.acceptedNetworks,
                refetch: controller.refetch,
              );
            }),
          ],
        ),
      ],
    );
  }
}
