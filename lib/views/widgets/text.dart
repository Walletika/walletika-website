import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    required this.text,
    this.maxWidth = AppDecoration.textSectionWidth,
    this.textAlign,
    this.softWrap,
    this.blueLightColor = false,
    this.style,
    super.key,
  });

  final String text;
  final double maxWidth;
  final TextAlign? textAlign;
  final bool? softWrap;
  final bool blueLightColor;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    TextStyle customStyle = (style ?? themeData.textTheme.bodyLarge)!;
    if (blueLightColor) {
      customStyle = customStyle.copyWith(
        color: themeData.colorScheme.onSurfaceVariant,
      );
    }

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Text(
        text,
        textAlign: textAlign,
        softWrap: softWrap,
        style: customStyle,
        overflow: TextOverflow.fade,
      ),
    );
  }
}
