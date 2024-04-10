import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Thali {
  final String thaliName;
  final String thaliImage;
  final String thaliPrice;

  Thali(
      {required this.thaliName,
      required this.thaliImage,
      required this.thaliPrice});
}

final List<Thali> thaliList = [
  Thali(
      thaliName: "Veg Thali",
      thaliImage: 'assets/images/vegThali.png',
      thaliPrice: '210'),
  Thali(
      thaliName: "Veg Sweet Thali",
      thaliImage: 'assets/images/vegThali.png',
      thaliPrice: '210'),
  Thali(
      thaliName: "Non-Veg Thali",
      thaliImage: 'assets/images/vegThali.png',
      thaliPrice: '210'),
];

final TextStyle customTextStyle = GoogleFonts.roboto(
  textStyle: const TextStyle(
    // Define the rest of your text style properties here
    fontWeight: FontWeight.bold,
  ),
);
