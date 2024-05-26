import 'dart:async';

import 'package:flutter/material.dart';

class CustomMultipleTransition extends StatefulWidget {
  const CustomMultipleTransition({
    required this.children,
    this.duration,
    this.speedDuration,
    super.key,
  });

  final List<Widget> children;
  final Duration? duration;
  final Duration? speedDuration;

  @override
  State<CustomMultipleTransition> createState() =>
      _CustomMultipleTransitionState();
}

class _CustomMultipleTransitionState extends State<CustomMultipleTransition> {
  late Timer? _timer;
  late Widget _currentWidget;

  @override
  void initState() {
    _currentWidget = widget.children.first;
    super.initState();

    // Switch text every 2 seconds
    _timer = Timer.periodic(
      widget.duration ?? const Duration(milliseconds: 1500),
      (_) {
        if (mounted) {
          setState(() {
            _currentWidget = widget.children.elementAtOrNull(
                    widget.children.indexOf(_currentWidget) + 1) ??
                widget.children.first;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.speedDuration ?? const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: _currentWidget,
    );
  }
}
