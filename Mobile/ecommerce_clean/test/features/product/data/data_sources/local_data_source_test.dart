import 'dart:convert';
import 'package:ecommerce_clean/features/product/data/data_sources/local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ecommerce_clean/core/error/cache_exception.dart';
import 'package:ecommerce_clean/features/product/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../helper/test_helper.mocks.dart';
// import '../../../fixtures/fixture_reader.dart';  // You can use this to read a fixture file for mock data

void main() {

  late ProductLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = ProductLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('cacheProduct', () {
    const tProductModel = ProductModel(
      id: "6672752cbd218790438efdb0",
      name: "Anime website",
      catagory: "Anime",
      description: "Explore anime characters.",
      price: 123,
      imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg",
    );

    test('should call SharedPreferences to cache the data', () async {
      // arrange
      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((_) async => true);

      // act
      await dataSource.cacheProduct(productCache: tProductModel);

      // assert
      final expectedJsonString = json.encode(tProductModel.toJson());
      verify(mockSharedPreferences.setString(cachedProduct, expectedJsonString));
    });

    test('should throw a CacheException when caching null data', () {
      // act
      final call = dataSource.cacheProduct(productCache: null);

      // assert
      expect(() => call, throwsA(isA<CacheException>()));
    });
  });

  group('getLastProduct', () {
    const tProductModel = ProductModel(
      id: "6672752cbd218790438efdb0",
      name: "Anime website",
      catagory: "Anime",
      description: "Explore anime characters.",
      price: 123,
      imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg",
    );

    test('should return ProductModel from SharedPreferences when there is one in the cache', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(json.encode(tProductModel.toJson()));

      // act
      final result = await dataSource.getLastProduct();

      // assert
      verify(mockSharedPreferences.getString(cachedProduct));
      expect(result, equals(tProductModel));
    });

    test('should throw a CacheException when there is not a cached value', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);

      // act & assert
      expect(() => dataSource.getLastProduct(), throwsA(isA<CacheException>()));
    });
  });
}
