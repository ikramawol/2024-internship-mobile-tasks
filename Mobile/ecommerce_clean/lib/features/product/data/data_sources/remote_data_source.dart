import 'dart:convert';

import 'package:ecommerce_clean/core/constants/constants.dart';
import 'package:ecommerce_clean/core/error/exception.dart';
import 'package:ecommerce_clean/features/product/data/models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource{

  Future<ProductModel> getProduct(String id);
  Future<List<ProductModel>> getAllProduct();
  Future<void> addProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource{
  final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});
  
  @override
  Future<void> addProduct(ProductModel product) async {
    final response = await client.post(Uri.parse(Urls.baseUrl),
    headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(product.toJson()),
    );
    if (response.statusCode != 201){
      throw ServerException();
    }
  }
  
  @override
  Future<void> deleteProduct(String id) async {
    final response = await client.delete(Uri.parse('${Urls.baseUrl}/$id'));
    
    if (response.statusCode != 204){
      throw ServerException();
    }
  }
  
  @override
  Future<List<ProductModel>> getAllProduct() async {
    final response = await client.get(Uri.parse(Urls.baseUrl));

    if (response.statusCode == 200){
      final Map<String, dynamic> decodedJson = json.decode(response.body);

      final List<dynamic> productList = decodedJson['data'];
      return productList.map((json) => ProductModel.fromJson(json)).toList();
    }
    throw ServerException();
  }
  
  @override
  Future<ProductModel> getProduct(String id) async {
    final response = await client.get(Uri.parse('${Urls.baseUrl}/$id'));
    
    if (response.statusCode == 200){
      return ProductModel.fromJson(json.decode(response.body));
    }
    throw ServerException();
  }
  @override
  Future<ProductModel> updateProduct(ProductModel product)async {
    final response = await client.put(Uri.parse('${Urls.baseUrl}/${product.id}'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode(product.toJson()),
    );
    
    if (response.statusCode == 200){
      return ProductModel.fromJson(json.decode(response.body));
    }
    throw ServerException();
  }


  // @override
  // Future<ProductModel> updateProduct(ProductModel product)async {
  //   final productResponse = await client.get(
  //     Uri.parse('${Urls.baseUrl}/${product.id}'),
  //      headers: {
  //       'Content-Type': 'application/json',
  //     },
  //   );

  //   if (productResponse.statusCode != 200) {
  //     throw ServerException();
  //   }

  //   final productJson = json.decode(productResponse.body);
  //   final _product = ProductModel.fromJson(productJson);

  //   final updatedProduct = ProductModel(
  //     id: _product.id, 
  //     name: _product.name ?? _product.name,
  //     description: _product.description ?? _product.description,
  //     price: _product.price ?? _product.price,
  //     category: _product.category ?? _product.category,
  //     imageUrl: _product.imageUrl ?? _product.imageUrl,
  //   );

  //   final updateResponse = await client.put(
  //   Uri.parse('${Urls.baseUrl}/${updatedProduct.id}'),
  //   headers: {
  //       'Content-Type': 'application/json',
  //     },
  //   body: json.encode(updatedProduct.toJson()),
  // );

  //   if (updateResponse.statusCode == 200){
  //     return ProductModel.fromJson(json.decode(updateResponse.body));
  //   }
  //   throw ServerException();
  // }
  

}