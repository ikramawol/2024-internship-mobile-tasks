import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}
final class LoadAllProductsEvent extends ProductEvent{
  const LoadAllProductsEvent();

  @override
  List<Object> get props => [];
}

final class GetSingleProductEvent  extends ProductEvent {
  final String productId;
  
  const GetSingleProductEvent({required this.productId});

  @override
  List<Object> get props => [productId];
}

final class UpdateProductEvent extends ProductEvent {

  final ProductEntity product;
  const UpdateProductEvent({required this.product});

  @override
  List<Object> get props => [product];
}

final class CreateProductEvent  extends ProductEvent {
  final ProductEntity newProduct;
  const CreateProductEvent({required this.newProduct});

  @override
  List<Object> get props => [newProduct];
}

final class DeleteProductEvent  extends ProductEvent {
  final String productId;
  const DeleteProductEvent({required this.productId});

  @override
  List<Object> get props => [productId];
}





