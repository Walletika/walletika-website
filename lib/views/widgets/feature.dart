import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'spacer.dart';
import 'text.dart';

enum FeatureType { filled, outlined }

class CustomFeature extends StatelessWidget {
  const CustomFeature({
    this.icon,
    this.title,
    this.description,
    this.body,
    this.width,
    this.height,
    this.iconBordered = true,
    this.type = FeatureType.filled,
    super.key,
  });

  final Widget? icon;
  final String? title;
  final String? description;
  final Widget? body;
  final double? width;
  final double? height;
  final bool iconBordered;
  final FeatureType type;

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
      height: height,
      decoration: BoxDecoration(
        color: type == FeatureType.filled ? AppColors.white : null,
        borderRadius: BorderRadius.circular(AppDecoration.radiusBig),
        border: type == FeatureType.outlined
            ? Border.all(color: colorScheme.secondary, width: 2.0)
            : null,
        boxShadow: type == FeatureType.filled
            ? [
                BoxShadow(
                  color: colorScheme.shadow.withAlpha(20),
                  offset: const Offset(10.0, 20.0),
                  blurRadius: 10.0,
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          if (title != null)
            CustomText(
              text: title!,
              textAlign: TextAlign.center,
              style: textTheme.titleMedium,
            ),
          if ((description != null || body != null) && title != null)
            verticalSpace(),
          if (description != null)
            CustomText(
              text: description!,
              textAlign: TextAlign.center,
              blueLightColor: true,
              style: textTheme.bodyMedium,
            ),
          if ((title != null || description != null) && body != null)
            verticalSpace(AppDecoration.spaceMedium),
          if (body != null) body!,
        ],
      ),
    );

    if (icon != null) {
      widget = Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(children: [verticalSpace(AppDecoration.spaceLargest), widget]),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: iconBordered
                  ? Border.all(
                      color: colorScheme.background,
                      width: AppDecoration.space,
                      strokeAlign: BorderSide.strokeAlignCenter,
                    )
                  : null,
              borderRadius: BorderRadius.circular(AppDecoration.radiusLarge),
            ),
            child: icon,
          ),
        ],
      );
    }

    return widget;
  }
}
