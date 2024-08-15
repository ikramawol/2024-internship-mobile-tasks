// import 'dart:ffi';

// import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean/features/product/domain/useCases/get_all_product.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:ecommerce_clean/features/product/domain/usecases/get_all_product.dart';
import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:mockito/mockito.dart';
import '../../../../helper/test_helper.mocks.dart';


void main(){
  late GetAllProduct getAllProduct;
  late MockProductRepository mockProductRepository;

  setUp((){
    mockProductRepository = MockProductRepository();
    getAllProduct = GetAllProduct(mockProductRepository);
  });
  const testProductDetail = [
    ProductEntity(
    id: '1',
    name: 'Nike shoes',
    category: 'Men\'s',
    description: 'its a brand shoes',
    price: 100,
    imageUrl: 'image',
  ),
  ProductEntity(
    id: '2',
    name: 'Adidas shoes',
    category: 'Men\'s',
    description: 'its a shoes brand',
    price: 100,
    imageUrl: 'image',
  )];

  // const testProductName = 'Nike shoes';
  test(
    'should get all the products available',
    () async{
      // arrange
      when(
        mockProductRepository.getAllProduct()
        ).thenAnswer((_) async => const Right(testProductDetail));
      // act
      final result = await getAllProduct.execute();
      // assert
      expect(result, const Right(testProductDetail));
      verify(mockProductRepository.getAllProduct());
      verifyNoMoreInteractions(mockProductRepository);
    }
  );
}