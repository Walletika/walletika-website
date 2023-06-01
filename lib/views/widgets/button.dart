import 'package:flutter/material.dart';

import '../../utils/constants.dart';

enum ButtonType { elevated, filled, outlined, text, icon }

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    required this.text,
    this.type = ButtonType.elevated,
    this.standardSize = true,
    this.icon,
    this.width,
    this.height,
    super.key,
  });

  final void Function()? onPressed;
  final String? text;
  final ButtonType type;
  final bool standardSize;
  final Icon? icon;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    Widget widget;

    switch (type) {
      case ButtonType.elevated:
        widget = _elevatedButton(onPressed, Text(text!), icon);
        break;
      case ButtonType.filled:
        widget = _filledButton(onPressed, Text(text!), icon);
        break;
      case ButtonType.outlined:
        widget = _outlinedButton(onPressed, Text(text!), icon);
        break;
      case ButtonType.text:
        widget = _textButton(onPressed, Text(text!), icon);
        break;
      case ButtonType.icon:
        widget = IconButton(onPressed: onPressed, icon: icon!, tooltip: text);
        break;
    }

    if (standardSize || width != null || height != null) {
      widget = ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: width ?? AppDecoration.minButtonWidth,
          maxWidth: width ?? double.infinity,
          minHeight: height ?? AppDecoration.buttonHeightLarge,
          maxHeight: height ?? double.infinity,
        ),
        child: widget,
      );
    }

    return widget;
  }

  ElevatedButton _elevatedButton(
    void Function()? onPressed,
    Text text,
    Icon? icon,
  ) {
    return icon != null
        ? ElevatedButton.icon(onPressed: onPressed, label: text, icon: icon)
        : ElevatedButton(onPressed: onPressed, child: text);
  }

  FilledButton _filledButton(
    void Function()? onPressed,
    Text text,
    Icon? icon,
  ) {
    return icon != null
        ? FilledButton.icon(onPressed: onPressed, label: text, icon: icon)
        : FilledButton(onPressed: onPressed, child: text);
  }

  OutlinedButton _outlinedButton(
    void Function()? onPressed,
    Text text,
    Icon? icon,
  ) {
    return icon != null
        ? OutlinedButton.icon(onPressed: onPressed, label: text, icon: icon)
        : OutlinedButton(onPressed: onPressed, child: text);
  }

  TextButton _textButton(
    void Function()? onPressed,
    Text text,
    Icon? icon,
  ) {
    return icon != null
        ? TextButton.icon(onPressed: onPressed, label: text, icon: icon)
        : TextButton(onPressed: onPressed, child: text);
  }
}
