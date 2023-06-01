import 'package:flutter/material.dart';

import '../widgets/page.dart';
import '../widgets/section.dart';

class DownloadView extends StatelessWidget {
  const DownloadView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPage([
      CustomSection(
        children: [
          Text('Download Page'),
        ],
      ),
    ]);
  }
}
