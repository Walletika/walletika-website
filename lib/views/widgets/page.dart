import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:walletika_website/controllers/settings.dart';

import '../../utils/constants.dart';
import 'drawer.dart';
import 'header.dart';
import 'footer.dart';
import 'spacer.dart';

class CustomPage extends GetView<SettingsController> {
  CustomPage(this.sections, {super.key}) {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _scrollController.addListener(
      () => controller.pageScrollableUpdate(_scrollController),
    );
  }

  final List<Widget> sections;
  final ScrollController _scrollController = ScrollController();
  static GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppDecoration.headerHeight),
        child: CustomHeader(),
      ),
      endDrawer: const CustomDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: SelectionArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(children: sections),
              CustomFooterSection(),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(() {
        if (!controller.scrollable) return zeroSpace();

        return FloatingActionButton(
          onPressed: () => _scrollController.animateTo(
            0.0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
          ),
          child: const Icon(LineIcons.angleUp),
        );
      }),
    );
  }
}
