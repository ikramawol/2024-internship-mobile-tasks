import 'package:flutter/material.dart';

import 'descreption_page.dart';
import 'product.dart';
// import 'package:flutter/widgets.dart';

class CustomeCard extends StatelessWidget {
  const CustomeCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Descreption(product: product)),
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
            Image.asset(
              product.image,
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
                        product.price,
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
                        product.category,
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

class BoxNum extends StatefulWidget {
  // const BoxNum({super.key});
  final int number;
  final bool isSelected;
  final VoidCallback onTap;
  const BoxNum(
      {required this.number, this.isSelected = false, required this.onTap});

  @override
  State<BoxNum> createState() => _BoxNumState();
}

class _BoxNumState extends State<BoxNum> {
  // , required this.isSelected, required this.onTap
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 70,
            width: 60,
            // margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: widget.isSelected ? Color(0xFF3E50F3) : Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  // spreadRadius: 3,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
              // border: Border.all(color: widget.isSelected ? Colors.blue : Colors.grey)
            ),
            child: Center(
              child: Text(
                '${widget.number}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: widget.isSelected
                      ? Colors.white
                      : const Color.fromARGB(255, 30, 30, 30),
                ),
              ),
            ),
          ),
        ));
  }
}

class LabelAndTextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final Widget? suffixIcon;

  const LabelAndTextField({
    super.key,
    required this.label,
    this.maxLines = 1,
    this.suffixIcon,
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
