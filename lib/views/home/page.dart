import 'package:flutter/material.dart';

import '../widgets/page.dart';
import '../widgets/section.dart';
import 'main_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPage([
      MainSection(),
      CustomSection(
        children: [],
      ),
    ]);
  }
}
