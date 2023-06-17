import '../utils/constants.dart';

class ContentLanguageModel {
  ContentLanguageModel({
    required this.en,
    required this.ar,
  });

  final String en;
  final String ar;

  String translate(String language) {
    switch (language) {
      case AppLanguages.ar:
        return ar;
      default:
        return en;
    }
  }

  factory ContentLanguageModel.fromJson(Map<String, dynamic> json) =>
      ContentLanguageModel(
        en: json['en'],
        ar: json['ar'],
      );
}
