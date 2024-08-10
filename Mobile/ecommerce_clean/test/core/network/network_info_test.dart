// import 'dart:ffi';

import 'package:mockito/mockito.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_clean/core/network/network_info.dart';


import '../../helper/test_helper.mocks.dart';

// class MockInternetConnectionChecker extends Mock implements InternetConnectionChecker {}

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
        // final testHasConnection = Future.value(true);
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