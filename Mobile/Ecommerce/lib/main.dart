
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/descreption.dart';
import 'package:flutter_application_1/search.dart';
import 'package:flutter_application_1/addProduct.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),

      // home: Descreption(),
      // home: Search(),
      // home: AddProduct(),
      // routes: {
      //   '/description': (context) => const Descreption(), // Define a route for Descreption
      // },
    );
  }
}

void main() {
  runApp(MyApp());
}

