import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ecommerce_clean/core/error/cache_exception.dart';
import 'package:ecommerce_clean/features/product/data/data_sources/local_data_source.dart';
import 'package:ecommerce_clean/features/product/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../helper/test_helper.mocks.dart';


void main() {
  late ProductLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = ProductLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  const testProductModel = ProductModel(
    id: "6672752cbd218790438efdb0",
    name: "Anime website",
    category: "Anime",
    description: "Explore anime characters.",
    price: 123,
    imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg"
    );
    const testProductModelList = [
      ProductModel(
        id: "6672752cbd218790438efdb0",
        name: "Anime website",
        category: "Anime",
        description: "Explore anime characters.",
        price: 123,
        imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg"
      ),
      ProductModel(
        id: "667275bab905525c145fe08f",
        name: "Anime website",
        category: "Anime",
        description: "Explore anime characters.",
        price: 123,
        imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777275/images/t7j2mqmcukrogvvausqj.jpg"
      ),
    ];

  group('getCacheAllProducts', () {
    final cachedProductsJson = json.encode(testProductModelList.map((product) => product.toJson()).toList());

    test('should return List<ProductModel> from SharedPreferences when there is cached data', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(cachedProductsJson);

      // act
      final result = await dataSource.getCacheAllProducts();

      // assert
      verify(mockSharedPreferences.getString(cachedProduct));
      expect(result, equals(testProductModelList));
    });

    test('should return empty list when there is no cached data', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);

      // act
      final result = await dataSource.getCacheAllProducts();

      // assert
      expect(result, equals([]));
    });
  });

  group('getCacheProduct', () {
    final cachedProductsJson = json.encode([testProductModel.toJson()]);

    test('should return ProductModel when there is cached data matching the ID', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(cachedProductsJson);

      // act
      final result = await dataSource.getCacheProduct(testProductModel.id);

      // assert
      verify(mockSharedPreferences.getString(cachedProduct));
      expect(result, equals(testProductModel));
    });

    test('should throw CacheException when there is no cached data matching the ID', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(cachedProductsJson);

      // act
      final call = dataSource.getCacheProduct;

      // assert
      expect(() => call('2'), throwsA(isA<CacheException>()));
    });
  });

  group('addCacheProduct', () {
    final cachedProductsJson = json.encode([testProductModel.toJson()]);

    test('should add a new product to the cached list', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn('[]');
      when(mockSharedPreferences.setString(any, any)).thenAnswer((_) async => true);

      // act
      await dataSource.addCacheProduct(productCache: testProductModel);

      // assert
      verify(mockSharedPreferences.setString(cachedProduct, cachedProductsJson));
    });

    test('should throw CacheException when unable to save data', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn('[]');
      when(mockSharedPreferences.setString(any, any)).thenAnswer((_) async => false);

      // act
      final call = dataSource.addCacheProduct;

      // assert
      expect(() => call(productCache: testProductModel), throwsA(isA<CacheException>()));
    });
  });

  group('deleteCacheProduct', () {
    final cachedProductsJson = json.encode([testProductModel.toJson()]);

    test('should delete the product from the cached list', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(cachedProductsJson);
      when(mockSharedPreferences.setString(any, any)).thenAnswer((_) async => true);

      // act
      await dataSource.deleteCacheProduct(testProductModel.id);

      // assert
      verify(mockSharedPreferences.setString(cachedProduct, '[]'));
    });
  });

  group('updateCacheProduct', () {
    const updatedProductModel = ProductModel(
      id: '6672752cbd218790438efdb0',
      name: 'Anime website',
      category: "Anime",
      description: "Explore anime characters.",
      price: 123,
      imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg"
      );
    final cachedProductsJson = json.encode([testProductModel.toJson()]);

    test('should update the product in the cached list', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(cachedProductsJson);
      when(mockSharedPreferences.setString(any, any)).thenAnswer((_) async => true);

      // act
      await dataSource.updateCacheProduct(productCache: updatedProductModel);

      // assert
      final updatedJson = json.encode([updatedProductModel.toJson()]);
      verify(mockSharedPreferences.setString(cachedProduct, updatedJson));
    });

    test('should throw CacheException when product is not found in the cached list', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn('[]');

      // act
      final call = dataSource.updateCacheProduct;

      // assert
      expect(() => call(productCache: updatedProductModel), throwsA(isA<CacheException>()));
    });
  });
}

