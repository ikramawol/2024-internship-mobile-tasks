import 'dart:convert';

import 'package:ecommerce_clean/features/product/data/models/product_model.dart';
import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helper/json_reader.dart';
// import 'package:json_reader.dart';

void main(){

  // const testProductModel = ProductModel(
  //   id: '1',
  //   name: 'Nike Air Max',
  //   catagory: 'Men\'s shoes',
  //   description: 'its a shoe',
  //   price: 100,
  //   imageUrl: 'image',
  // );
  const testProductModel = ProductModel(
    id: '6672752cbd218790438efdb0',
    name: 'Anime website',
    catagory: 'Anime',
    description: 'Explore anime characters.',
    price: 123,
    imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg',
  );
  test(
    'should be subclass of Product Entity',
    () async {
      // assert
      expect(testProductModel, isA<ProductEntity>());
    }
  );
  test(
    'should return a valid model from json',
    () async {

    final Map<String, dynamic> jsonMap = json.decode(
        readJson('helper/dummy_data/dummy_product_response.json'),
        )['data'][0];
    // act

    final result = ProductModel.fromJson(jsonMap);
    

    // assert
    expect(result, equals(testProductModel));
  }
  );

  test(
    'should return a json map containing the proper data',
    () async {
      //act
      final result = testProductModel.toJson();
      //assert
      final expectedMap = {
        "id": "6672752cbd218790438efdb0",
        "name": "Anime website",
        "catagory": "Anime",
        "description": "Explore anime characters.",
        "price": 123,
        "imageUrl": "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg"
      };
      expect(result, expectedMap);
    }
  );
}