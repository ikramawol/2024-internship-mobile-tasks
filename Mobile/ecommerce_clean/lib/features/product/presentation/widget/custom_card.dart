import 'package:ecommerce_clean/features/product/domain/entities/product.dart';
import 'package:ecommerce_clean/features/product/presentation/pages/details.dart';
import 'package:flutter/material.dart';

// import 'descreption_page.dart';
// import 'product.dart';
// import 'package:flutter/widgets.dart';

class CustomeCard extends StatelessWidget {
  const CustomeCard({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Details(product: product)),
        );
      },
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // height: 220,
        // width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 235, 235, 235).withOpacity(0.3),
              // spreadRadius: 3,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          children: [
            Image.network(
              product.imageUrl.toString(),
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          color: Color(0xFF3E3E3E),
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '\$${product.price.toString()}',
                        style: const TextStyle(
                          color: Color(0xFF3E3E3E),
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
                        product.category.toString(),
                        style: const TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star,
                        color: Color.fromARGB(240, 255, 217, 0),
                        size: 14,
                      ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

