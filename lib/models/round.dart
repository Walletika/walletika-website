class RoundModel {
  RoundModel({
    required this.startTime,
    required this.endTime,
    required this.tokens,
    required this.sold,
    required this.price,
    this.tokenSymbol = 'WLTK',
    this.priceSymbol = 'USD',
    this.url,
    this.address,
  });

  final DateTime startTime;
  final DateTime endTime;
  final int tokens;
  final int sold;
  final double price;
  final String tokenSymbol;
  final String priceSymbol;
  final String? url;
  final String? address;

  bool get isCompleted => sold >= tokens;

  double get progressValue => sold / tokens;

  int get progressPercent => (progressValue * 100).toInt();

  int get availableTokens => isCompleted ? 0 : tokens - sold;

  int get totalTokensCost => (tokens * price).toInt();

  int get soldTokensCost => (sold * price).toInt();

  int get availableTokensCost => (availableTokens * price).toInt();

  factory RoundModel.fromJson(Map<String, dynamic> json) => RoundModel(
        startTime: DateTime.fromMillisecondsSinceEpoch(
          json["startTime"] as int,
          isUtc: true,
        ),
        endTime: DateTime.fromMillisecondsSinceEpoch(
          json["endTime"] as int,
          isUtc: true,
        ),
        tokens: json["tokens"] as int,
        sold: json["sold"] as int,
        price: json["price"] as double,
        tokenSymbol: (json["tokenSymbol"] ?? 'WLTK') as String,
        priceSymbol: (json["priceSymbol"] ?? 'USD') as String,
        url: json["url"],
        address: json["address"],
      );
}
