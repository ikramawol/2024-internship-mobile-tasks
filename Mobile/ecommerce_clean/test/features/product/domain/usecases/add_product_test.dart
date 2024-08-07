import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean/features/product/domain/entities/product.dart'; 
import 'package:ecommerce_clean/features/product/domain/usecases/add_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../helper/test_helper.mocks.dart';
// import 'package:ecommerce_clean/features/product/domain/usecases/add_product.dart';  



void main(){
  late AddProduct addProduct;
  late MockProductRepository mockProductRepository;

  setUp((){
    mockProductRepository = MockProductRepository();
    addProduct = AddProduct(mockProductRepository);
  });

  const testProductDetail = 
    ProductEntity(
      id: '1',
      name: 'Nike shoes',
      catagory: 'Men\'s',
      description: 'its a brand shoes',
      price: '100',
      image: 'image',
    );


  test(
    'should add product',
    () async{
      //aAnswerrrange
      when(
        mockProductRepository.addProduct(testProductDetail)
      ).thenAnswer((_) async => const Right(testProductDetail));
      // act
      final result = await addProduct.excecute(testProductDetail);
      //assert
      expect(result, const Right(testProductDetail));
      verify(mockProductRepository.addProduct(testProductDetail));
      verifyNoMoreInteractions(mockProductRepository);

    }
  );
}