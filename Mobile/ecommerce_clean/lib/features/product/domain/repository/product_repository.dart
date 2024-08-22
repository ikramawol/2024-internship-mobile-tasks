import 'dart:async';
import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
import 'package:ecommerce_clean/core/error/failure.dart';
import 'package:ecommerce_clean/features/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProduct();
  Future<Either<Failure, ProductEntity>> getProduct(String id);
  Future<Either<Failure, void>> addProduct(ProductEntity product);
  Future<Either<Failure, ProductEntity>> updateProduct(ProductEntity product);
  Future<Either<Failure, void>> deleteProduct(String id);
}
