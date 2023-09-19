import 'package:get/get.dart';

import '../models/partner.dart';
import '../models/team_member.dart';
import '../utils/constants.dart';
import '../utils/fetcher.dart';

class HomeController extends GetxController {
  // States
  final Rxn<List<TeamMemberModel>> _teamMembers = Rxn<List<TeamMemberModel>>();
  final Rxn<List<PartnerModel>> _partners = Rxn<List<PartnerModel>>();

  // Events methods
  @override
  void onInit() {
    super.onInit();
    _fetch();
  }

  // Getter methods
  List<TeamMemberModel>? get teamMembers => _teamMembers.value;

  List<PartnerModel>? get partners => _partners.value;

  // Setter methods
  Future<void> _fetch() async {
    await fetchMap(AppInfo.homeAPI).then((result) {
      _teamMembers.value = result["teamMembers"]
          .map((e) => TeamMemberModel.fromJson(e))
          .cast<TeamMemberModel>()
          .toList();

      _partners.value = result["partners"]
          .map((e) => PartnerModel.fromJson(e))
          .cast<PartnerModel>()
          .toList();
    });
  }
}
