import 'package:flutter/material.dart';

class PageModel {
  PageModel({
    required this.visible,
    required this.name,
    required this.text,
    required this.widget,
  });

  final bool visible;
  final String name;
  final String text;
  final Widget Function() widget;
}
