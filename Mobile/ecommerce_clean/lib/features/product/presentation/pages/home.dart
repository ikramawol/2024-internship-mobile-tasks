// import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';
// import 'package:ecommerce_clean/features/product/domain/useCases/add_product.dart';
// import 'package:ecommerce_clean/features/product/presentation/bloc/event.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_event.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_state.dart';
import 'package:ecommerce_clean/features/product/presentation/pages/add_product.dart';
import 'package:ecommerce_clean/features/product/presentation/pages/search.dart';
import 'package:ecommerce_clean/features/product/presentation/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productRepository = GetIt.instance<ProductRepository>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFCCCCCC),
                borderRadius: BorderRadius.circular(11),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'July 14, 2023',
                    style: TextStyle(
                      color: Color(0xFFAAAAAA),
                      fontSize: 12,
                      fontFamily: 'Syne',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Hello, ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF666666),
                          fontFamily: 'Sora',
                          fontSize: 15,
                          height: 0,
                        ),
                      ),
                      Text(
                        'Ikram',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Sora',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFFEFEFE),
                border: Border.all(
                  width: 1,
                  color: const Color(0xFFD9D9D9),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Stack(
                  children: [
                    const Icon(
                      Icons.notifications_outlined,
                      color: Colors.grey,
                    ),
                    Positioned(
                      top: 5,
                      left: 14,
                      child: Center(
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3E50F3),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const Add()),
          // );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider<ProductBloc>(
                create: (context) => ProductBloc(productRepository),
                child: Add(),
              ),
            ),
          );
        },
        backgroundColor: const Color(0xFF3E50F3),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28.5,
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            ProductBloc(productRepository)..add(const LoadAllProductsEvent()),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Available Products',
                    style: TextStyle(
                      color: Color(0xFF3E3E3E),
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEFEFE),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFFD9D9D9),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Color(0xFFD9D9D9),
                          size: 26,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Search()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Expanded(
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    // print("loading Ikram");
                    if (state is LoadingState) {
                      print("loading Ikram");
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is LoadedAllProductState) {
                      // final product = state.product;
                      return SingleChildScrollView(
                        child: Column(
                          children: state.product.map((item) {
                            return Column(
                              children: [
                                // const SizedBox(height: 15),
                                CustomeCard(product: item),
                                const SizedBox(height: 15),
                              ],
                            );
                          }).toList(),
                        ),
                      );
                    } else if (state is ErrorState) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else {
                      return const Center(
                        child: Text('No Product found.'),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

 