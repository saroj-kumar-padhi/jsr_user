import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizeButton extends StatelessWidget {
  final String text;
  final bgColor;
  final textColor;
  final onPressed;
  CustomizeButton(
      {super.key,
      required this.text,
      required this.bgColor,
      required this.textColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
