import 'package:ecommerce_clean/features/product/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_bloc.dart';
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures that the binding is initialized before calling setup()
  await setup(); // Initializes the dependencies

  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: BlocProvider(
        create: (context) => GetIt.instance<ProductBloc>(),
        child: const HomePage(),
      ),
    );
  }
}


// import 'package:ecommerce_clean/features/product/presentation/pages/home.dart';
// import 'package:flutter/material.dart';

// class EcommerceApp extends StatelessWidget {
//   const EcommerceApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// void main() {
//   runApp(const EcommerceApp());
// }