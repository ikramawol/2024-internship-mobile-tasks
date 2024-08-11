import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean/core/error/exception.dart';
import 'package:ecommerce_clean/core/error/failure.dart';
import 'package:ecommerce_clean/features/product/data/models/product_model.dart';
import 'package:ecommerce_clean/features/product/data/repository/product_repository_impl.dart';
import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/test_helper.mocks.dart';


void main(){
  late MockProductRemoteDataSource mockProductRemoteDataSource;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  late ProductRepositoryImpl productRepositoryImpl;

  setUp((){
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    productRepositoryImpl = ProductRepositoryImpl(
      productRemoteDataSource: mockProductRemoteDataSource,
      internetConnectionChecker: mockInternetConnectionChecker,

    );
  });

  const testProductModel = ProductModel(
    id: "6672752cbd218790438efdb0",
    name: "Anime website",
    catagory: "Anime",
    description: "Explore anime characters.",
    price: 123,
    imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg",
  );

  const testProductEntity = ProductEntity(
    id: "6672752cbd218790438efdb0",
    name: "Anime website",
    catagory: "Anime",
    description: "Explore anime characters.",
    price: 123,
    imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg",
  );

  const testId = '6672752cbd218790438efdb0';
  /// Get product
  group('get current product', (){
    test(
      'shoud return current product when a call to data source is successful',
      () async {

        when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
        when(mockProductRemoteDataSource.getProduct(testId))
        .thenAnswer((_) async => testProductModel,);

        final result = await productRepositoryImpl.getProduct(testId);

        expect(result, equals(const Right(testProductEntity)));
        verify(mockInternetConnectionChecker.hasConnection);
        verify(mockProductRemoteDataSource.getProduct(testId));
        verifyNoMoreInteractions(mockProductRemoteDataSource);
      }

    );

    test(
      'should return a ServerFailure when a call to data source fails with a server error',
      () async {
        when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
        when(mockProductRemoteDataSource.getProduct(testId))
        .thenThrow((ServerException()));

        final result = await productRepositoryImpl.getProduct(testId);

        expect(result, const Left(ServerFailure('An error has occured in the server')));
        verify(mockProductRemoteDataSource.getProduct(testId));
        verifyNoMoreInteractions(mockProductRemoteDataSource);
      }

    );

    test(
      'should return a NetworkFailure when a call to data source fails with a network error',
      () async {
        when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
        when(mockProductRemoteDataSource.getProduct(testId))
        .thenThrow((const SocketException('Failed to connect to the network')));

        final result = await productRepositoryImpl.getProduct(testId);

        expect(result, const Left(ConnectionFailure('Failed to connect')));
        verify(mockProductRemoteDataSource.getProduct(testId));
        verifyNoMoreInteractions(mockProductRemoteDataSource);
      }
    );
  });

///Get all products
  group('get all product', (){
    test(
      'shoud return all product when a call to data source is successful',
      () async {
        when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
        when(mockProductRemoteDataSource.getAllProduct())
        .thenAnswer((_) async => [testProductModel]);

        final result = await productRepositoryImpl.getAllProduct();

        final productFromRepository = result.fold(
          (failure) => null,
          (product) => product,
        );

        expect(productFromRepository, equals(([testProductEntity])));
        verify(mockProductRemoteDataSource.getAllProduct());
        verifyNoMoreInteractions(mockProductRemoteDataSource);
      }

    );

    test(
      'should return a ServerFailure when a call to data source fails with a server error',
      () async {
        when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
        when(mockProductRemoteDataSource.getAllProduct())
        .thenThrow((ServerException()));

        final result = await productRepositoryImpl.getAllProduct();

        expect(result, const Left(ServerFailure('An error has occured in the server')));
        verify(mockProductRemoteDataSource.getAllProduct());
        verifyNoMoreInteractions(mockProductRemoteDataSource);
      }

    );

    test(
      'should return a NetworkFailure when a call to data source fails with a network error',
      () async {
        when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
        when(mockProductRemoteDataSource.getAllProduct())
        .thenThrow((const SocketException('Failed to connect to the network')));

        final result = await productRepositoryImpl.getAllProduct();

        expect(result, const Left(ConnectionFailure('Failed to connect')));
        verify(mockProductRemoteDataSource.getAllProduct());
        verifyNoMoreInteractions(mockProductRemoteDataSource);
      }
    );
  });

///Add product
  group('add product', (){
    test(
      'shoud return current product when a call to data source is successful',
      () async {

        when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
        when(mockProductRemoteDataSource.addProduct(testProductModel))
        .thenAnswer((_) async => testProductModel);

        final result = await productRepositoryImpl.addProduct(testProductModel);

        expect(result, equals(const Right(unit)));
        verify(mockProductRemoteDataSource.addProduct(testProductModel));
        verifyNoMoreInteractions(mockProductRemoteDataSource);
      }

    );

    test(
      'should return a ServerFailure when a call to data source fails with a server error',
      () async {

        when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
        when(mockProductRemoteDataSource.addProduct(testProductModel))
        .thenThrow((ServerException()));

        final result = await productRepositoryImpl.addProduct(testProductModel);

        expect(result, const Left(ServerFailure('An error has occured in the server')));
        verify(mockProductRemoteDataSource.addProduct(testProductModel));
        verifyNoMoreInteractions(mockProductRemoteDataSource);
      }

    );

    test(
      'should return a NetworkFailure when a call to data source fails with a network error',
      () async {

        when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
        when(mockProductRemoteDataSource.addProduct(testProductModel))
        .thenThrow((const SocketException('Failed to connect to the network')));

        final result = await productRepositoryImpl.addProduct(testProductModel);

        expect(result, const Left(ConnectionFailure('Failed to connect')));
        verify(mockProductRemoteDataSource.addProduct(testProductModel));
        verifyNoMoreInteractions(mockProductRemoteDataSource);
      }
    );
  });


///Update product
  group('update product', (){
    test(
      'shoud return current product when a call to data source is successful',
      () async {
        when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
        when(mockProductRemoteDataSource.updateProduct(testProductModel))
        .thenAnswer((_) async => testProductModel);

        final result = await productRepositoryImpl.updateProduct(testProductModel);

        expect(result, equals(const Right(testProductEntity)));
        verify(mockProductRemoteDataSource.updateProduct(testProductModel));
        verifyNoMoreInteractions(mockProductRemoteDataSource);
      }

    );

    test(
      'should return a ServerFailure when a call to data source fails with a server error',
      () async {
        when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
        when(mockProductRemoteDataSource.updateProduct(testProductModel))
        .thenThrow((ServerException()));

        final result = await productRepositoryImpl.updateProduct(testProductModel);

        expect(result, const Left(ServerFailure('An error has occured in the server')));
        verify(mockProductRemoteDataSource.updateProduct(testProductModel));
        verifyNoMoreInteractions(mockProductRemoteDataSource);
      }

    );

    test(
      'should return a NetworkFailure when a call to data source fails with a network error',
      () async {
        when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
        when(mockProductRemoteDataSource.updateProduct(testProductModel))
        .thenThrow((const SocketException('Failed to connect to the network')));

        final result = await productRepositoryImpl.updateProduct(testProductModel);

        expect(result, const Left(ConnectionFailure('Failed to connect')));
        verify(mockProductRemoteDataSource.updateProduct(testProductModel));
        verifyNoMoreInteractions(mockProductRemoteDataSource);
      }
    );
  });

// delete product
  group('get current product', (){
    test(
      'shoud return current product when a call to data source is successful',
      () async {
        when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
        when(mockProductRemoteDataSource.deleteProduct(testId))
        .thenAnswer((_) async => testProductModel);

        final result = await productRepositoryImpl.deleteProduct(testId);

        expect(result, equals(const Right(unit)));
        verify(mockInternetConnectionChecker.hasConnection);
        verify(mockProductRemoteDataSource.deleteProduct(testId));
        verifyNoMoreInteractions(mockProductRemoteDataSource);
      }

    );

    test(
      'should return a ServerFailure when a call to data source fails with a server error',
      () async {

        when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
        when(mockProductRemoteDataSource.deleteProduct(testId))
        .thenThrow((ServerException()));

        final result = await productRepositoryImpl.deleteProduct(testId);

        expect(result, const Left(ServerFailure('An error has occured in the server')));
        verify(mockProductRemoteDataSource.deleteProduct(testId));
        verify(mockInternetConnectionChecker.hasConnection);
        verifyNoMoreInteractions(mockProductRemoteDataSource);
      }

    );

    test(
      'should return a NetworkFailure when a call to data source fails with a network error',
      () async {
        when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);
        when(mockProductRemoteDataSource.deleteProduct(testId))
        .thenThrow((const SocketException('Failed to connect to the network')));

        final result = await productRepositoryImpl.deleteProduct(testId);

        expect(result, const Left(ConnectionFailure('Failed to connect')));
        verify(mockProductRemoteDataSource.deleteProduct(testId));
        verifyNoMoreInteractions(mockProductRemoteDataSource);
      }
    );
  });

}