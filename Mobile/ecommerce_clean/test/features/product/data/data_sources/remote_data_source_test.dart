import 'dart:convert';

import 'package:ecommerce_clean/core/constants/constants.dart';
import 'package:ecommerce_clean/core/error/exception.dart';
import 'package:ecommerce_clean/features/product/data/data_sources/remote_data_source.dart';
import 'package:ecommerce_clean/features/product/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import '../../../../helper/json_reader.dart';
import '../../../../helper/test_helper.mocks.dart';

void main(){
  late MockHttpClient mockHttpClient;
  late ProductRemoteDataSourceImpl productRemoteDataSourceImpl;

  setUp((){
    mockHttpClient = MockHttpClient();
    productRemoteDataSourceImpl = ProductRemoteDataSourceImpl(client: mockHttpClient);
  });
const testId = "6672752cbd218790438efdb0";

const testProduct = ProductModel(
  id: "6672752cbd218790438efdb0",
  name: "Anime website",
  category: "Anime",
  description: "Explore anime characters.",
  price: 123,
  imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg",
);
  group('get current Product',(){
    test(
      'should return product when the response code is 200',
      ()async{

        when(mockHttpClient.get(Uri.parse('${Urls.baseUrl}/$testId'))
        ).thenAnswer((_)async => http.Response(
          readJson('helper/dummy_data/dummy_product_response.json'), 200)
          );

          final result = await productRemoteDataSourceImpl.getProduct(testId);

          expect(result, isA<ProductModel>());   
      }
    );

    test(
      'should throw a server exception when the response code is 404 or other',
      ()async{

        when(mockHttpClient.get(Uri.parse('${Urls.baseUrl}/$testId'))
        ).thenAnswer((_)async => http.Response(
          'Not Found', 404)
          );
 
          expect(() async => await productRemoteDataSourceImpl.getProduct(testId),
            throwsA(isA<ServerException>()));  
      }
    );
  });


  group('get all Product',(){
  test(
    'should return products when the response code is 200',
    ()async{

      when(mockHttpClient.get(Uri.parse(Urls.baseUrl))
      ).thenAnswer((_)async => http.Response(
        readJson('helper/dummy_data/dummy_product_response.json'), 200)
        );

        final result = await productRemoteDataSourceImpl.getAllProduct();

        expect(result, isA<List<ProductModel>>()); 
        expect(result.length, greaterThan(0));
    }
  );

  test(
    'should throw a server exception when the response code is 404 or other',
    ()async{

      when(mockHttpClient.get(Uri.parse('${Urls.baseUrl}/$testId'))
      ).thenAnswer((_)async => http.Response(
        'Not Found', 404)
        );

        expect(() async => await productRemoteDataSourceImpl.getProduct(testId),
          throwsA(isA<ServerException>()));  
    });
  });

  group('add Product',(){
  test(
    'should add product successfully when the response code is 201',
    ()async{
   
    when(mockHttpClient.post(Uri.parse(Urls.baseUrl),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(testProduct.toJson()),
    )).thenAnswer((_)async => http.Response('Created', 201));          
      
    await productRemoteDataSourceImpl.addProduct(testProduct);

    });

  test(
    'should throw a server exception when the response code is 404 or other',
    ()async{

      when(mockHttpClient.post(Uri.parse(Urls.baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(testProduct.toJson()),)
      ).thenAnswer((_)async => http.Response(
        'Bad Request', 400));

        expect(() async => await productRemoteDataSourceImpl.addProduct(testProduct),
          throwsA(isA<ServerException>()));  
    });
  });

  group('update Product',(){
  test(
    'should update product successfully when the response code is 200',
    ()async{
      final jsonResponse = {
        "id": testProduct.id,
        "name": testProduct.name,
        "category": testProduct.category,
        "description": testProduct.description,
        "price": testProduct.price,
        "imageUrl": testProduct.imageUrl
      };

      final jsonString = json.encode(jsonResponse);
      when(mockHttpClient.put(Uri.parse('${Urls.baseUrl}/${testProduct.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(testProduct.toJson()),
      )
      ).thenAnswer((_)async => http.Response(jsonString, 200));          
      final result = await productRemoteDataSourceImpl.updateProduct(testProduct);

      expect(result, isA<ProductModel>());
      // await productRemoteDataSourceImpl.updateProduct(testProduct);
    }
  );


  test(
    'should throw a server exception when the response code is not 200',
    ()async{

      when(mockHttpClient.put(Uri.parse('${Urls.baseUrl}/${testProduct.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(testProduct.toJson()),)
      ).thenAnswer((_)async => http.Response(
        'Not Found', 404));

        expect(() async => await productRemoteDataSourceImpl.updateProduct(testProduct),
          throwsA(isA<ServerException>()));  
    });
  });

  group('delete Product',(){
  test(
    'should delete product successfully when the response code is 204',
    ()async{

      when(mockHttpClient.delete(Uri.parse('${Urls.baseUrl}/$testId'))
      ).thenAnswer((_)async => http.Response('deleted', 204));          
        
      await productRemoteDataSourceImpl.deleteProduct(testId);

    }
  );

  test(
    'should throw a server exception when the response code is not 204',
    ()async{

      when(mockHttpClient.delete(Uri.parse('${Urls.baseUrl}/$testId'))
      ).thenAnswer((_)async => http.Response(
        'Not Found', 404));

        expect(() async => await productRemoteDataSourceImpl.deleteProduct(testId),
          throwsA(isA<ServerException>()));  
    });
  });

}




