import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'spacer.dart';
import 'text.dart';

class CustomFeature extends StatelessWidget {
  const CustomFeature({
    this.icon,
    this.title,
    required this.description,
    this.width,
    super.key,
  });

  final IconData? icon;
  final String? title;
  final String description;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    Widget widget = Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDecoration.paddingMedium,
        vertical: AppDecoration.paddingLarge,
      ),
      width: width,
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: BorderRadius.circular(AppDecoration.radiusBig),
      ),
      child: Column(
        children: [
          if (title != null) ...[
            CustomText(
              text: title!,
              textAlign: TextAlign.center,
              style: textTheme.titleMedium,
            ),
            verticalSpace(),
          ],
          CustomText(
            text: description,
            textAlign: TextAlign.center,
            blueLightColor: true,
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );

    if (icon != null) {
      widget = Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [verticalSpace(AppDecoration.spaceLarge), widget],
          ),
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: colorScheme.tertiary,
              borderRadius: BorderRadius.circular(AppDecoration.radiusBig),
            ),
            child: Icon(
              icon,
              size: AppDecoration.iconLargeSize,
              color: colorScheme.primary,
            ),
          ),
        ],
      );
    }

    return widget;
  }
}
