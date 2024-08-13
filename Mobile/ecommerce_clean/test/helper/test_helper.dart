
import 'package:ecommerce_clean/features/product/data/data_sources/local_data_source.dart';
import 'package:ecommerce_clean/features/product/data/data_sources/remote_data_source.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
   [
    ProductRepository,
    ProductRemoteDataSource,
    InternetConnectionChecker,
    ProductLocalDataSource,
   ],
    customMocks: [
      MockSpec<http.Client>(as: #MockHttpClient)
    ],
)

void main(){

}