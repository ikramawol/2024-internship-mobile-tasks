import 'package:flutter/material.dart';

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
