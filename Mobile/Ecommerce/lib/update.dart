// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/homePage.dart';

// class UpdateProduct extends StatelessWidget {
//   final String name;
//   final String category;
//   final double price;
//   final String description;

//   const UpdateProduct({
//     Key? key,
//     required this.name,
//     required this.category,
//     required this.price,
//     required this.description,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final nameController = TextEditingController(text: name);
//     final categoryController = TextEditingController(text: category);
//     final priceController = TextEditingController(text: price.toString());
//     final descriptionController = TextEditingController(text: description);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//             size: 20,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text(
//           "Update Product",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 190,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(216, 243, 243, 243),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.image,
//                       color: Color.fromARGB(255, 150, 149, 149),
//                       size: 50,
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       "Upload Image",
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 123, 123, 123),
//                         fontSize: 14,
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 12),
//               LabelAndTextField(
//                 controller: nameController,
//                 label: 'Name',
//                 keyboardType: TextInputType.text,
//               ),
//               const SizedBox(height: 12),
//               LabelAndTextField(
//                 controller: categoryController,
//                 label: 'Category',
//                 keyboardType: TextInputType.text,
//               ),
//               const SizedBox(height: 12),
//               LabelAndTextField(
//                 controller: priceController,
//                 label: 'Price',
//                 keyboardType: TextInputType.number,
//                 suffixIcon: const Icon(Icons.attach_money),
//               ),
//               const SizedBox(height: 12),
//               LabelAndTextField(
//                 controller: descriptionController,
//                 label: 'Description',
//                 keyboardType: TextInputType.text,
//                 maxLines: 3,
//               ),
//               const SizedBox(height: 16),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle update product logic here
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const HomePage(),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(334, 52),
//                       backgroundColor: const Color(0xFF3E50F3),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text(
//                       'UPDATE',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   OutlinedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const HomePage(),
//                         ),
//                       );
//                     },
//                     style: OutlinedButton.styleFrom(
//                       minimumSize: const Size(334, 52),
//                       side: const BorderSide(color: Colors.red),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text(
//                       'DELETE',
//                       style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LabelAndTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String label;
//   final int maxLines;
//   final Widget? suffixIcon;
//   final TextInputType keyboardType;

//   const LabelAndTextField({
//     Key? key,
//     required this.controller,
//     required this.label,
//     this.maxLines = 1,
//     this.suffixIcon,
//     required this.keyboardType,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         const SizedBox(height: 8),
//         TextField(
//           controller: controller,
//           keyboardType: keyboardType,
//           maxLines: maxLines,
//           decoration: InputDecoration(
//             fillColor: const Color(0xFFF0F0F0),
//             filled: true,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide.none,
//             ),
//             suffixIcon: suffixIcon,
//           ),
//         ),
//       ],
//     );
//   }
// }





import 'package:flutter/material.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({Key? key}) : super(key: key);

  @override
  _UpdateProductState createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String name = 'Derby Leather Shoes';
  String category = 'Men’s shoe';
  double price = 120.0;
  String description =
      'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.';

  @override
  Widget build(BuildContext context) {
    // Initialize controllers with the existing product data
    nameController.text = name;
    categoryController.text = category;
    priceController.text = price.toString();
    descriptionController.text = description;

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
          "Update Product",
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
                      "Upload Image",
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
                label: 'name',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 12),
              LabelAndTextField(
                controller: categoryController,
                label: 'category',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 12),
              LabelAndTextField(
                controller: priceController,
                label: 'price',
                keyboardType: TextInputType.number,
                suffixIcon: const Icon(Icons.attach_money),
              ),
              const SizedBox(height: 12),
              LabelAndTextField(
                controller: descriptionController,
                label: 'description',
                keyboardType: TextInputType.text,
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Update the local state variables
                      setState(() {
                        name = nameController.text;
                        category = categoryController.text;
                        price = double.parse(priceController.text);
                        description = descriptionController.text;
                      });

                      // Navigate back to the home page
                      Navigator.pop(context);
                    },
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
                      Navigator.pop(context);
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
    Key? key,
    required this.controller,
    required this.label,
    this.maxLines = 1,
    this.suffixIcon,
    required this.keyboardType,
  }) : super(key: key);

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
