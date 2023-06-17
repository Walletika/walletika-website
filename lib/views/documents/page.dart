import 'package:flutter/material.dart';

import '../widgets/page.dart';
import 'main_section.dart';
import 'topics_section.dart';

class DocumentsView extends StatelessWidget {
  const DocumentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPage([
      MainDocsSection(),
      TopicsSection(),
    ]);
  }
}
