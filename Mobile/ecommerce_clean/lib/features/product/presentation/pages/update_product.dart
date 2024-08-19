import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';
import 'package:ecommerce_clean/features/product/presentation/pages/details.dart';
import 'package:ecommerce_clean/features/product/presentation/pages/home.dart';
import 'package:ecommerce_clean/features/product/presentation/widget/label_text_field.dart';
import 'package:flutter/material.dart';
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


  @override

  void initState(){
    nameController = TextEditingController(text: widget.product.name);
    categoryController = TextEditingController(text: widget.product.category);
    priceController = TextEditingController(text: widget.product.price.toString());
    descriptionController = TextEditingController(text: widget.product.description);
    super.initState();
  }

  void _updateProduct() async {
    final productRepository = GetIt.instance<ProductRepository>();

    final updatedProduct = ProductEntity(
      id: widget.product.id,
      name: nameController.text,
      category: categoryController.text,
      price: int.parse(priceController.text),
      description: descriptionController.text,
    );

    await productRepository.updateProduct(updatedProduct);
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
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
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      color: Color.fromARGB(255, 150, 149, 149),
                      size: 50,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Upload Image',
                      style: TextStyle(
                        color: Color.fromARGB(255, 123, 123, 123),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              LabelAndTextField(
                controller: TextEditingController(text: widget.product.name),
                label: 'name',
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
                controller:
                    TextEditingController(text: widget.product.description),
                label: 'description',
                keyboardType: TextInputType.text,
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _updateProduct,
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
      ),
    );
  }
}

