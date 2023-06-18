import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../utils/constants.dart';
import 'button.dart';
import 'spacer.dart';
import 'text.dart';

enum ReactionType { frown, smile, happy }

class CustomReaction extends StatefulWidget {
  const CustomReaction({required this.title, super.key});

  final String title;

  @override
  State<CustomReaction> createState() => _CustomReactionState();
}

class _CustomReactionState extends State<CustomReaction> {
  ReactionType? _currentReaction;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;

    return Container(
      width: AppDecoration.docsPageWidth,
      padding: const EdgeInsets.all(AppDecoration.paddingBig),
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: BorderRadius.circular(AppDecoration.radiusBig),
      ),
      child: Column(
        children: [
          CustomText(text: widget.title),
          verticalSpace(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                onPressed: () => _reactionOnPressed(ReactionType.frown),
                type: ButtonType.icon,
                width: 100.0,
                icon: Icon(
                  LineIcons.frowningFace,
                  color: _reactionColor(ReactionType.frown),
                  size: AppDecoration.iconLargeSize,
                ),
              ),
              CustomButton(
                onPressed: () => _reactionOnPressed(ReactionType.smile),
                type: ButtonType.icon,
                width: 100.0,
                icon: Icon(
                  LineIcons.smilingFace,
                  color: _reactionColor(ReactionType.smile),
                  size: AppDecoration.iconLargeSize,
                ),
              ),
              CustomButton(
                onPressed: () => _reactionOnPressed(ReactionType.happy),
                type: ButtonType.icon,
                width: 100.0,
                icon: Icon(
                  LineIcons.laughFaceWithBeamingEyes,
                  color: _reactionColor(ReactionType.happy),
                  size: AppDecoration.iconLargeSize,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _reactionOnPressed(ReactionType reaction) {
    setState(() {
      if (_currentReaction == reaction) {
        _currentReaction = null;
      } else {
        _currentReaction = reaction;
      }
    });
  }

  Color? _reactionColor(ReactionType reaction) {
    if (reaction == _currentReaction) {
      switch (reaction) {
        case ReactionType.frown:
          return AppColors.red;
        case ReactionType.smile:
          return AppColors.orange;
        case ReactionType.happy:
          return AppColors.green;
      }
    }

    return null;
  }
}
