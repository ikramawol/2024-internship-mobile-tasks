import 'package:ecommerce_clean/features/product/domain/entities/product.dart';

class ProductModel extends ProductEntity{

  const ProductModel({
    required String id,
    required String name,
    String? category,
    required String description,
    required int price,
    String? imageUrl,
  }): super(
    id: id,
    name: name,
    category: category,
    description: description,
    price: price,
    imageUrl: imageUrl,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    category: json['category'],
    description: json['description'] ?? '',
    price: json['price'] is int
            ? json['price']
            : int.tryParse(json['price'].toString()) ?? 0,
    imageUrl: json['imageUrl'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category": category,
    "description": description,
    "price": price,
    "imageUrl": imageUrl,
  };

  ProductEntity toEntity() => ProductEntity(
    id: id,
    name: name,
    category: category,
    description: description,
    price: price,
    imageUrl: imageUrl,
  );

  static List<ProductEntity> toEntityList(List<ProductModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}