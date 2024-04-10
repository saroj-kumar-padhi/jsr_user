class ThaliModel {
  final String thaliName;
  final String thaliImage;
  final String thaliPrice;
  final List<String> thaliItems;

  ThaliModel(
      {required this.thaliName,
      required this.thaliImage,
      required this.thaliPrice,
      required this.thaliItems});

  factory ThaliModel.fromJson(Map<String, dynamic> json) {
    String thaliName = json['thaliName'] ?? '';
    String thaliImage = json['thaliImage'] ?? '';
    String thaliPrice = json['thaliPrice'] ?? '';
    List<String> thaliItems = List<String>.from(json['thaliItems'] ?? []);

    return ThaliModel(
        thaliName: thaliName,
        thaliImage: thaliImage,
        thaliPrice: thaliPrice,
        thaliItems: thaliItems);
  }
}
