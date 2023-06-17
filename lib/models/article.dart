import '../utils/constants.dart';
import 'content_lang.dart';

class ArticleModel {
  ArticleModel({
    required this.topicID,
    required this.id,
    required this.title,
    required this.contentURL,
    required this.updateDate,
    this.imageURL,
    this.publisher,
  });

  final String topicID;
  final String id;
  final ContentLanguageModel title;
  final ContentLanguageModel contentURL;
  final DateTime updateDate;
  final String? imageURL;
  final String? publisher;

  String get pageID => '${AppPages.documents}/$topicID/$id';

  factory ArticleModel.fromJson({
    required String topicID,
    required Map<String, dynamic> json,
  }) =>
      ArticleModel(
        topicID: topicID,
        id: json['id'],
        title: ContentLanguageModel.fromJson(json['title']),
        contentURL: ContentLanguageModel.fromJson(json['content']),
        updateDate: DateTime.fromMillisecondsSinceEpoch(json['date']),
        imageURL: json['image'],
        publisher: json['publisher'],
      );
}
