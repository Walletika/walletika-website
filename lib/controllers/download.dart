import 'package:get/get.dart';

import '../models/package.dart';
import '../utils/constants.dart';
import '../utils/fetcher.dart';

class DownloadController extends GetxController {
  // States
  final Rxn<List<PackageModel>> _packages = Rxn<List<PackageModel>>();

  // Events methods
  @override
  void onInit() {
    super.onInit();
    _fetchPackages();
  }

  // Getter methods
  List<PackageModel>? get packages => _packages.value;

  // Setter methods
  Future<void> _fetchPackages() async {
    await fetchList(AppInfo.packagesAPI).then((packages) {
      _packages.value = packages.map((e) => PackageModel.fromJson(e)).toList();
    });
  }
}
