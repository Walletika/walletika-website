import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/amount_formatter.dart';
import '../../utils/digit_format.dart';
import 'text_field.dart';

class CustomAmountField extends StatelessWidget {
  const CustomAmountField({
    required this.controller,
    this.symbol,
    this.showMaxButton = false,
    this.imageURL,
    this.balance,
    this.readOnly = false,
    this.enabled = true,
    this.onChanged,
    this.onEditingComplete,
    super.key,
  });

  final TextEditingController controller;
  final bool showMaxButton;
  final String? symbol;
  final String? imageURL;
  final Decimal? balance;
  final bool readOnly;
  final bool enabled;
  final void Function(String text)? onChanged;
  final void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      placeholderText: "1046@global".tr,
      maxLength: 40,
      keyboardType: TextInputType.number,
      inputFormatters: [AmountFormatter()],
      readOnly: readOnly,
      enabled: enabled,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      validator: balance != null ? _validator : null,
    );
  }

  String? _validator(String? text) {
    if (text != null) {
      final Decimal value = Decimal.parse(text);

      if (value > balance!) {
        return '${"1002@warns".tr} ${convertToFiatFormat(value: balance, symbol: symbol ?? '')}';
      } else if (value == Decimal.zero) {
        return "1001@warns".tr;
      }
    }

    return null;
  }
}
