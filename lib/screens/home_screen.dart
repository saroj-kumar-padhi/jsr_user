import 'package:flutter/material.dart';
import 'package:food_example/widgets/categories.dart';
import 'package:food_example/widgets/home_appbar.dart';
import 'package:food_example/widgets/home_search_bar.dart';
import 'package:food_example/widgets/quickAccessHorizontal.dart';

class HomeScreen extends StatelessWidget {
  String currentCat = "All";

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppbar(),
                const SizedBox(height: 20),
                const HomeSearchBar(),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/explore.png"),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Categories(currentCat: currentCat),
                const SizedBox(height: 20),
                AvailableFoodList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
