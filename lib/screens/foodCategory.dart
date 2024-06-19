import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:food_example/screens/utiles/foodCatagoryDetail.dart';
import 'package:food_example/widgets/customizefoodCatagory.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCategory extends StatelessWidget {
  final ref = FirebaseDatabase.instance.ref('Menu');
  final auth = FirebaseAuth.instance;
  FoodCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
            child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshots, animation, index) {
                  final item = snapshots.value as Map<dynamic, dynamic>;
                  //final item = _items[index];
                  final mealType = item['mealType'];
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodCatagoryDetail(
                            type: item['food Type'].toString(),
                          ),
                        )),
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15.0), // Adjust the radius as needed
                      ),
                      child: CustomizeFoodCatagory(
                          text: item['food Type'].toString(),
                          text1: item['food name'].toString(),
                          image: item['food image'].toString()),
                    ),
                  );
                })));
  }
}
