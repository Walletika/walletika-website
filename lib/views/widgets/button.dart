import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'clickable_widget.dart';
import 'image.dart';

enum ButtonType { elevated, filled, outlined, text, icon, image }

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    this.text,
    this.textAlignment,
    this.type = ButtonType.elevated,
    this.standardSize = true,
    this.icon,
    this.width,
    this.height,
    this.imagePath,
    this.imageURL,
    this.tooltip,
    this.style,
    super.key,
  });

  final void Function()? onPressed;
  final String? text;
  final AlignmentGeometry? textAlignment;
  final ButtonType type;
  final bool standardSize;
  final Widget? icon;
  final double? width;
  final double? height;
  final String? imagePath;
  final String? imageURL;
  final String? tooltip;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    Widget widget;

    switch (type) {
      case ButtonType.elevated:
        widget = _elevatedButton();
        break;
      case ButtonType.filled:
        widget = _filledButton();
        break;
      case ButtonType.outlined:
        widget = _outlinedButton();
        break;
      case ButtonType.text:
        widget = _textButton();
        break;
      case ButtonType.image:
        widget = _imageButton();
        break;
      case ButtonType.icon:
        widget = IconButton(onPressed: onPressed, icon: icon!, style: style);
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

    if (tooltip != null) {
      widget = Tooltip(
        message: tooltip,
        child: widget,
      );
    }

    return SelectionContainer.disabled(child: widget);
  }

  ElevatedButton _elevatedButton() {
    return icon != null
        ? ElevatedButton.icon(
            onPressed: onPressed, label: _text(), icon: icon!, style: style)
        : ElevatedButton(onPressed: onPressed, style: style, child: _text());
  }

  FilledButton _filledButton() {
    return icon != null
        ? FilledButton.icon(
            onPressed: onPressed, label: _text(), icon: icon!, style: style)
        : FilledButton(onPressed: onPressed, style: style, child: _text());
  }

  OutlinedButton _outlinedButton() {
    return icon != null
        ? OutlinedButton.icon(
            onPressed: onPressed, label: _text(), icon: icon!, style: style)
        : OutlinedButton(onPressed: onPressed, style: style, child: _text());
  }

  TextButton _textButton() {
    return icon != null
        ? TextButton.icon(
            onPressed: onPressed, label: _text(), icon: icon!, style: style)
        : TextButton(onPressed: onPressed, style: style, child: _text());
  }

  Widget _imageButton() {
    final Widget widget = CustomImage(
      path: imagePath,
      url: imageURL,
      width: width ?? AppDecoration.minButtonWidth,
      height: height ?? AppDecoration.buttonHeightLarge,
    );

    if (onPressed != null) {
      return CustomClickableWidget(
        onTap: onPressed,
        child: widget,
      );
    }

    return widget;
  }

  Widget _text() {
    Widget widget = Text(text!);

    if (textAlignment != null) {
      widget = Align(alignment: textAlignment!, child: widget);
    }

    return widget;
  }
}
