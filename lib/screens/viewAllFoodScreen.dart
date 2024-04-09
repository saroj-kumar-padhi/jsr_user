import 'package:flutter/material.dart';
import 'package:food_example/controllers/foodController.dart';
import 'package:food_example/models/food.dart';
import 'package:food_example/screens/Buyfood.dart';
import 'package:food_example/widgets/food_card.dart';
import 'package:food_example/widgets/quick_screen_appbar.dart';
import 'package:get/get.dart';

class AvailableFoodsScreen extends StatelessWidget {
  final FoodController foodController = Get.put(FoodController());

  AvailableFoodsScreen({super.key});

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
                const QuickScreenAppbar(),
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 25,
                  ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.to(() => BuyFoodScreen(
                          food: foodController.fetchedFoodItems[index]));
                    },
                    child: FoodCard(
                      food: foodController.fetchedFoodItems[index],
                    ),
                  ),
                  itemCount: foods.length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
