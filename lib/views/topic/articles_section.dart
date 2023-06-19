import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../controllers/documents.dart';
import '../../controllers/settings.dart';
import '../../models/article.dart';
import '../../models/topic.dart';
import '../../utils/constants.dart';
import '../widgets/button.dart';
import '../widgets/image.dart';
import '../widgets/page_line.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class ArticlesSection extends GetView<DocumentsController> {
  ArticlesSection({super.key});

  final SettingsController _settingsController = Get.find<SettingsController>();

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
          final TopicModel? topic;

          try {
            topic = controller.topic;
          } on Error {
            return const CustomImage(path: AppImages.pageNotFoundIllustrations);
          }

          if (topic == null) {
            return const CircularProgressIndicator();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _routerBuilder(context: context, topic: topic),
              verticalSpace(AppDecoration.spaceLarge),
              _topicBuilder(context: context, topic: topic),
              verticalSpace(AppDecoration.spaceLarge),
              _articlesBuilder(context: context, topic: topic),
            ],
          );
        }),
      ],
    );
  }

  Widget _routerBuilder({
    required BuildContext context,
    required TopicModel topic,
  }) {
    final String language = _settingsController.currentLanguage;

    return CustomPageLine(
      pages: {
        "1027@global".tr: () => Get.offNamed(AppPages.documents),
        topic.title.translate(language): null,
      },
      language: language,
    );
  }

  Widget _topicBuilder({
    required BuildContext context,
    required TopicModel topic,
  }) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final String language = _settingsController.currentLanguage;

    return Row(
      children: [
        Icon(
          LineIcons.byName(topic.icon),
          size: AppDecoration.iconBigSize,
        ),
        horizontalSpace(AppDecoration.spaceBig),
        Flexible(
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
                    text: '${topic.articles.length} ${"1023@global".tr}',
                    blueLightColor: true,
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _articlesBuilder({
    required BuildContext context,
    required TopicModel topic,
  }) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final String language = _settingsController.currentLanguage;

    return Container(
      padding: const EdgeInsets.all(AppDecoration.paddingMedium),
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        border: Border.all(color: colorScheme.tertiary),
        borderRadius: BorderRadius.circular(AppDecoration.radiusMedium),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final ArticleModel article in topic.articles)
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
        ],
      ),
    );
  }
}
