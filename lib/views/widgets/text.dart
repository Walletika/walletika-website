import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/screen_mode.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    required this.text,
    this.maxWidth = AppDecoration.textSectionWidth,
    this.textAlign,
    this.softWrap,
    this.responsive = false,
    this.blueLightColor = false,
    this.style,
    super.key,
  });

  final String text;
  final double maxWidth;
  final TextAlign? textAlign;
  final bool? softWrap;
  final bool responsive;
  final bool blueLightColor;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    bool inCenter = false;

    TextStyle customStyle = (style ?? themeData.textTheme.bodyLarge)!;
    if (blueLightColor) {
      customStyle = customStyle.copyWith(
        color: themeData.colorScheme.onSurfaceVariant,
      );
    }

    if (responsive) {
      inCenter = ScreenMode(context.width).isTabletOrPhone;
    }

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Text(
        text,
        textAlign: inCenter ? TextAlign.center : textAlign,
        softWrap: softWrap,
        style: customStyle,
        overflow: TextOverflow.fade,
      ),
    );
  }
}
