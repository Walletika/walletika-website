import 'package:get/get.dart';

import '../models/article.dart';
import '../models/topic.dart';
import '../utils/constants.dart';
import '../utils/fetcher.dart';

class DocumentsController extends GetxController {
  // States
  final Rxn<List<TopicModel>> _topics = Rxn<List<TopicModel>>();

  // Events methods
  @override
  void onInit() {
    super.onInit();
    fetchTopics();
  }

  // Getter methods
  List<TopicModel>? get topics => _topics.value;

  TopicModel? get topic {
    final String pageID =
        Get.currentRoute.toLowerCase().split('/').take(3).join('/');

    return _topics.value?.firstWhere((e) => e.pageID == pageID);
  }

  ArticleModel? get article {
    final String pageID =
        Get.currentRoute.toLowerCase().split('/').take(4).join('/');
    final TopicModel? topic_ = topic;

    return topic_?.articles.firstWhere((e) => e.pageID == pageID);
  }

  List<ArticleModel>? search(String value) {
    List<ArticleModel>? result;

    if (value.isNotEmpty) {
      value = value.toLowerCase();
      result ??= [];

      _topics.value?.forEach((topic) {
        for (final ArticleModel article in topic.articles) {
          if (article.title.en.toLowerCase().contains(value) ||
              article.title.ar.toLowerCase().contains(value)) {
            result!.add(article);
          }
        }
      });
    }

    return result;
  }

  // Setter methods
  Future<void> fetchTopics() async {
    await fetchList(AppInfo.topicsAPI).then((topics) {
      _topics.value = topics.map((e) => TopicModel.fromJson(e)).toList();
    });
  }

  Future<String> fetchArticle(String articleURL) {
    return fetchString(articleURL);
  }
}
