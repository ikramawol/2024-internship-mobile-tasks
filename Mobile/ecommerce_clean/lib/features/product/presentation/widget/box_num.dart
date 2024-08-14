import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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