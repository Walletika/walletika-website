import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../utils/constants.dart';
import 'spacer.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.controller,
    this.initialValue,
    required this.placeholderText,
    this.prefixIcon,
    this.suffixIcon,
    this.showCounter = false,
    this.obscureText = false,
    this.enableIMEPersonalizedLearning = true,
    this.enableInteractiveSelection,
    this.maxLength = 64,
    this.readOnly = false,
    this.enabled = true,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.validator,
    this.children = const <Widget>[],
    this.focusNode,
    super.key,
  }) {
    focusNode = focusNode ?? FocusNode();
  }

  final TextEditingController controller;
  final String? initialValue;
  final String placeholderText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool showCounter;
  final bool obscureText;
  final bool enableIMEPersonalizedLearning;
  final bool? enableInteractiveSelection;
  final int maxLength;
  final bool readOnly;
  final bool enabled;
  final TextInputType? keyboardType;
  final String? Function(String? text)? validator;
  final void Function(String text)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String text)? onFieldSubmitted;
  final void Function(String? text)? onSaved;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final List<Widget> children;
  late FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          focusNode: focusNode,
          obscureText: obscureText,
          enableSuggestions: !obscureText,
          autocorrect: !obscureText,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
          enableInteractiveSelection: enableInteractiveSelection,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          readOnly: readOnly,
          enabled: enabled,
          style: textTheme.bodyMedium,
          decoration: InputDecoration(
            counter: showCounter ? null : zeroSpace(),
            prefixIcon: prefixIcon,
            label: Text(
              placeholderText,
              softWrap: false,
              overflow: AppDecoration.textOverflow,
            ),
            labelStyle: textTheme.bodyMedium!.copyWith(
              color: colorScheme.onInverseSurface,
            ),
            suffixIcon: suffixIcon,
            suffix: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  controller.clear();
                  focusNode?.unfocus();
                },
                child: const Icon(
                  LineIcons.times,
                  size: AppDecoration.iconSmallSize,
                ),
              ),
            ),
          ),
          onEditingComplete: () {
            if (onEditingComplete != null) onEditingComplete!();
            focusNode?.unfocus();
          },
          onFieldSubmitted: (text) {
            if (onFieldSubmitted != null) onFieldSubmitted!(text);
            focusNode?.unfocus();
          },
          onSaved: onSaved,
          onTap: onTap,
          onChanged: (text) {
            if (onChanged != null) onChanged!(text);
            if (text.isEmpty) {
              focusNode?.unfocus();
            }
          },
          validator: (text) {
            if (text != null && text.isEmpty) return "1000@warns".tr;
            if (validator != null) return validator!(text);
            return null;
          },
        ),
        ...children,
      ],
    );
  }
}
