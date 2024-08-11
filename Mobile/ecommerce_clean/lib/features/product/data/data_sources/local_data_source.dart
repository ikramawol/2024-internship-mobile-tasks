import 'dart:convert';

import 'package:ecommerce_clean/core/error/cache_exception.dart';
import 'package:ecommerce_clean/features/product/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<void> cacheProduct({required ProductModel? productCache});
  Future<ProductModel> getLastProduct();
}
const cachedProduct = 'CACHED_PRODUCT';

class ProductLocalDataSourceImpl implements ProductLocalDataSource{

  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl ({required this.sharedPreferences});
  
  @override
  Future<void> cacheProduct({required ProductModel? productCache}) {
    
    if (productCache != null){
      sharedPreferences.setString(
        cachedProduct, json.encode(
          productCache.toJson()));
      return Future.value();
    } else {
      throw CacheException();
    }
  }
  
  @override
  Future<ProductModel> getLastProduct() {
    final jsonString = sharedPreferences.getString(cachedProduct);
    if (jsonString != null){
      return Future.value(ProductModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }  
}
