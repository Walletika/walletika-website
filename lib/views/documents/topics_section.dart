import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../controllers/documents.dart';
import '../../controllers/settings.dart';
import '../../models/topic.dart';
import '../../utils/constants.dart';
import '../widgets/clickable_widget.dart';
import '../widgets/section.dart';
import '../widgets/spacer.dart';
import '../widgets/text.dart';

class TopicsSection extends GetView<DocumentsController> {
  TopicsSection({super.key});

  final SettingsController _settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDecoration.paddingMedium,
        vertical: 70.0,
      ),
      children: [
        Obx(() {
          final List<TopicModel>? topics = controller.topics;

          if (topics == null) {
            return const CircularProgressIndicator();
          }

          return Column(
            children: [
              for (final TopicModel topic in topics)
                _topicBuilder(context: context, topic: topic)
            ],
          );
        }),
      ],
    );
  }

  Widget _topicBuilder({
    required BuildContext context,
    required TopicModel topic,
  }) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;
    final String language = _settingsController.currentLanguage;

    return CustomClickableWidget(
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
                        text: '${topic.articles.length} ${"1023@global".tr}',
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
    );
  }
}
