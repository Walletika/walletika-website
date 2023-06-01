import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'drawer.dart';
import 'header.dart';
import 'footer.dart';

class CustomPage extends StatelessWidget {
  const CustomPage(this.sections, {super.key});

  final List<Widget> sections;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppDecoration.headerHeight),
        child: CustomHeader(),
      ),
      endDrawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(children: sections),
            const CustomFooterSection(),
          ],
        ),
      ),
    );
  }
}
