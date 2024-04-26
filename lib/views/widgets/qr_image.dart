import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../utils/constants.dart';

class CustomQRImage extends StatelessWidget {
  const CustomQRImage({
    required this.data,
    this.size = 180.0,
    super.key,
  });

  final String data;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDecoration.radius),
      child: QrImageView(
        data: data,
        size: size,
        padding: const EdgeInsets.all(AppDecoration.paddingMedium),
        backgroundColor: colorScheme.secondary,
        eyeStyle: QrEyeStyle(color: colorScheme.onSurface),
        dataModuleStyle: QrDataModuleStyle(color: colorScheme.onSurface),
        version: QrVersions.auto,
        gapless: false,
      ),
    );
  }
}
