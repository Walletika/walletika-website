import 'package:get/get.dart';

import '../models/round.dart';
import '../utils/constants.dart';
import '../utils/fetcher.dart';

class TokenomicsController extends GetxController {
  // States
  final Rxn<List<RoundModel>> _privateSale = Rxn<List<RoundModel>>();
  final Rxn<List<RoundModel>> _presale = Rxn<List<RoundModel>>();
  final List<String> acceptedCoins = ['usdt', 'usdc'];
  final List<String> acceptedNetworks = [
    'Ethereum (ERC20)',
    'BNB Smart Chain (BEP20)',
  ];

  // Events methods
  @override
  void onInit() {
    super.onInit();
    _fetch();
  }

  // Getter methods
  List<RoundModel>? get privateSale => _privateSale.value;

  List<RoundModel>? get presale => _presale.value;

  // Setter methods
  void refetch() {
    _fetch();
  }

  Future<void> _fetch() async {
    await fetchMap(AppInfo.saleAPI).then((result) {
      _privateSale.value = result["privateSale"]
          .map((e) => RoundModel.fromJson(e))
          .cast<RoundModel>()
          .toList();

      _presale.value = result["presale"]
          .map((e) => RoundModel.fromJson(e))
          .cast<RoundModel>()
          .toList();
    });
  }
}
