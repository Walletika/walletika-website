import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/round.dart';
import '../../utils/constants.dart';
import '../../utils/digit_format.dart';
import '../../utils/launch_url.dart';
import '../../utils/time_calculator.dart';
import 'address.dart';
import 'amount_field.dart';
import 'awesome_dialog.dart';
import 'button.dart';
import 'spacer.dart';
import 'tag_text.dart';
import 'text.dart';

class CustomRound extends StatelessWidget {
  const CustomRound({
    required this.index,
    required this.model,
    required this.locale,
    required this.acceptedCoins,
    required this.acceptedNetworks,
    super.key,
  });

  final int index;
  final RoundModel model;
  final String locale;
  final List<String> acceptedCoins;
  final List<String> acceptedNetworks;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    final DateTime now = DateTime.now().toUtc();
    bool isLive = false;

    final String tagText;
    final Color tagFontColor;
    final Color tagBackgroundColor;

    if (!model.isCompleted && now.isBefore(model.startTime)) {
      tagText = "1039@global".tr;
      tagFontColor = AppColors.purple;
      tagBackgroundColor = AppColors.purpleAccent;
    } else if (!model.isCompleted && now.isBefore(model.endTime)) {
      tagText = "1040@global".tr;
      tagFontColor = AppColors.green;
      tagBackgroundColor = AppColors.green;
      isLive = true;
    } else {
      tagText = model.isCompleted ? "1042@global".tr : "1041@global".tr;
      tagFontColor = AppColors.grey;
      tagBackgroundColor = AppColors.grey;
    }

    return Container(
      padding: const EdgeInsets.all(AppDecoration.paddingMedium),
      width: 300.0,
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.tertiary),
        borderRadius: BorderRadius.circular(AppDecoration.radiusBig),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${"1038@global".tr} ${index + 1}',
                style: textTheme.titleLarge,
              ),
              Column(
                children: [
                  CustomTagText(
                    text: tagText,
                    fontColor: tagFontColor,
                    backgroundColor: tagBackgroundColor,
                  ),
                  verticalSpace(AppDecoration.spaceSmall),
                  Text(
                    timeAgo(time: model.startTime, locale: locale),
                    style: textTheme.bodySmall!.copyWith(color: tagFontColor),
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(AppDecoration.spaceMedium),
          _infoBuilder(
            themeData: themeData,
            name: "1033@global".tr,
            value: '${timeDisplay(time: model.startTime)} UTC',
          ),
          _infoBuilder(
            themeData: themeData,
            name: "1034@global".tr,
            value: '${timeDisplay(time: model.endTime)} UTC',
          ),
          _infoBuilder(
            themeData: themeData,
            name: "1035@global".tr,
            value: '${convertToIntFormat(model.tokens)} ${model.tokenSymbol}',
          ),
          _infoBuilder(
            themeData: themeData,
            name: "1036@global".tr,
            value: '${model.price} ${model.priceSymbol}',
          ),
          verticalSpace(AppDecoration.spaceMedium),
          _infoBuilder(
            themeData: themeData,
            name: "1043@global".tr,
            value:
                '${convertToIntFormat(model.sold)} ${model.tokenSymbol} (${model.progressPercent}%)',
          ),
          verticalSpace(AppDecoration.spaceSmall),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDecoration.radiusSmall),
            child: LinearProgressIndicator(
              value: model.progressValue,
              backgroundColor: colorScheme.secondary,
              minHeight: 10.0,
            ),
          ),
          verticalSpace(AppDecoration.spaceBig),
          Center(
            child: SizedBox(
              height: AppDecoration.buttonHeight,
              child: CustomButton(
                onPressed: isLive
                    ? model.url != null
                        ? () => openNewTab(model.url!)
                        : model.address != null
                            ? _onBuyDeposit
                            : null
                    : null,
                text: "1037@global".tr,
                type: ButtonType.filled,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _infoBuilder({
    required ThemeData themeData,
    required String name,
    required String value,
  }) {
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: textTheme.bodyMedium),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: textTheme.bodyMedium!.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }

  void _onBuyDeposit() {
    customAwesomeDialog(
      body: _PaymentForm(
        coins: acceptedCoins,
        model: model,
        onPressed: _onBuyCheckout,
      ),
    ).show();
  }

  void _onBuyCheckout(String amount, String saleAmount) {
    final ThemeData themeData = Theme.of(Get.context!);
    final TextTheme textTheme = themeData.textTheme;

    customAwesomeDialog(
      body: Column(
        children: [
          CustomText(
            text: "1049@global".tr,
            style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          verticalSpace(AppDecoration.spaceBig),
          _infoBuilder(
            themeData: themeData,
            name: "1052@global".tr,
            value: saleAmount,
          ),
          _infoBuilder(
            themeData: themeData,
            name: "1053@global".tr,
            value: amount,
          ),
          _infoBuilder(
            themeData: themeData,
            name: "1054@global".tr,
            value: acceptedNetworks.join('\n'),
          ),
          verticalSpace(AppDecoration.spaceMedium),
          CustomText(
            text: "1027@tokenomics".tr,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium!.copyWith(color: AppColors.red),
          ),
          verticalSpace(AppDecoration.spaceMedium),
          CustomText(
            text: '${"1028@tokenomics".tr} $amount ${"1029@tokenomics".tr}',
            textAlign: TextAlign.center,
          ),
          CustomAddressText(model.address!),
          verticalSpace(AppDecoration.spaceMedium),
          const LinearProgressIndicator(backgroundColor: AppColors.transparent),
          verticalSpace(AppDecoration.spaceMedium),
        ],
      ),
      btnOkText: "1050@global".tr,
      btnOkOnPress: _onBuyConfirm,
    ).show();
  }

  void _onBuyConfirm() {
    customAwesomeDialog(
      dialogType: DialogType.success,
      title: "1055@global".tr,
      desc: "1030@tokenomics".tr,
      btnOkText: "1044@global".tr,
    ).show();
  }
}

class _PaymentForm extends StatefulWidget {
  const _PaymentForm({
    required this.coins,
    required this.model,
    required this.onPressed,
  });

  final List<String> coins;
  final RoundModel model;
  final void Function(String amount, String saleAmount) onPressed;

  @override
  State<_PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<_PaymentForm> {
  late String selectedCoin = widget.coins.first;
  late String saleAmount = '0 ${widget.model.tokenSymbol}';
  late String exchangeAmount = '0 ${widget.model.tokenSymbol}';

  final GlobalKey<FormState> formController = GlobalKey<FormState>();
  final TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    amountController.addListener(_onChangedField);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Column(
      children: [
        CustomText(text: "1048@global".tr),
        CustomText(
          text:
              '${convertToIntFormat(widget.model.availableTokens)} ${widget.model.tokenSymbol}',
          style: textTheme.headlineMedium,
        ),
        verticalSpace(AppDecoration.spaceBig),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: CustomText(
                text: "1023@tokenomics".tr,
                style: textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            horizontalSpace(),
            DropdownButton(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDecoration.padding,
              ),
              style: textTheme.labelLarge,
              icon: const Icon(Icons.arrow_drop_down_rounded),
              borderRadius: BorderRadius.circular(AppDecoration.radius),
              dropdownColor: themeData.popupMenuTheme.color,
              underline: zeroSpace(),
              value: selectedCoin,
              onChanged: _onChangedDropdown,
              items: widget.coins
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.toUpperCase()),
                      ))
                  .toList(),
            ),
          ],
        ),
        verticalSpace(),
        Form(
          key: formController,
          child: CustomAmountField(
            controller: amountController,
            balance: Decimal.fromInt(widget.model.availableTokensCost),
            symbol: selectedCoin,
          ),
        ),
        verticalSpace(AppDecoration.spaceMedium),
        CustomText(
          text:
              '${"1024@tokenomics".tr} $saleAmount ${"1025@tokenomics".tr} $exchangeAmount ${"1026@tokenomics".tr}',
          textAlign: TextAlign.center,
          blueLightColor: true,
          style: textTheme.bodyMedium,
        ),
        verticalSpace(AppDecoration.spaceMedium),
        Center(
          child: SizedBox(
            width: AppDecoration.widgetWidth,
            child: CustomButton(
              onPressed: _onPressed,
              text: "1047@global".tr,
              type: ButtonType.filled,
            ),
          ),
        ),
        verticalSpace(AppDecoration.spaceMedium),
      ],
    );
  }

  void _onChangedField() {
    final double amount = double.tryParse(amountController.text) ?? 0;

    setState(() {
      saleAmount =
          '${convertToIntFormat(amount ~/ widget.model.price)} ${widget.model.tokenSymbol}';
      exchangeAmount =
          '${convertToIntFormat(amount ~/ 0.3)} ${widget.model.tokenSymbol}';
    });
  }

  void _onChangedDropdown(String? value) {
    if (value == null) return;

    setState(() {
      selectedCoin = value;
    });
  }

  void _onPressed() {
    if (formController.currentState!.validate()) {
      Get.back();
      widget.onPressed.call(
        convertToFiatFormat(
          value: Decimal.tryParse(amountController.text),
          symbol: selectedCoin,
        ),
        saleAmount,
      );
    }
  }
}
