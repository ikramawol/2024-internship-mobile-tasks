import 'package:ecommerce_clean/features/product/domain/entities/product.dart';

class ProductModel extends ProductEntity{

  const ProductModel({
    required String id,
    required String name,
    required String catagory,
    required String description,
    required int price,
    required String imageUrl,
  }): super(
    id: id,
    name: name,
    catagory: catagory,
    description: description,
    price: price,
    imageUrl: imageUrl,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    catagory: json['catagory'] ?? '',
    description: json['description'] ?? '',
    // price: json['price'] ?? '',
    price: json['price'] is int
            ? json['price']
            : int.tryParse(json['price'].toString()) ?? 0,
    imageUrl: json['imageUrl'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "catagory": catagory,
    "description": description,
    "price": price,
    "imageUrl": imageUrl,
  };
}