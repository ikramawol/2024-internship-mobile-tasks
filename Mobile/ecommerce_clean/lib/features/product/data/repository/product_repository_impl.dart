import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean/core/error/exception.dart';
import 'package:ecommerce_clean/core/error/failure.dart';
import 'package:ecommerce_clean/features/product/data/data_sources/remote_data_source.dart';
import 'package:ecommerce_clean/features/product/data/models/product_model.dart';
import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository{

  late final ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImpl({required this.productRemoteDataSource});
  
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProduct () async {
     try {
      final result = await productRemoteDataSource.getAllProduct();
      return Right(ProductModel.toEntityList(result));
    } on ServerException {
      return const Left(ServerFailure('An error has occured in the server'));
    } on SocketException{
      return const Left(ConnectionFailure('Failed to connect'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProduct (String id) async{
    try {
      final result = await productRemoteDataSource.getProduct(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occured in the server'));
    } on SocketException{
      return const Left(ConnectionFailure('Failed to connect'));
    }
  }
  
  @override
  Future<Either<Failure, void>> addProduct (ProductEntity product) async {
    try {
      await productRemoteDataSource.addProduct(product as ProductModel);
      return const Right(unit);
    } on ServerException {
      return const Left(ServerFailure('An error has occured in the server'));
    } on SocketException{
      return const Left(ConnectionFailure('Failed to connect'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> updateProduct (ProductEntity product) async {
    try {
      final result = await productRemoteDataSource.updateProduct(product as ProductModel);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occured in the server'));
    } on SocketException{
      return const Left(ConnectionFailure('Failed to connect'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct (String id) async {
    try {
      await productRemoteDataSource.deleteProduct(id);
      return const Right(unit);
    } on ServerException {
      return const Left(ServerFailure('An error has occured in the server'));
    } on SocketException{
      return const Left(ConnectionFailure('Failed to connect'));
    }
  }

  
}