import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../utils/constants.dart';
import '../widgets/clickable_widget.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class MainDocsSection extends StatelessWidget {
  MainDocsSection({super.key});

  final TextEditingController _searchController = TextEditingController(
    text: Get.parameters['search'],
  );
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    return CustomSection(
      stretch: true,
      height: 350.0,
      backgroundColor: colorScheme.primary,
      mainAxisAlignment: MainAxisAlignment.end,
      padding: const EdgeInsets.all(AppDecoration.paddingBig),
      children: [
        CustomText(
          text: "1000@docs".tr,
          textAlign: TextAlign.center,
          style: textTheme.displaySmall!.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpace(),
        CustomText(
          text: "1001@docs".tr,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium!.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w300,
          ),
        ),
        verticalSpace(AppDecoration.spaceMedium),
        TextFormField(
          controller: _searchController,
          focusNode: _focusNode,
          keyboardType: TextInputType.text,
          maxLength: 64,
          cursorColor: colorScheme.onPrimary,
          style: textTheme.bodyMedium!.copyWith(color: colorScheme.onPrimary),
          onEditingComplete: _onEditingComplete,
          decoration: InputDecoration(
            fillColor: colorScheme.onPrimary.withAlpha(40),
            constraints: const BoxConstraints(maxWidth: 600.0),
            contentPadding: const EdgeInsets.all(AppDecoration.paddingMedium),
            counter: zeroSpace(),
            prefixIcon: Icon(LineIcons.search, color: colorScheme.onPrimary),
            label: CustomText(
              text: "1022@global".tr,
              style: textTheme.bodyMedium!.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
            suffix: CustomClickableWidget(
              onTap: () {
                _searchController.clear();
                _focusNode.unfocus();
                _onEditingComplete();
              },
              child: Icon(
                LineIcons.times,
                color: colorScheme.onPrimary,
                size: AppDecoration.iconSmallSize,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onEditingComplete() {
    Map<String, String>? parameters;
    final String text = _searchController.text;

    if (text.isNotEmpty) {
      parameters = {'search': text};
    }

    Get.offNamed(
      AppPages.documents,
      preventDuplicates: false,
      parameters: parameters,
    );
  }
}
