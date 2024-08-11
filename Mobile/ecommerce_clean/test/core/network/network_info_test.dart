import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_clean/core/network/network_info.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp((){
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockInternetConnectionChecker);
  });

  group('isConnected', (){
    test(
      'should forword the call to the InternetConnectionChecker.hasConnection',
      ()async{
        //arrange
        when(mockInternetConnectionChecker.hasConnection)
        .thenAnswer((_) async => true);

        //act
        final result = await networkInfo.isConnected;
        
        //assert
        verify(mockInternetConnectionChecker.hasConnection);
        expect(result, true);
      }
    );
  });

}