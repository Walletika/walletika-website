import 'content_lang.dart';

class TeamMemberModel {
  TeamMemberModel({
    required this.imageURL,
    required this.name,
    required this.description,
    this.telegram,
    this.twitter,
    this.linkedin,
    this.github,
  });

  final String imageURL;
  final String name;
  final ContentLanguageModel description;
  final String? telegram;
  final String? twitter;
  final String? linkedin;
  final String? github;

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) =>
      TeamMemberModel(
        imageURL: json["imageURL"] as String,
        name: json["name"] as String,
        description: ContentLanguageModel.fromJson(
          json["description"] as Map<String, dynamic>,
        ),
        telegram: json["telegram"],
        twitter: json["twitter"],
        linkedin: json["linkedin"],
        github: json["github"],
      );
}
