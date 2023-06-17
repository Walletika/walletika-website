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

  // Setter methods
  Future<void> fetchTopics() async {
    await fetchList(AppInfo.topicsAPI).then((topics) {
      _topics.value = topics.map((e) => TopicModel.fromJson(e)).toList();
    });
  }
}
