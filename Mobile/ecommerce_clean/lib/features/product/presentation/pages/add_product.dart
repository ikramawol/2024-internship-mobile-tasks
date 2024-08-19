import 'dart:io';
import 'package:ecommerce_clean/features/product/data/models/product_model.dart';
import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:ecommerce_clean/features/product/domain/repository/product_repository.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_event.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce_clean/features/product/presentation/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce_clean/features/product/presentation/pages/home.dart';
import 'package:ecommerce_clean/features/product/presentation/widget/label_text_field.dart';
import 'package:flutter/material.dart';
class Add extends StatefulWidget {
  final String? productId;
  final String? name;
  final String? category;
  final double? price;
  final String? description;

  const Add({
    super.key,
    this.productId,
    this.name,
    this.category,
    this.price,
    this.description,
  });

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  File? _image;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name ?? '';
    categoryController.text = widget.category ?? '';
    priceController.text = widget.price?.toString() ?? '';
    descriptionController.text = widget.description ?? '';
  }
  void _clearForm(){
    setState(() {
    nameController.clear();
    categoryController.clear();
    priceController.clear();
    descriptionController.clear();
    _image = null;
  });
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
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
          'Add Product',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => ProductBloc(GetIt.instance<ProductRepository>()),
        child: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {
             if (state is SuccessfulState) {
              ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Product added successfully!')),
            );
              // Navigator.pop(context); // Close the dialog
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomePage()),
              // );
                 Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const HomePage()),
                          (route) => false,);
            } else if (state is ErrorState) {
              Navigator.pop(context); // Close the dialog
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        height: 190,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(216, 243, 243, 243),
                          borderRadius: BorderRadius.circular(10),
                          image: _image != null
                              ? DecorationImage(
                                  image: FileImage(_image!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: _image == null
                            ? const Column(
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
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 12),
                    LabelAndTextField(
                      controller: nameController,
                      label: 'Name',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the product name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    LabelAndTextField(
                      controller: categoryController,
                      label: 'Category',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the product category';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    LabelAndTextField(
                      controller: priceController,
                      label: 'Price',
                      keyboardType: TextInputType.number,
                      suffixIcon: const Icon(Icons.attach_money),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the product price';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    LabelAndTextField(
                      controller: descriptionController,
                      label: 'Description',
                      keyboardType: TextInputType.text,
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the product description';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              if (_image == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please upload an image'),
                                  ),
                                );
                                return;
                              }

                              final product = ProductEntity(
                                id: '',
                                name: nameController.text,
                                category: categoryController.text,
                                price: int.parse(priceController.text),
                                description: descriptionController.text,
                                imageUrl: _image?.path,
                              );

                              context.read<ProductBloc>().add(
                                    CreateProductEvent(newProduct: product),
                                  );
                              Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const HomePage()),
                          (route) => false,
                        ); 
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(334, 52),
                            backgroundColor: const Color(0xFF3E50F3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'ADD',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        OutlinedButton(
                          onPressed: () {
                            _clearForm();
                            // Navigator.pop(context);
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
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
