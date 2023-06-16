import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../utils/constants.dart';
import 'clickable_widget.dart';
import 'spacer.dart';
import 'text.dart';

class CustomPageLine extends StatelessWidget {
  const CustomPageLine({
    required this.pages,
    required this.language,
    super.key,
  });

  final Map<String, void Function()?> pages;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppDecoration.spaceSmall,
      runSpacing: AppDecoration.spaceSmall,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final MapEntry<String, void Function()?> page
            in pages.entries) ...[
          _button(context: context, text: page.key, onTap: page.value),
          if (page.value != null) ...[
            horizontalSpace(AppDecoration.spaceSmall),
            Icon(
              language == AppLanguages.en
                  ? LineIcons.angleRight
                  : LineIcons.angleLeft,
              size: 16.0,
            ),
            horizontalSpace(AppDecoration.spaceSmall),
          ]
        ]
      ],
    );
  }

  Widget _button({
    required BuildContext context,
    required String text,
    required void Function()? onTap,
  }) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    Widget widget = CustomText(
      text: text,
      blueLightColor: onTap == null,
      style: onTap == null ? textTheme.bodyMedium : textTheme.labelLarge,
    );

    if (onTap != null) {
      widget = CustomClickableWidget(onTap: onTap, child: widget);
    }

    return widget;
  }
}
