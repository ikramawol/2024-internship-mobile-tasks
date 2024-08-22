// import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
// import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';
// import 'package:ecommerce_clean/features/product/presentation/pages/home.dart';
// import 'package:ecommerce_clean/features/product/presentation/widget/custom_card.dart';
// import 'package:ecommerce_clean/features/product/presentation/widget/label_text_field.dart';
// import 'package:ecommerce_clean/features/product/presentation/widget/range_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';

// class Search extends StatefulWidget {
//   const Search({super.key});

//   @override
//   State<Search> createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   bool showCategory = false;
//   final productRepository = GetIt.instance<ProductRepository>();

//   // List<ProductEntity> products = []; // Assume this is populated with product data

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             color: Color(0xFF3E50F3),
//             size: 20,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text(
//           "Search Product",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(
//                         color: const Color(0xFFD9D9D9),
//                         width: 1,
//                       ),
//                     ),
//                     child: const Row(
//                       children: [
//                         Expanded(
//                           child: TextField(
//                             decoration: InputDecoration(
//                               hintText: 'Leather',
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.only(left: 10),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 10),
//                           child: Icon(
//                             Icons.east,
//                             color: Color(0xFF3E50F3),
//                             size: 24,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       showCategory = !showCategory;
//                     });
//                   },
//                   child: Container(
//                     height: 48,
//                     width: 48,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF3E50F3),
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     child: const Icon(
//                       Icons.filter_list,
//                       color: Colors.white,
//                       size: 28,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: products.map((item) {
//                     return Column(
//                       children: [
//                         CustomeCard(product: item),
//                         const SizedBox(height: 15),
//                       ],
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             if (showCategory) ...[
//               SingleChildScrollView(
//                 child: SizedBox(
//                   height: 250,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 10),
//                       const LabelAndTextField(
//                         controller: null,
//                         label: 'Category',
//                         maxLines: 1,
//                       ),
//                       const SizedBox(height: 10),
//                       const Text(
//                         'Price',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.start,
//                       ),
//                       const RangeSliderWidget(),
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const HomePage(),
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: const Size(334, 44),
//                           backgroundColor: const Color(0xFF3E50F3),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text(
//                           'APPLY',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_event.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_state.dart';
// import 'package:ecommerce_clean/features/product/presentation/bloc/search_bloc.dart';
// import 'package:ecommerce_clean/features/product/presentation/bloc/search_event.dart';
// import 'package:ecommerce_clean/features/product/presentation/bloc/search_state.dart';
import 'package:ecommerce_clean/features/product/presentation/pages/home.dart';
import 'package:ecommerce_clean/features/product/presentation/widget/custom_card.dart';
import 'package:ecommerce_clean/features/product/presentation/widget/label_text_field.dart';
import 'package:ecommerce_clean/features/product/presentation/widget/range_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool showCategory = false;
  final productRepository = GetIt.instance<ProductRepository>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(productRepository)..add(LoadAllProductsEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF3E50F3),
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            "Search Product",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: const Color(0xFFD9D9D9),
                          width: 1,
                        ),
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Leather',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              Icons.east,
                              color: Color(0xFF3E50F3),
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showCategory = !showCategory;
                      });
                    },
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3E50F3),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.filter_list,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is LoadedAllProductState) {
                      return SingleChildScrollView(
                        child: Column(
                          children: state.product.map((item) {
                            return Column(
                              children: [
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
                    }
                    return Container();
                  },
                ),
              ),
              const SizedBox(height: 10),
              if (showCategory) ...[
                SingleChildScrollView(
                  child: SizedBox(
                    height: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const LabelAndTextField(
                          controller: null,
                          label: 'Category',
                          maxLines: 1,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const RangeSliderWidget(),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(334, 44),
                            backgroundColor: const Color(0xFF3E50F3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'APPLY',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
