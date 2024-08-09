import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean/core/error/failure.dart';
import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';

class AddProduct{
  final ProductRepository productRepository;
  AddProduct(this.productRepository);

  Future<Either<Failure, void>> excecute(ProductEntity product){
    return productRepository.addProduct(product);
  }
}