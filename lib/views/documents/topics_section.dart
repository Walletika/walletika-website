import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../controllers/documents.dart';
import '../../controllers/settings.dart';
import '../../models/article.dart';
import '../../models/topic.dart';
import '../../utils/constants.dart';
import '../widgets/button.dart';
import '../widgets/clickable_widget.dart';
import '../widgets/image.dart';
import '../widgets/page_line.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class TopicsSection extends GetView<DocumentsController> {
  TopicsSection({super.key});

  final SettingsController _settingsController = Get.find<SettingsController>();
  final String _searchText = Get.parameters['search'] ?? '';

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      width: AppDecoration.docsPageWidth,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDecoration.paddingMedium,
        vertical: 70.0,
      ),
      children: [
        Obx(() {
          final List<TopicModel>? topics = controller.topics;

          if (topics == null) return const CircularProgressIndicator();

          final List<ArticleModel>? articlesSearch =
              controller.search(_searchText);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: articlesSearch == null
                ? _topicsBuilder(context: context, topics: topics)
                : _searchBuilder(context: context, articles: articlesSearch),
          );
        }),
      ],
    );
  }

  List<Widget> _topicsBuilder({
    required BuildContext context,
    required List<TopicModel> topics,
  }) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final String language = _settingsController.currentLanguage;

    return [
      for (final TopicModel topic in topics)
        CustomClickableWidget(
          onTap: () => Get.offNamed(topic.pageID),
          child: Container(
            margin: const EdgeInsets.only(bottom: AppDecoration.marginMedium),
            padding: const EdgeInsets.all(AppDecoration.paddingMedium),
            decoration: BoxDecoration(
              color: colorScheme.secondary,
              border: Border.all(color: colorScheme.tertiary),
              borderRadius: BorderRadius.circular(AppDecoration.radiusMedium),
            ),
            child: Row(
              children: [
                Icon(
                  LineIcons.byName(topic.icon),
                  size: AppDecoration.iconBigSize,
                ),
                horizontalSpace(AppDecoration.spaceBig),
                Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: topic.title.translate(language),
                        style: textTheme.titleMedium,
                      ),
                      CustomText(
                        text: topic.description.translate(language),
                        blueLightColor: true,
                        style: textTheme.bodyMedium,
                      ),
                      verticalSpace(),
                      Row(
                        children: [
                          const Icon(
                            LineIcons.readme,
                            size: AppDecoration.iconSmallSize,
                          ),
                          horizontalSpace(),
                          CustomText(
                            text:
                                '${topic.articles.length} ${"1023@global".tr}',
                            blueLightColor: true,
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  language == AppLanguages.en
                      ? LineIcons.angleRight
                      : LineIcons.angleLeft,
                ),
              ],
            ),
          ),
        )
    ];
  }

  List<Widget> _searchBuilder({
    required BuildContext context,
    required List<ArticleModel> articles,
  }) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final String language = _settingsController.currentLanguage;
    final bool hasData = articles.isNotEmpty;

    return [
      _routerBuilder(context),
      verticalSpace(AppDecoration.spaceLarge),
      CustomText(
        text: '${(hasData ? "1025@global" : "1026@global").tr} "$_searchText"',
        style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      verticalSpace(),
      CustomText(text: "1003@docs".tr, blueLightColor: true),
      verticalSpace(AppDecoration.spaceLarge),
      Container(
        padding: const EdgeInsets.all(AppDecoration.paddingMedium),
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          border: Border.all(color: colorScheme.tertiary),
          borderRadius: BorderRadius.circular(AppDecoration.radiusMedium),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: hasData
              ? [
                  for (final ArticleModel article in articles)
                    CustomButton(
                      onPressed: () => Get.offNamed(article.pageID),
                      icon: const Icon(
                        LineIcons.readme,
                        size: AppDecoration.iconSmallSize,
                      ),
                      text: article.title.translate(language),
                      textAlignment: language == AppLanguages.en
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      type: ButtonType.text,
                    )
                ]
              : [const CustomImage(path: AppImages.searchIllustrations)],
        ),
      ),
    ];
  }

  Widget _routerBuilder(BuildContext context) {
    final String language = _settingsController.currentLanguage;

    return CustomPageLine(
      pages: {
        "1027@global".tr: () => Get.offNamed(AppPages.documents),
        "1022@global".tr: null,
      },
      language: language,
    );
  }
}
