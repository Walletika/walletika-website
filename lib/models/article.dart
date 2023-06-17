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
    this.author,
  });

  final String topicID;
  final String id;
  final ContentLanguageModel title;
  final ContentLanguageModel contentURL;
  final int updateDate;
  final String? imageURL;
  final String? author;

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
        updateDate: json['date'],
        imageURL: json['image'],
        author: json['author'],
      );
}
