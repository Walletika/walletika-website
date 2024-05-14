import 'dart:math';

class RoundModel {
  RoundModel({
    required this.startTime,
    // required this.endTime,
    required this.tokens,
    required this.sold,
    required this.price,
    this.tokenSymbol = 'WLTK',
    this.priceSymbol = 'USD',
    this.url,
    this.addresses,
    required List<Map<String, dynamic>> offers,
  }) {
    for (int index = 0; index < offers.length; index++) {
      endTime = DateTime.fromMillisecondsSinceEpoch(
        offers[index]["endTime"],
        isUtc: true,
      );
      currentPrice = nextPrice = offers[index]["price"];

      if (currentUTCTime.isBefore(endTime)) {
        try {
          nextPrice = offers[index + 1]["price"];
        } catch (_) {}

        break;
      }
    }
  }

  final DateTime startTime;
  // final DateTime endTime;
  final int tokens;
  final int sold;
  final double price;
  final String tokenSymbol;
  final String priceSymbol;
  final String? url;
  final List<String>? addresses;

  late DateTime endTime;
  late double currentPrice;
  late double nextPrice;

  bool get isUpcoming => !isCompleted && currentUTCTime.isBefore(startTime);

  bool get isLive =>
      !isCompleted && !isUpcoming && currentUTCTime.isBefore(endTime);

  bool get isCompleted => sold >= tokens;

  bool get isLastChance => currentPrice == nextPrice;

  double get progressValue => sold / tokens;

  int get progressPercent => (progressValue * 100).toInt();

  int get availableTokens => isCompleted ? 0 : tokens - sold;

  int get totalTokensCost => (tokens * price).toInt();

  int get soldTokensCost => (sold * price).toInt();

  int get availableTokensCost => (availableTokens * currentPrice).toInt();

  DateTime get currentUTCTime => DateTime.now().toUtc();

  String? get address {
    return addresses?[Random().nextInt(addresses!.length)];
  }

  factory RoundModel.fromJson(Map<String, dynamic> json) => RoundModel(
        startTime: DateTime.fromMillisecondsSinceEpoch(
          json["startTime"] as int,
          isUtc: true,
        ),
        // endTime: DateTime.fromMillisecondsSinceEpoch(
        //   json["endTime"] as int,
        //   isUtc: true,
        // ),
        tokens: json["tokens"] as int,
        sold: json["sold"] as int,
        price: json["price"] as double,
        tokenSymbol: (json["tokenSymbol"] ?? 'WLTK') as String,
        priceSymbol: (json["priceSymbol"] ?? 'USD') as String,
        url: json["url"],
        addresses: json["addresses"].cast<String>(),
        offers: json["offers"].cast<Map<String, dynamic>>(),
      );
}
