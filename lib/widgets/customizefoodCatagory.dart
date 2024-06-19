// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizeFoodCatagory extends StatelessWidget {
  String text;
  String text1;
  String image;

  final ref = FirebaseDatabase.instance.ref('Menu');
  final auth = FirebaseAuth.instance;

  CustomizeFoodCatagory({
    Key? key,
    required this.text,
    required this.text1,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.2,
          width: size.width * 0.9,
          child: Image.network(
            image,
            // item['food image'].toString(),
            fit: BoxFit.fill,
          ),
        ),
        Text(
          text,
          // item['food Type'].toString(),
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          text1,
          // item['food name'].toString(),
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
