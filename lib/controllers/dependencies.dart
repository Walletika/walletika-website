import 'package:get/get.dart';

import 'documents.dart';
import 'download.dart';
import 'settings.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController(), permanent: true);
  }
}

class DocumentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DocumentsController(), permanent: true);
  }
}

class DownloadBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DownloadController(), permanent: true);
  }
}
