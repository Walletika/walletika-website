import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    this.padding,
    this.url,
    this.path,
    this.width,
    this.height,
    super.key,
  });

  final EdgeInsetsGeometry? padding;
  final String? url;
  final String? path;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if (url != null) {
      widget = Image.network(
        url!,
        width: width,
        height: height,
        filterQuality: FilterQuality.medium,
        isAntiAlias: true,
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

    if (padding != null) {
      widget = Padding(padding: padding!, child: widget);
    }

    return widget;
  }
}
