import 'dart:convert';

import 'package:ecommerce_clean/core/error/cache_exception.dart';
import 'package:ecommerce_clean/features/product/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getCacheAllProducts();
  Future<ProductModel> getCacheProduct(String productId);
  Future<void> addCacheProduct({required ProductModel productCache});
  Future<void> deleteCacheProduct(String productId);
  Future<void> updateCacheProduct({required ProductModel productCache});
}

const cachedProduct = 'CACHED_PRODUCT';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  // Helper method to get cached products
  Future<List<ProductModel>> _getCachedProducts() async {
    final jsonString = sharedPreferences.getString(cachedProduct);
    if (jsonString != null) {
      return (json.decode(jsonString) as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();
    } else {
      return [];
    }
  }

  // Helper method to save cached products
  Future<void> _saveCachedProducts(List<ProductModel> products) async {
    final result = await sharedPreferences.setString(
      cachedProduct,
      json.encode(products.map((product) => product.toJson()).toList()),
    );
    if (!result) {
      throw CacheException();
    }
  }

  @override
  Future<List<ProductModel>> getCacheAllProducts() async {
    return await _getCachedProducts();
  }

  @override
  Future<ProductModel> getCacheProduct(String productId) async {
    final cachedProducts = await _getCachedProducts();
    try {
      final product = cachedProducts.firstWhere(
        (product) => product.id == productId.toString(),
      );
      return product;
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> addCacheProduct({required ProductModel productCache}) async {
    final cachedProducts = await _getCachedProducts();
    cachedProducts.add(productCache);
    await _saveCachedProducts(cachedProducts);
  }

  @override
  Future<void> deleteCacheProduct(String productId) async {
    final cachedProducts = await _getCachedProducts();
    cachedProducts.removeWhere((product) => product.id == productId.toString());
    await _saveCachedProducts(cachedProducts);
  }

  @override
  Future<void> updateCacheProduct({required ProductModel productCache}) async {
    final cachedProducts = await _getCachedProducts();
    final index = cachedProducts.indexWhere((product) => product.id == productCache.id);
    if (index != -1) {
      cachedProducts[index] = productCache;
      await _saveCachedProducts(cachedProducts);
    } else {
      throw CacheException();
    }
  }
}
