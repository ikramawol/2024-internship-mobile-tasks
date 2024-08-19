import 'package:ecommerce_clean/features/product/data/models/product_model.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {

  ///Constructor
  const ProductEntity({
    required this.id,
    required this.name, 
    this.category, 
    required this.description,
    required this.price, 
    this.imageUrl,
  });

final String id;   
final String name;
final String? category;
final String description;
final int price;
final String? imageUrl;

ProductModel toModel(){
  return ProductModel(
    id: id,
    name: name,
    category: category,
    description: description,
    price: price,
    imageUrl: imageUrl,
    );
  }

@override
List<Object?> get props => [
  id, 
  name,
  category,
  description,
  price,
  imageUrl,
  ];

}
