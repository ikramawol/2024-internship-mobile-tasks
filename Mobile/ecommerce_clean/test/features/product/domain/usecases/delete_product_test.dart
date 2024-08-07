import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean/features/product/domain/entities/product.dart'; 
import 'package:ecommerce_clean/features/product/domain/usecases/delete_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../helper/test_helper.mocks.dart';

void main(){
  late DeleteProduct deleteProduct;
  late MockProductRepository mockProductRepository;

  setUp((){
    mockProductRepository = MockProductRepository();
    deleteProduct = DeleteProduct(mockProductRepository);
  });

  const testProductDetail = 
    ProductEntity(
      id : '1',
      name: 'Nike shoes',
      catagory: 'Men\'s',
      description: 'its a brand shoes',
      price: '100',
      image: 'image',
    );
  
  test(
    'should delete product',
    ()async{
      //arange
      when(
        mockProductRepository.deleteProduct(testProductDetail.id)
      ).thenAnswer((_)async => const Right(testProductDetail));
      //act
      final result = await deleteProduct.excecute(testProductDetail.id);
      //assert
      expect(result, const Right(testProductDetail));
      verify(mockProductRepository.deleteProduct(testProductDetail.id));
      verifyNoMoreInteractions(mockProductRepository);
    }
  );
}
