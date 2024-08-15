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
