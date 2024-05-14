import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'clickable_widget.dart';

class CustomTagText extends StatelessWidget {
  const CustomTagText({
    required this.text,
    required this.fontColor,
    required this.backgroundColor,
    this.onPressed,
    this.fontSize,
    this.padding,
    super.key,
  });

  final String text;
  final Color fontColor;
  final Color backgroundColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    Widget widget = Container(
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

    if (onPressed != null) {
      widget = CustomClickableWidget(
        onTap: onPressed,
        child: widget,
      );
    }

    return widget;
  }
}
