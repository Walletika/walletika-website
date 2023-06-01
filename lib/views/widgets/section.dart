import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomSection extends StatelessWidget {
  const CustomSection({
    this.stretch = false,
    this.responsive = true,
    this.spacing = AppDecoration.spaceLarge,
    this.height = AppDecoration.sectionHeight,
    this.borderRadius,
    this.backgroundColor,
    required this.children,
    super.key,
  });

  final bool stretch;
  final bool responsive;
  final double spacing;
  final double height;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    BoxDecoration? decoration;

    if (backgroundColor != null) {
      decoration = BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      );
    }

    return Container(
      padding: const EdgeInsets.all(AppDecoration.paddingMedium),
      decoration: decoration,
      constraints: BoxConstraints(
        minWidth: stretch ? double.infinity : AppDecoration.pageWidth,
        maxWidth: stretch ? double.infinity : AppDecoration.pageWidth,
        minHeight: height,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: responsive ? Axis.horizontal : Axis.vertical,
        spacing: spacing,
        runSpacing: spacing,
        children: children,
      ),
    );
  }
}
