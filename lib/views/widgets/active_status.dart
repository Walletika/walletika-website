import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomActiveStatus extends StatelessWidget {
  const CustomActiveStatus({
    required this.isActive,
    this.customColor,
    this.tooltip,
    super.key,
  });

  final bool isActive;
  final Color? customColor;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color color = isActive
        ? customColor ?? AppColors.green
        : colorScheme.onInverseSurface;
    final RoundedRectangleBorder shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDecoration.radius),
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 7.0,
          height: 7.0,
          child: Material(color: color, shape: shape),
        ),
        SizedBox(
          width: 15.0,
          height: 15.0,
          child: Material(color: color.withOpacity(0.2), shape: shape),
        ),
      ],
    );
  }
}
