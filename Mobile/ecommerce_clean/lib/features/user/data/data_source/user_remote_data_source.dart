import 'package:ecommerce_clean/core/constants/constants.dart';
import 'package:ecommerce_clean/features/user/data/models/user_model.dart';
import 'package:ecommerce_clean/features/user/domain/entities/user.dart';
import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
import 'dart:convert';
// import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

abstract class UserRemoteDataSource{

  Future<UserModel> signUp(UserModel user);
  Future<String> logIn(String email, String password);
  Future<void> logOut();
  Future<UserModel> getMe();
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource{
  final http.Client client;
  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> signUp(UserModel user) async {
    final url = Uri.parse('${Urls.authUrl}/auth/register');
    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': user.name, 'email': user.email, 'password': user.password}),
    );
     print(response.body);
    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return UserModel.fromJson(data['data']);
    } else {
      throw Exception('Failed to register');
    }
  }
  
  @override
  Future<String> logIn(String email, String password) async {
    final url = Uri.parse('${Urls.authUrl}/auth/login');
    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password':password}),
    );


    if (response.statusCode == 201) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var result = pref.setString('auth_token',
      json.decode(response.body)['data']['access_token']);

      final data = getMe();
      print("data $data");
      return data.toString();

    } else {
      throw Exception('Failed to login');
    }
  }
  
  @override
  Future<void> logOut() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.remove('authtoken');

      print('Logged out successfully');
    }catch (e){
      throw Exception('Error during logOut: $e');
    }
  }


  @override
  Future<UserModel> getMe() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      // final token = pref.getString('auth_token');

      final url = Uri.parse('${Urls.authUrl}/user/me');
      var headers = {
          'Authorization': "Bearer ${pref.getString('auth_token')}",
          'Content-Type': 'application/json',
          };

      final response = await client.get(
        url,
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load user');
      }
      final jsonFinal =  json.decode(response.body) as Map<String, dynamic>;

      print("json final ${jsonFinal['data']}");
      return UserModel.fromJson(jsonFinal['data']);

    } catch (e) {
      throw Exception('Error during getMe: $e');
    }
  }
 
}