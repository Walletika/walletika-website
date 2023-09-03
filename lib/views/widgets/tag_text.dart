import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomTagText extends StatelessWidget {
  const CustomTagText({
    required this.text,
    required this.fontColor,
    required this.backgroundColor,
    this.fontSize,
    this.padding,
    super.key,
  });

  final String text;
  final Color fontColor;
  final Color backgroundColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: padding ?? const EdgeInsets.all(AppDecoration.paddingSmall),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppDecoration.radiusMedium),
        border: Border.all(color: backgroundColor.withOpacity(0.5)),
      ),
      constraints: const BoxConstraints(minWidth: 60.0),
      child: Text(
        text,
        style: textTheme.bodySmall!.copyWith(
          color: fontColor,
          fontSize: fontSize,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
