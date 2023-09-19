class PartnerModel {
  PartnerModel({
    required this.imageURL,
    required this.name,
  });

  final String imageURL;
  final String name;

  factory PartnerModel.fromJson(Map<String, dynamic> json) => PartnerModel(
        imageURL: json["imageURL"] as String,
        name: json["name"] as String,
      );
}
