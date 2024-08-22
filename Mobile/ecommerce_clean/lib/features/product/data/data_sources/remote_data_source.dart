import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_clean/core/constants/constants.dart';
import 'package:ecommerce_clean/core/error/exception.dart';
import 'package:ecommerce_clean/features/product/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var headers = {
        'Authorization': "Bearer ${prefs.getString('auth_token')}",
        'Content-Type': 'application/json',
         };
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/products'),
    );
    request.headers.addAll(headers);
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
      var headers = {
        'Authorization': "Bearer ${prefs.getString('auth_token')}",
        'Content-Type': 'application/json',
         };
    final response = await client.delete(Uri.parse('${Urls.baseUrl}/$id', ), headers: headers);

    if (response.statusCode == 200 || response.statusCode == 204) {
      print("Product deleted successfully.");
    } else {
      throw Exception("Failed to delete product: ${response.reasonPhrase}");
    }
  }
  @override
  Future<List<ProductModel>> getAllProduct() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      var headers = {
        'Authorization': "Bearer ${prefs.getString('auth_token')}",
        'Content-Type': 'application/json',
         };
    final response = await client.get(Uri.parse(Urls.baseUrl), headers : headers);

    if (response.statusCode == 200){
      final Map<String, dynamic> decodedJson = json.decode(response.body);

      final List<dynamic> productList = decodedJson['data'];
      return productList.map((json) => ProductModel.fromJson(json)).toList();
    }
    throw ServerException();
  }
  
  @override
  Future<ProductModel> getProduct(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      var headers = {
        'Authorization': "Bearer ${prefs.getString('auth_token')}",
        'Content-Type': 'application/json',
         };

    final response = await client.get(Uri.parse('${Urls.baseUrl}/$id',), headers: headers);
    
    if (response.statusCode == 200){
      return ProductModel.fromJson(json.decode(response.body));
    }
    throw ServerException();
  }
   @override
  Future<ProductModel> updateProduct(product) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
      var headers = {
        'Authorization': "Bearer ${prefs.getString('auth_token')}",
        'Content-Type': 'application/json',
         };
    final response = await client.put(Uri.parse('${Urls.baseUrl}/${product.id}'),
        headers: headers,
        body: json.encode(
            {'name': product.name, 'description': product.description, 'price': product.price}));


  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body) as Map<String, dynamic>;
    final productData = jsonData['data'];
    return ProductModel.fromJson(productData);
  } else if (response.statusCode == 404) {
    throw Exception('Product with ID $product.id not found');
  } else {
    throw ServerException();
  }
}
}