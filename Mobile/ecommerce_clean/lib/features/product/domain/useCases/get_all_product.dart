import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean/core/error/failure.dart'; 
import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
// import 'package: ecommerce_clean/features/product/domain/usecases/get_all_product.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';  

class GetAllProduct{
  final ProductRepository productRepository;

  GetAllProduct(this.productRepository);

  Future<Either<Failure, List<ProductEntity>>> execute() {
    return productRepository.getAllProduct();
  }
  // call(String id) async {
    // return await repository.getAllProduct(id);
  // }
}