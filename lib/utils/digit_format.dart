import 'dart:math';

import 'package:decimal/decimal.dart';

const Map<String, String> fiatCurrencies = {
  'usd': '\$',
  'eur': '€',
  'aed': 'د.إ',
  'aud': 'A\$',
  'cad': 'CA\$',
  'chf': '₣',
  'gbp': '£',
  'jpy': '¥',
  'rub': '₽',
  'sar': 'SR',
  'cny': 'CN¥',
  'nzd': 'NZ\$',
  'try': '₺',
  'btc': '฿',
};

String convertToFiatFormat({
  required Decimal? value,
  required String symbol,
  int? decimals,
  String nullFormat = '--',
}) {
  if (value == null) return nullFormat;

  int decimalPlaces = decimals ?? 8;

  if (decimals == null) {
    if (value >= Decimal.one) {
      decimalPlaces = 2;
    } else if (value >= Decimal.parse('0.01')) {
      decimalPlaces = 4;
    }
  }

  final String prefix = fiatCurrencies[symbol] ?? '';
  final String suffix = prefix.isEmpty ? ' ${symbol.toUpperCase()}' : '';

  return '$prefix${_format(value, decimalPlaces)}$suffix';
}

String convertToCoinFormat({
  required Decimal? value,
  required String symbol,
  int? decimals,
  String nullFormat = '--',
}) {
  if (value == null) return nullFormat;

  int decimalPlaces = decimals ?? 8;

  return '${_format(value, decimalPlaces)} $symbol';
}

String convertToIntFormat(int value) {
  return _commaFormat(value.toString());
}

String convertToPercentageFormat({
  required Decimal? value,
  bool showSymbol = true,
  String nullFormat = '--',
}) {
  if (value == null) return nullFormat;

  final bool isNegative = value.toDouble().isNegative;
  String symbol = showSymbol
      ? isNegative
          ? '-'
          : '+'
      : '';

  if (isNegative) {
    value = value * -1.toDecimal();
  }

  return '$symbol${_format(value, 2)}%';
}

String _format(Decimal value, int decimals, {bool comma = true}) {
  if (value < Decimal.parse('0.00000001')) return '0';

  final List<String> parts = value.toString().split('.');
  String firstPart = parts[0];
  String lastPart = parts.length > 1 ? parts[1] : '';

  if (comma && value >= 1000.toDecimal()) {
    firstPart = _commaFormat(firstPart);
  }

  lastPart = lastPart
      .substring(0, min(decimals, lastPart.length))
      .replaceAll(RegExp(r'0+$'), '');

  return lastPart.isEmpty ? firstPart : '$firstPart.$lastPart';
}

String _commaFormat(String value) {
  return value.replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (Match match) => '${match[1]},',
  );
}
