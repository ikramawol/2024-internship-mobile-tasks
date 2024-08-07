import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean/core/error/failure.dart';
import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';

class UpdateProduct{
  final ProductRepository productRepository;
  UpdateProduct(this.productRepository);

  Future<Either<Failure, ProductEntity>> excecute(ProductEntity product){
    return productRepository.updateProduct(product);
  }
}