import '../utils/constants.dart';
import 'content_lang.dart';
import 'article.dart';

class TopicModel {
  TopicModel({
    required this.id,
    required this.icon,
    required this.title,
    required this.description,
    required this.articles,
  });

  final String id;
  final String icon;
  final ContentLanguageModel title;
  final ContentLanguageModel description;
  final List<ArticleModel> articles;

  String get pageID => '${AppPages.documents}/$id';

  factory TopicModel.fromJson(Map<String, dynamic> json) => TopicModel(
        id: json['id'],
        icon: json['icon'],
        title: ContentLanguageModel.fromJson(json['title']),
        description: ContentLanguageModel.fromJson(json['desc']),
        articles: (json['arts'] as List)
            .map((e) => ArticleModel.fromJson(topicID: json['id'], json: e))
            .toList(),
      );
}
