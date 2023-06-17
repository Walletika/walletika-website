import 'package:flutter/material.dart';

import '../widgets/page.dart';
import '../documents/main_section.dart';
import 'articles_section.dart';

class TopicView extends StatelessWidget {
  const TopicView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPage([
      MainDocsSection(),
      ArticlesSection(),
    ]);
  }
}
