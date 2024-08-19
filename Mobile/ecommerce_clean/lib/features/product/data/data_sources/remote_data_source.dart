import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_clean/core/constants/constants.dart';
import 'package:ecommerce_clean/core/error/exception.dart';
import 'package:ecommerce_clean/features/product/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

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
    try {
    File imageFile = File(product.imageUrl!);
      List<int> imageBytes = await imageFile.readAsBytes();

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
    );

    request.fields.addAll({
      'name': product.name,
      'description': product.description,
      'price': product.price.toString(),
    });

    request.files.add(http.MultipartFile.fromBytes(
      'image',
      imageBytes,
      filename: 'fg.jpg',
      contentType: MediaType('image', 'jpeg'),
    ));

    http.StreamedResponse response = await request.send();

    print('Response code: ${response.statusCode}');

    if (response.statusCode == 201) {
      print('Success: ${await response.stream.bytesToString()}');
    } else {
      print('Failed: ${response.reasonPhrase}');
    }
  } catch (e) {
    print('Error during addProduct: $e');
  }
}
  @override
  Future<void> deleteProduct(String id) async {
    final response = await client.delete(Uri.parse('${Urls.baseUrl}/$id'));

    if (response.statusCode == 200 || response.statusCode == 204) {
      print("Product deleted successfully.");
    } else {
      throw Exception("Failed to delete product: ${response.reasonPhrase}");
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
  Future<ProductModel> updateProduct(ProductModel product) async {
    try {
      var request = http.MultipartRequest(
        'PUT',
        Uri.parse('${Urls.baseUrl}/${product.id}'),
      );

      request.fields.addAll({
        'name': product.name,
        'description': product.description,
        'price': product.price.toString(),
      });   

      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        return ProductModel.fromJson(json.decode(responseBody));
      } else {
        throw Exception('Failed to update product: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error during updateProduct: $e');
    }
  }
}