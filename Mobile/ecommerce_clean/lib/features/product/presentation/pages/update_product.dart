import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';
import 'package:ecommerce_clean/features/product/domain/usecases/update_product.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_event.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_state.dart';
import 'package:ecommerce_clean/features/product/presentation/pages/details.dart';
import 'package:ecommerce_clean/features/product/presentation/pages/home.dart';
import 'package:ecommerce_clean/features/product/presentation/widget/label_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class Update extends StatefulWidget {
  final ProductEntity product;

  const Update({
    super.key,
    required this.product,
  });

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  late TextEditingController nameController;
  late TextEditingController categoryController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;
  // late String imageUrl;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.product.name);
    categoryController = TextEditingController(text: widget.product.category);
    priceController = TextEditingController(text: widget.product.price.toString());
    descriptionController = TextEditingController(text: widget.product.description);
    // imageUrl = widget.product.imageUrl!;
    super.initState();
  }

  void _updateProduct(BuildContext context) {
    final productRepository = GetIt.instance<ProductRepository>();

    final updatedProduct = ProductEntity(
      id: widget.product.id,
      name: nameController.text,
      category: categoryController.text,
      price: int.parse(priceController.text),
      description: descriptionController.text,
      imageUrl: widget.product.imageUrl, 
    );

    context.read<ProductBloc>().add(UpdateProductEvent(product: updatedProduct));
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(GetIt.instance<ProductRepository>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is SuccessfulState) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Details(product: widget.product)),
              );
            } else if (state is ErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
              // Handle the error state
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 190,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(216, 243, 243, 243),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: widget.product.imageUrl!.isNotEmpty ? Image.network(widget.product.imageUrl!, fit: BoxFit.cover)
                      : const Center(child: Text('No image available'))
                    ),
                    const SizedBox(height: 12),
                    LabelAndTextField(
                      controller: TextEditingController(text: widget.product.name),
                      label: 'name',
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 12),
                    LabelAndTextField(
                      controller:
                          TextEditingController(text: widget.product.category),
                      label: 'category',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 12),
                    LabelAndTextField(
                      controller: TextEditingController(
                        text: widget.product.price.toString()),
                      label: 'price',
                      keyboardType: TextInputType.number,
                      suffixIcon: const Icon(Icons.attach_money),
                    ),
                    const SizedBox(height: 12),
                    LabelAndTextField(
                      controller: TextEditingController(
                          text: widget.product.description),
                      label: 'description',
                      keyboardType: TextInputType.text,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () => _updateProduct(context),
                          // Update the local state variables
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) =>
                          //           Details(product: widget.product)),
                          // );

                          // Navigate back to the home page
                          // Navigator.pop(context);
                          // },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(334, 52),
                            backgroundColor: const Color(0xFF3E50F3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'UPDATE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        OutlinedButton(
                          onPressed: () {
                            // Handle the delete action if needed
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(334, 52),
                            side: const BorderSide(color: Colors.red),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'DELETE',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
