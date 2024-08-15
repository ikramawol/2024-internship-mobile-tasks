import 'package:ecommerce_clean/features/product/presentation/pages/home.dart';
import 'package:flutter/material.dart';


class Add extends StatelessWidget {
  final String? name;
  final String? category;
  final double? price;
  final String? description;

  const Add({
    super.key,
    this.name,
    this.category,
    this.price,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: name);
    final categoryController = TextEditingController(text: category);
    final priceController = TextEditingController(text: price?.toString());
    final descriptionController = TextEditingController(text: description);

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
                controller: nameController,
                label: 'Name',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 12),
              LabelAndTextField(
                controller: categoryController,
                label: 'Category',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 12),
              LabelAndTextField(
                controller: priceController,
                label: 'Price',
                keyboardType: TextInputType.number,
                suffixIcon: const Icon(Icons.attach_money),
              ),
              const SizedBox(height: 12),
              LabelAndTextField(
                controller: descriptionController,
                label: 'Description',
                keyboardType: TextInputType.text,
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle add or update product logic here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
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

class LabelAndTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLines;
  final Widget? suffixIcon;
  final TextInputType keyboardType;

  const LabelAndTextField({
    super.key,
    required this.controller,
    required this.label,
    this.maxLines = 1,
    this.suffixIcon,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            fillColor: const Color(0xFFF0F0F0),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}