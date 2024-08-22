import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LabelAndTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final int maxLines;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool isPassword;

  const LabelAndTextField({
    super.key,
    this.controller,
    required this.label,
    this.maxLines = 1,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.hintText,
    this.isPassword = false,
  });

  @override
  State<LabelAndTextField> createState() => _LabelAndTextFieldState();
}

class _LabelAndTextFieldState extends State<LabelAndTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            fontFamily: 'Poppins',
          ),
        ),
        const SizedBox(height: 8),
        TextField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
            obscureText: widget.isPassword
                ? _obscureText
                : false, // Hide text if it's a password field
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12), // Adjusted padding inside the text field
              fillColor: const Color(0XFFFAFAFA),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),

              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _obscureText = !_obscureText;
                          },
                        );
                      },
                    )
                  : widget.suffixIcon,

              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            )),
      ],
    );
  }
}
