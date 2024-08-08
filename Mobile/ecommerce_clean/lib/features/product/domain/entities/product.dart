import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  
  const ProductEntity({
    required this.id,
    required this.name, 
    required this.catagory, 
    required this.description,
    required this.price, 
    required this.imageUrl, 
  });

final String id;   
final String name;
final String catagory;
final String description;
final int price;
final String imageUrl;

@override
List<Object> get props => [
  id, 
  name,
  catagory,
  description,
  price,
  imageUrl,
  ];
}
