import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean/features/product/domain/usecases/get_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:mockito/mockito.dart';
import '../../../../helper/test_helper.mocks.dart';


void main(){
  late GetProduct getProduct;
  late MockProductRepository mockProductRepository;

  setUp((){
    mockProductRepository = MockProductRepository();
    getProduct = GetProduct(mockProductRepository);
  });

  const testProductDetail = [
    ProductEntity(
    id: '1',
    name: 'Nike shoes',
    catagory: 'Men\'s',
    description: 'its a brand shoes',
    price: '100',
    image: 'image',
  ),
  ProductEntity(
    id: '2',
    name: 'Adidas shoes',
    catagory: 'Men\'s',
    description: 'its a shoes brand',
    price: '100',
    image: 'image',
  )];

  for (var product in testProductDetail) {

    test(
      'should get the product by id',
      ()async {
        //arrange
        when(
          mockProductRepository.getProduct(product.id)
          ).thenAnswer((_) async => const Right(testProductDetail));
        //act
        final result = await getProduct.excecute(product.id);
        //assert
        expect(result, const Right(testProductDetail));
        verify(mockProductRepository.getProduct(product.id));
        verifyNoMoreInteractions(mockProductRepository);
      }
    );
  }
}

