import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_markdown_selectionarea/flutter_markdown_selectionarea.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/darcula.dart';
import 'package:markdown/markdown.dart' as md;

import '../../controllers/documents.dart';
import '../../controllers/settings.dart';
import '../../models/article.dart';
import '../../models/topic.dart';
import '../../utils/constants.dart';
import '../../utils/launch_url.dart';
import '../../utils/time_calculator.dart';
import '../widgets/button.dart';
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
              _contentBuilder(context: context, article: article),
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

  Widget _contentBuilder({
    required BuildContext context,
    required ArticleModel article,
  }) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final String language = _settingsController.currentLanguage;

    return FutureBuilder(
      future: controller.fetchArticle(article.contentURL.translate(language)),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();

        return MarkdownBody(
          data: snapshot.data!,
          styleSheet: MarkdownStyleSheet.fromTheme(themeData).copyWith(
            blockquoteDecoration: BoxDecoration(
              color: colorScheme.tertiary,
              borderRadius: BorderRadius.circular(AppDecoration.radius),
            ),
          ),
          onTapLink: (text, href, title) {
            if (href != null) openNewTab(href);
          },
          builders: {
            'code': CodeElementBuilder(),
          },
        );
      },
    );
  }
}

class CodeElementBuilder extends MarkdownElementBuilder {
  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    String language = '';

    if (element.attributes['class'] != null) {
      language = element.attributes['class']!.substring(9);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDecoration.radius),
            child: HighlightView(
              element.textContent,
              language: language,
              theme: darculaTheme,
              padding: const EdgeInsets.all(AppDecoration.paddingMedium),
            ),
          ),
        ),
        horizontalSpace(AppDecoration.spaceSmall),
        CustomButton(
          onPressed: () {
            final data = ClipboardData(text: element.textContent);
            Clipboard.setData(data);
          },
          icon: const Icon(LineIcons.copy),
          tooltip: "1028@global".tr,
          type: ButtonType.icon,
          width: 40.0,
          height: 40.0,
        ),
      ],
    );
  }
}
