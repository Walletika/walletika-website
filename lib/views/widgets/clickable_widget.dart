import 'package:flutter/material.dart';

class CustomClickableWidget extends StatelessWidget {
  const CustomClickableWidget({
    required this.onTap,
    required this.child,
    super.key,
  });

  final void Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: SelectionContainer.disabled(child: child),
      ),
    );
  }
}
