import 'package:ecommerce_clean/features/product/data/data_sources/remote_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
   [
    ProductRepository,
    ProductRemoteDataSource

   ],
    customMocks: [
      MockSpec<http.Client>(as: #MockHttpClient)
    ],
)

void main(){

}