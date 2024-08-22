import 'package:ecommerce_clean/core/network/network_info.dart';
import 'package:ecommerce_clean/features/product/data/data_sources/local_data_source.dart';
import 'package:ecommerce_clean/features/product/data/data_sources/remote_data_source.dart';
import 'package:ecommerce_clean/features/product/data/repository/product_repository_impl.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';
import 'package:ecommerce_clean/features/product/domain/usecases/add_product.dart';
import 'package:ecommerce_clean/features/product/domain/usecases/delete_product.dart';
import 'package:ecommerce_clean/features/product/domain/usecases/get_all_product.dart';
import 'package:ecommerce_clean/features/product/domain/usecases/get_product.dart';
import 'package:ecommerce_clean/features/product/domain/usecases/update_product.dart';
import 'package:ecommerce_clean/features/user/data/data_source/user_remote_data_source.dart';
import 'package:ecommerce_clean/features/user/data/repository/user_repository_impl.dart';
import 'package:ecommerce_clean/features/user/domain/repository/user_repository.dart';
import 'package:ecommerce_clean/features/user/domain/usecases/log_in.dart';
import 'package:ecommerce_clean/features/user/domain/usecases/log_out.dart';
import 'package:ecommerce_clean/features/user/domain/usecases/sign_up.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'features/user/data/data_source/user_local_data_source.dart';

final GetIt getIt = GetIt.instance;

Future<void> setup() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final internetConnectionChecker = InternetConnectionChecker();
  final client = http.Client();
  
  getIt.registerLazySingleton<InternetConnectionChecker>(() => internetConnectionChecker);
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<http.Client>(() => client);

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  getIt.registerLazySingleton<ProductLocalDataSource>(() => ProductLocalDataSourceImpl(sharedPreferences : getIt()));
  getIt.registerLazySingleton<ProductRemoteDataSource>(() => ProductRemoteDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
    productRemoteDataSource: getIt(),
    internetConnectionChecker: getIt(),
    productLocalDataSource: getIt(),)
  );
  getIt.registerLazySingleton<GetAllProduct>(() => GetAllProduct(getIt<ProductRepository>()));
  getIt.registerLazySingleton<GetProduct>(() => GetProduct(getIt<ProductRepository>()));
  getIt.registerLazySingleton<AddProduct>(() => AddProduct(getIt<ProductRepository>()));
  getIt.registerLazySingleton<UpdateProduct>(() => UpdateProduct(getIt<ProductRepository>()));
  getIt.registerLazySingleton<DeleteProduct>(() => DeleteProduct(getIt<ProductRepository>()));


  getIt.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSourceImpl(sharedPreferences : getIt()));
  getIt.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
    userRemoteDataSource: getIt(),
    internetConnectionChecker: getIt(),
    userLocalDataSource: getIt(),)
  );
  getIt.registerLazySingleton<SignIn>(() => SignIn(getIt<UserRepository>()));
  getIt.registerLazySingleton<SignUp>(() => SignUp(getIt<UserRepository>()));
  getIt.registerLazySingleton<SignOut>(() => SignOut(getIt<UserRepository>()));
  // getIt.registerLazySingleton<GetMe>(() => GetMe(getIt<UserRepository>()));
} 