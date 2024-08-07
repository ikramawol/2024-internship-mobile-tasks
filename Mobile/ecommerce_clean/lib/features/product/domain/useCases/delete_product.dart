import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean/core/error/failure.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';


class DeleteProduct{
  final ProductRepository productRepository;
  DeleteProduct(this.productRepository);

  Future<Either<Failure, void>> excecute(String id){
    return productRepository.deleteProduct(id);
  }
}