import 'package:flutter/material.dart';

import '../widgets/page.dart';
import '../widgets/section.dart';

class TokenView extends StatelessWidget {
  const TokenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPage([
      CustomSection(
        children: [
          Text('Token Page'),
        ],
      ),
    ]);
  }
}
