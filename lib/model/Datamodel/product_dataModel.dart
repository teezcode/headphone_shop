// class HeadPhonesDataModel{
//   final String id;
//   final String? name;
//   final num? discountPrice;
//   final num? price;
//   final String? rating;
//   final int? quantity;
//   final String? description;
//   final String? imageUrl;
//
//   HeadPhonesDataModel({
//     required this.id,
//     this.name,
//     this.discountPrice,
//     this.price,
//     this.rating,
//     this.quantity,
//     this.description,
//     this.imageUrl
//   });
// }

// To parse this JSON data, do
//
//     final headPhonesDataModel = headPhonesDataModelFromMap(jsonString);

import 'dart:convert';

HeadPhonesDataModel headPhonesDataModelFromMap(String str) => HeadPhonesDataModel.fromMap(json.decode(str));

String headPhonesDataModelToMap(HeadPhonesDataModel data) => json.encode(data.toMap());

class HeadPhonesDataModel {
  List<Product>? productLists;

  HeadPhonesDataModel({
    this.productLists,
  });

  HeadPhonesDataModel copyWith({
    List<Product>? productLists,
  }) =>
      HeadPhonesDataModel(
        productLists: productLists ?? this.productLists,
      );

  factory HeadPhonesDataModel.fromMap(Map<String, dynamic> json) => HeadPhonesDataModel(
    productLists: json["productLists"] == null ? [] : List<Product>.from(json["productLists"]!.map((x) => Product.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "productLists": productLists == null ? [] : List<dynamic>.from(productLists!.map((x) => x.toMap())),
  };
}

class Product {
  int? id;
  String? name;
  double? price;
  String? rating;
  int quantity;
  double? discountPrice;
  String? description;
  String? imageUrl;

  Product({
    this.id,
    this.name,
    this.price,
    this.rating,
    this.quantity = 0,
    this.discountPrice,
    this.description,
    this.imageUrl,
  });

  Product copyWith({
    int? id,
    String? name,
    double? price,
    String? rating,
    int? quantity = 0,
    double? discountPrice,
    String? description,
    String? imageUrl,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        rating: rating ?? this.rating,
        quantity: quantity ?? 0,
        discountPrice: discountPrice ?? this.discountPrice,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    price: json["price"]?.toDouble(),
    rating: json["rating"],
    quantity: 0,
    discountPrice: json["discountPrice"]?.toDouble(),
    description: json["description"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "price": price,
    "rating": rating,
    "quantity": quantity ,
    "discountPrice": discountPrice,
    "description": description,
    "imageUrl": imageUrl,
  };

  void increment() => quantity += 1;
  void decrement() => quantity -= 1;

}
