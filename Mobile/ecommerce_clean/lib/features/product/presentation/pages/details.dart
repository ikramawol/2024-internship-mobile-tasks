import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_event.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_state.dart';
import 'package:ecommerce_clean/features/product/presentation/pages/home.dart';
import 'package:ecommerce_clean/features/product/presentation/pages/update_product.dart';
import 'package:ecommerce_clean/features/product/presentation/widget/box_num.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
// import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
// import 'home.dart';
// import 'update_product.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.product});
  final ProductEntity product;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final productRepository = GetIt.instance<ProductRepository>();
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
            create: (context) => ProductBloc(productRepository),
            child: Builder(
              builder: (context) {
                context
                    .read<ProductBloc>()
                    .add(GetSingleProductEvent(productId: widget.product.id));

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // const SizedBox(width: 20,),
                          Image.network(widget.product.imageUrl.toString()),
                          Positioned(
                            top: 20,
                            left: 20,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Color(0xFF3E50F3),
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.product.category.toString(),
                                  style: const TextStyle(
                                    color: Color(0xFFAAAAAA),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(Icons.star,
                                    color: Color.fromARGB(240, 255, 217, 0),
                                    size: 14),
                                const Text(
                                  '(4.5)',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 170, 170, 170),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  widget.product.name,
                                  style: const TextStyle(
                                    color: Color(0xFF3E3E3E),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '\$${widget.product.price}',
                                  style: const TextStyle(
                                    color: Color(0xFF3E3E3E),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              children: [
                                Text(
                                  'Size:',
                                  style: TextStyle(
                                    color: Color(0xFF3E3E3E),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 75,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return BoxNum(
                                  number: index + 35,
                                  isSelected: index == selectedIndex,
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          widget.product.description,
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF666666)),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: BlocListener<ProductBloc, ProductState>(
                          listener: (context, state) {
                            if (state is SuccessfulState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Product deleted successfully')),
                              );
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                                (route) => false,
                              ); // Navigate back to the previous screen
                            } else if (state is ErrorState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Failed to delete the product')),
                              );
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  context.read<ProductBloc>().add(
                                      DeleteProductEvent(
                                          productId: widget.product.id));
                                },
                                style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(150, 48),
                                  side: const BorderSide(color: Colors.red),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'CLEAR',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Update(product: widget.product),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(150, 48),
                                    backgroundColor: const Color(0xFF3E50F3),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                child: const Text(
                                  'UPDATE',
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
                      // Image.asset('images/Shoe.png', fit: BoxFit.cover, height: 300,),
                    ],
                  ),
                );
              },
            )));
  }
}
