import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean/core/error/failure.dart';
import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';


class GetProduct{
  final ProductRepository productRepository;
  GetProduct(this.productRepository);

  Future<Either<Failure, List<ProductEntity>>> excecute(String id){
    return productRepository.getProduct(id);
  }
}