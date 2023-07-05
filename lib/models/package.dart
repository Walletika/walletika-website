enum PackageType { mobile, desktop }

class PackageModel {
  PackageModel({
    required this.packageType,
    required this.imageURL,
    this.packageURL,
  });

  final PackageType packageType;
  final String imageURL;
  final String? packageURL;

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
        packageType: json['packageType'] == 'mobile'
            ? PackageType.mobile
            : PackageType.desktop,
        imageURL: json['imageURL'],
        packageURL: json['packageURL'],
      );
}
