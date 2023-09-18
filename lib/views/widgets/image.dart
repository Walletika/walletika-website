import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    this.padding,
    this.url,
    this.path,
    this.width,
    this.height,
    this.fit,
    this.circled = false,
    super.key,
  });

  final EdgeInsetsGeometry? padding;
  final String? url;
  final String? path;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool circled;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    Widget widget;

    if (url != null) {
      widget = Image.network(
        url!,
        width: width,
        height: height,
        filterQuality: FilterQuality.medium,
        isAntiAlias: true,
        fit: fit,
      );
    } else {
      widget = Image.asset(
        path!,
        width: width,
        height: height,
        filterQuality: FilterQuality.medium,
        isAntiAlias: true,
      );
    }

    if (circled) {
      widget = Container(
        padding: padding,
        decoration: BoxDecoration(
          color: colorScheme.tertiary,
          borderRadius: BorderRadius.circular(AppDecoration.radiusLarge),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppDecoration.radiusLarge),
          child: widget,
        ),
      );
    } else if (padding != null) {
      widget = Padding(padding: padding!, child: widget);
    }

    return widget;
  }
}
