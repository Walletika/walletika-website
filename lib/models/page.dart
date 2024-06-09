import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageModel {
  PageModel({
    required this.visible,
    required this.name,
    required this.text,
    required this.widget,
    this.binding,
    this.isNew = false,
    this.isPinned = false,
  });

  final bool visible;
  final String name;
  final String text;
  final Widget Function() widget;
  final Bindings Function()? binding;
  final bool isNew;
  final bool isPinned;
}
