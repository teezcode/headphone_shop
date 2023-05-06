import 'dart:ui';

import 'package:flutter/material.dart';

class SortButton extends StatefulWidget {
  final String name;
  final VoidCallback onPressed;
  final bool isSelected;
  final double? borderRadius;
  final Gradient gradient;

  const SortButton({Key? key,
    required this.name,
    this.borderRadius,
    required this.onPressed, this.isSelected = false,
    this.gradient = const LinearGradient(colors: [Color(0xff5D9CC6), Color(0xff4E5BB3)]),


  }) : super(key: key);

  @override
  State<SortButton> createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 5,
      child: Container(
        width: 110,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: widget.gradient,
        ),
        child: ElevatedButton(
          style: TextButton.styleFrom(
              shape:RoundedRectangleBorder(borderRadius: widget.borderRadius == null ? const BorderRadius.all(Radius.circular(80)) : BorderRadius.all(Radius.circular(widget.borderRadius!)),
        ),
            backgroundColor: widget.isSelected ? Colors.transparent : const Color(0xff262626) ,
            shadowColor: Colors.transparent
          ),
            onPressed: widget.onPressed,
            child: Text(
              widget.name,
              style: const TextStyle(
                color: Colors.white
              ),
            )
        ),
      ),
    );
  }
}
