import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean/features/product/domain/usecases/update_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:mockito/mockito.dart';
import '../../../../helper/test_helper.mocks.dart';


void main(){
  late UpdateProduct updateProduct;
  late MockProductRepository mockProductRepository;

  setUp((){
    mockProductRepository = MockProductRepository();
    updateProduct = UpdateProduct(mockProductRepository);
  });

  const testProductDetail = 
    ProductEntity(
    id: '1',
    name: 'Nike shoes',
    category: 'Men\'s',
    description: 'its a brand shoes',
    price: 100,
    imageUrl: 'image',
  );

  test(
    'should update product',
    ()async {
      //arrange
      when(
        mockProductRepository.updateProduct(testProductDetail)
        ).thenAnswer((_) async => const Right(testProductDetail));
      //act
      final result = await updateProduct.excecute(testProductDetail);
      //assert
      expect(result, const Right(testProductDetail));
      verify(mockProductRepository.updateProduct(testProductDetail));
      verifyNoMoreInteractions(mockProductRepository);
    }
  );
}

