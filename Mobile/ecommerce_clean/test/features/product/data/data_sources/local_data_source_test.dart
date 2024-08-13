import 'package:ecommerce_clean/features/product/data/data_sources/local_data_source.dart';
import 'package:ecommerce_clean/features/product/data/data_sources/remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helper/test_helper.mocks.dart';

void main(){
  late MockHttpClient mockHttpClient;
  late ProductLocalDataSourceImpl productLocalDataSourceImpl;

  setUp((){
    mockHttpClient = MockHttpClient();
    productLocalDataSourceImpl = ProductLocalDataSourceImpl();
  });
}