class HeadPhonesDataModel{
  final String id;
  final String? name;
  final num? discountPrice;
  final num? price;
  final String? rating;
  final String? description;
  final String? imageUrl;

  HeadPhonesDataModel({
    required this.id,
    this.name,
    this.discountPrice,
    this.price,
    this.rating,
    this.description,
    this.imageUrl
  });
}