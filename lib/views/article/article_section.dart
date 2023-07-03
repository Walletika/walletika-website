import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

import '../../controllers/documents.dart';
import '../../controllers/settings.dart';
import '../../models/article.dart';
import '../../models/topic.dart';
import '../../utils/constants.dart';
import '../../utils/launch_url.dart';
import '../../utils/time_calculator.dart';
import '../widgets/image.dart';
import '../widgets/page_line.dart';
import '../widgets/reaction.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class ArticleSection extends GetView<DocumentsController> {
  ArticleSection({super.key});

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
          final ArticleModel? article;

          try {
            topic = controller.topic;
            article = controller.article;
          } on Error {
            return const CustomImage(path: AppImages.pageNotFoundIllustrations);
          }

          if (topic == null || article == null) {
            return const CircularProgressIndicator();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _routerBuilder(context: context, topic: topic, article: article),
              verticalSpace(AppDecoration.spaceLarge),
              ..._articleBuilder(context: context, article: article),
              verticalSpace(AppDecoration.spaceLarge),
              _contentBuilder(article),
            ],
          );
        }),
        verticalSpace(80.0),
        CustomReaction(title: "1002@docs".tr),
      ],
    );
  }

  Widget _routerBuilder({
    required BuildContext context,
    required TopicModel topic,
    required ArticleModel article,
  }) {
    final String language = _settingsController.currentLanguage;

    return CustomPageLine(
      pages: {
        "1027@global".tr: () => Get.offNamed(AppPages.documents),
        topic.title.translate(language): () => Get.offNamed(topic.pageID),
        article.title.translate(language): null,
      },
      language: language,
    );
  }

  List<Widget> _articleBuilder({
    required BuildContext context,
    required ArticleModel article,
  }) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final String language = _settingsController.currentLanguage;

    return [
      CustomText(
        text: article.title.translate(language),
        style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
      ),
      verticalSpace(),
      Row(
        children: [
          CustomImage(
            padding: const EdgeInsets.all(AppDecoration.paddingSmall),
            path: article.imageURL == null ? AppImages.logo : null,
            url: article.imageURL,
            width: 50.0,
            height: 50.0,
            circled: article.imageURL != null,
          ),
          horizontalSpace(),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text:
                      '${"1024@global".tr} ${article.publisher ?? AppInfo.officialPublisher}',
                  style: textTheme.bodyMedium,
                ),
                CustomText(
                  text: timeAgo(time: article.updateDate, locale: language),
                  blueLightColor: true,
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    ];
  }

  Widget _contentBuilder(ArticleModel article) {
    final String language = _settingsController.currentLanguage;

    return FutureBuilder(
      future: controller.fetchArticle(article.contentURL.translate(language)),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();

        return MarkdownBody(
          data: snapshot.data!,
          selectable: true,
          onTapLink: (text, href, title) {
            if (href != null) openNewTab(href);
          },
        );
      },
    );
  }
}
