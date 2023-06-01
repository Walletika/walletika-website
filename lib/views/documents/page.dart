import 'package:flutter/material.dart';

import '../widgets/page.dart';
import '../widgets/section.dart';

class DocumentsView extends StatelessWidget {
  const DocumentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPage([
      CustomSection(
        children: [
          Text('Documents Page'),
        ],
      ),
    ]);
  }
}
