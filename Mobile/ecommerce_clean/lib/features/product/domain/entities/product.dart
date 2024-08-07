import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  
  const ProductEntity({
    required this.id,
    required this.name, 
    required this.price, 
    required this.catagory, 
    required this.image, 
    required this.description,
  });

final String id;   
final String name;
final String price;
final String catagory;
final String image;
final String description;

@override
List<Object> get props => [
  id, 
  name,
  price,
  catagory,
  image,
  description,
  ];
}
