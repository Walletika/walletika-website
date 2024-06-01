import 'dart:async';

import 'package:get/get.dart';

import '../models/round.dart';
import '../utils/constants.dart';
import '../utils/fetcher.dart';

class TokenomicsController extends GetxController {
  // States
  final Rxn<List<RoundModel>> _privateSale = Rxn<List<RoundModel>>();
  final Rxn<List<RoundModel>> _presale = Rxn<List<RoundModel>>();
  final List<String> acceptedNetworks = [
    'Ethereum (ERC20)',
    'BNB Smart Chain (BEP20)',
  ];

  // Events methods
  @override
  void onInit() {
    // Run once initialized
    _timerCallback();

    // Rerun every 60 sec
    Timer.periodic(const Duration(seconds: 60), _timerCallback);

    super.onInit();
  }

  // Getter methods
  List<RoundModel>? get privateSale => _privateSale.value;

  List<RoundModel>? get presale => _presale.value;

  // Setter methods
  void refetch() {
    _timerCallback();
  }

  Future<void> _timerCallback([Timer? timer]) async {
    await fetchMap(AppInfo.saleAPI).then((result) {
      // _privateSale.value = result["privateSale"]
      //     .map((e) => RoundModel.fromJson(e))
      //     .cast<RoundModel>()
      //     .toList();

      _presale.value = result["presale"]
          .map((e) => RoundModel.fromJson(e))
          .cast<RoundModel>()
          .toList();
    });
  }
}
