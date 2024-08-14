import 'dart:io';

import 'package:dartz/dartz.dart';
// import 'package:ecommerce_clean/core/constants/constants.dart';
import 'package:ecommerce_clean/core/error/exception.dart';
import 'package:ecommerce_clean/core/error/failure.dart';
import 'package:ecommerce_clean/features/product/data/data_sources/local_data_source.dart';
import 'package:ecommerce_clean/features/product/data/data_sources/remote_data_source.dart';
import 'package:ecommerce_clean/features/product/data/models/product_model.dart';
import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


class ProductRepositoryImpl extends ProductRepository{

  late final InternetConnectionChecker internetConnectionChecker;
  late final ProductRemoteDataSource productRemoteDataSource;
  late final ProductLocalDataSource productLocalDataSource;

  ProductRepositoryImpl({
    required this.productRemoteDataSource,
    required this.internetConnectionChecker,
    required this.productLocalDataSource,
  });
   
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProduct () async {
    if (await internetConnectionChecker.hasConnection){
      try { 
        final result = await productRemoteDataSource.getAllProduct();
        // await productLocalDataSource.cacheProduct(result);

        return Right(ProductModel.toEntityList(result));
      } on ServerException {
        return const Left(ServerFailure('An error has occured in the server'));
      } on SocketException{
        return const Left(ConnectionFailure('Failed to connect'));
      }
    } else{
      return const Left(ConnectionFailure('Failed to connect'));
    }  
  }

  @override
  Future<Either<Failure, ProductEntity>> getProduct (String id) async{
    if (await internetConnectionChecker.hasConnection){
      try {
        final result = await productRemoteDataSource.getProduct(id);
        return Right(result.toEntity());
      } on ServerException {
        return const Left(ServerFailure('An error has occured in the server'));
      } on SocketException{
        return const Left(ConnectionFailure('Failed to connect'));
      }
    } else{
      return const Left(ConnectionFailure('No internet connection'));
    }
  }
  
  @override
  Future<Either<Failure, void>> addProduct (ProductEntity product) async {
    if (await internetConnectionChecker.hasConnection){
      try {

        await productRemoteDataSource.addProduct(product as ProductModel);
        return const Right(unit);
      } on ServerException {
        return const Left(ServerFailure('An error has occured in the server'));
      } on SocketException{
        return const Left(ConnectionFailure('Failed to connect'));
      }
    } else{
      return const Left(ConnectionFailure('No internet connection'));
    }  
    
  }

  @override
  Future<Either<Failure, ProductEntity>> updateProduct (ProductEntity product) async {
    if (await internetConnectionChecker.hasConnection){
      try {
        final result = await productRemoteDataSource.updateProduct(product as ProductModel);
        return Right(result.toEntity());
      } on ServerException {
        return const Left(ServerFailure('An error has occured in the server'));
      } on SocketException{
        return const Left(ConnectionFailure('Failed to connect'));
      }
    } else {
      return const Left(ConnectionFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct (String id) async {
    if (await internetConnectionChecker.hasConnection){  
      try {
        await productRemoteDataSource.deleteProduct(id);
        return const Right(unit);
      } on ServerException {
        return const Left(ServerFailure('An error has occured in the server'));
      } on SocketException{
        return const Left(ConnectionFailure('Failed to connect'));
      }
    } else {
      return const Left(ConnectionFailure('No internet connection'));
    }
  }

  
}
