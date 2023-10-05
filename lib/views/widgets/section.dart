import 'package:flutter/material.dart';

import '../../utils/constants.dart';

enum SectionLayout { column, row, wrap }

class CustomSection extends StatelessWidget {
  const CustomSection({
    this.stretch = false,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.image,
    this.wrapSpacing = AppDecoration.spaceLarge,
    this.wrapCrossAlignment,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.layout = SectionLayout.column,
    required this.children,
    super.key,
  });

  final bool stretch;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final DecorationImage? image;
  final double wrapSpacing;
  final WrapCrossAlignment? wrapCrossAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final SectionLayout layout;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    BoxDecoration? decoration;
    final Widget layoutWidget;

    if (backgroundColor != null || image != null) {
      decoration = BoxDecoration(
        color: backgroundColor,
        image: image,
        borderRadius: borderRadius,
      );
    }

    switch (layout) {
      case SectionLayout.column:
        layoutWidget = Column(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: children,
        );
        break;
      case SectionLayout.row:
        layoutWidget = Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          children: children,
        );
        break;
      case SectionLayout.wrap:
        layoutWidget = Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: wrapCrossAlignment ?? WrapCrossAlignment.center,
          spacing: wrapSpacing,
          runSpacing: wrapSpacing,
          children: children,
        );
        break;
    }

    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: AppDecoration.paddingBig,
            vertical: AppDecoration.paddingLargest,
          ),
      decoration: decoration,
      constraints: BoxConstraints(
        minWidth: stretch ? double.infinity : width ?? AppDecoration.pageWidth,
        maxWidth: stretch ? double.infinity : width ?? AppDecoration.pageWidth,
        minHeight: height ?? 0,
      ),
      child: layoutWidget,
    );
  }
}
