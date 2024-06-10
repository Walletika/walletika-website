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
        horizontal: AppDecoration.paddingMedium,
        vertical: AppDecoration.paddingLargest,
      ),
      layout: SectionLayout.wrap,
      wrapSpacing: AppDecoration.paddingBig,
      wrapCrossAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(
          width: 400.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "1060@tokenomics".tr,
                style: textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(),
              for (final String text in [
                "1039@tokenomics",
                "1061@tokenomics",
                "1064@tokenomics",
                "1040@tokenomics",
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
                verticalSpace()
              ],
              verticalSpace(AppDecoration.spaceMedium),
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
                "1038@tokenomics",
                "1036@tokenomics",
                "1063@tokenomics",
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
                verticalSpace()
              ],
              verticalSpace(),
              Obx(() {
                final List<PartnerModel>? exchanges = _homeController.exchanges;

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
            acceptedNetworks: controller.acceptedNetworks,
            refetch: controller.refetch,
            referralID: _homeController.referralID,
          );
        }),
      ],
    );
  }
}
