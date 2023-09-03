import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/settings.dart';
import '../../controllers/token.dart';
import '../../models/round.dart';
import '../../utils/constants.dart';
import '../widgets/round.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class PresaleSection extends GetView<TokenController> {
  PresaleSection({super.key});

  final SettingsController _settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return CustomSection(
      padding: const EdgeInsets.only(
        top: AppDecoration.paddingBig,
        bottom: AppDecoration.paddingBig,
        right: AppDecoration.paddingBig,
        left: AppDecoration.paddingLarge,
      ),
      children: [
        CustomText(
          text: "1021@token".tr,
          textAlign: TextAlign.center,
          style: textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        verticalSpace(),
        CustomText(
          text: "1022@token".tr,
          textAlign: TextAlign.center,
          style: textTheme.headlineSmall,
        ),
        verticalSpace(AppDecoration.spaceLarge),
        Obx(() {
          final List<RoundModel>? rounds = controller.presale;

          if (rounds == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Wrap(
            spacing: AppDecoration.spaceBig,
            runSpacing: AppDecoration.spaceBig,
            children: [
              for (int index = 0; index < rounds.length; index++)
                CustomRound(
                  index: index,
                  model: rounds[index],
                  locale: _settingsController.currentLanguage,
                  acceptedCoins: controller.acceptedCoins,
                  acceptedNetworks: controller.acceptedNetworks,
                ),
            ],
          );
        }),
      ],
    );
  }
}
