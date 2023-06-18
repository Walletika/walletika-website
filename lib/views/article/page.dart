import 'package:flutter/material.dart';

import '../widgets/page.dart';
import '../documents/main_section.dart';
import 'article_section.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPage([
      MainDocsSection(),
      ArticleSection(),
    ]);
  }
}
