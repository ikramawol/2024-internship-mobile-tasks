import 'package:ecommerce_clean/features/product/presentation/pages/home.dart';
import 'package:ecommerce_clean/features/product/presentation/pages/search.dart';
import 'package:ecommerce_clean/features/user/domain/repository/user_repository.dart';
import 'package:ecommerce_clean/features/user/presentation/bloc/user_bloc.dart';
import 'package:ecommerce_clean/features/user/presentation/pages/sign_in.dart';
import 'package:ecommerce_clean/features/user/presentation/pages/sign_up.dart';
import 'package:ecommerce_clean/features/user/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_bloc.dart';
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures that the binding is initialized before calling setup()
  await setup(); // Initializes the dependencies
  getIt.registerFactory<UserBloc>(() => UserBloc(GetIt.instance<UserRepository>()));

  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.instance<ProductBloc>(),
        ),
        BlocProvider(
          create: (context) => GetIt.instance<UserBloc>(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // splash: BlocProvider(
        //   create: (context) => GetIt.instance<ProductBloc>(),
        //   child: const HomePage(),
        // ),
        home: Splash(),
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