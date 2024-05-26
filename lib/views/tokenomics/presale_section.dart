import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home.dart';
import '../../controllers/tokenomics.dart';
import '../../models/partner.dart';
import '../../models/round.dart';
import '../../utils/constants.dart';
import '../widgets/image.dart';
import '../widgets/sale_round.dart';
import '../widgets/active_status.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class PresaleSection extends GetView<TokenomicsController> {
  PresaleSection({super.key});

  final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    return CustomSection(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDecoration.padding,
        vertical: AppDecoration.paddingLargest,
      ),
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
                    "1038@tokenomics",
                    "1039@tokenomics",
                    "1040@tokenomics",
                    "1037@tokenomics",
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
                  Obx(() {
                    final List<PartnerModel>? exchanges =
                        _homeController.exchanges;

                    if (exchanges == null) {
                      return const CircularProgressIndicator();
                    }

                    return Wrap(
                      spacing: AppDecoration.space,
                      runSpacing: AppDecoration.space,
                      children: [
                        for (final PartnerModel exchange in exchanges)
                          CustomImage(
                            url: exchange.imageURL,
                            circled: true,
                            width: 40.0,
                          ),
                      ],
                    );
                  }),
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
