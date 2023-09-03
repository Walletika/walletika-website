import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'copyable_text.dart';

class CustomAddressText extends StatelessWidget {
  const CustomAddressText(
    this.data, {
    this.width,
    this.height = 22.0,
    this.mainAxisAlignment = MainAxisAlignment.center,
    super.key,
  });

  final String data;
  final double? width;
  final double height;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return CustomCopyableText(
      data,
      width: width,
      height: height,
      softWrap: false,
      overflow: AppDecoration.textOverflow,
      style: textTheme.bodySmall!.copyWith(color: colorScheme.onSurfaceVariant),
      mainAxisAlignment: mainAxisAlignment,
    );
  }
}
