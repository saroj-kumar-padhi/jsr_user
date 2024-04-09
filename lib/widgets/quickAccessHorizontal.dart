import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_example/controllers/foodController.dart';
import 'package:food_example/screens/viewAllFoodScreen.dart';
import 'package:food_example/screens/Buyfood.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:hive/hive.dart';

class AvailableFoodList extends StatelessWidget {
  final FoodController foodController =
      Get.put(FoodController()); // Get the instance of FoodController

  final box = Hive.box('myBox');

  AvailableFoodList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Best foods available",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AvailableFoodsScreen(),
                ),
              ),
              child: const Text("View all"),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
            height: 200, // Set the height of the ListView
            child: Obx(() {
              if (foodController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodController.fetchedFoodItems.length,
                  itemBuilder: (context, index) {
                    var food = foodController.fetchedFoodItems[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuyFoodScreen(food: food),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 200,
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  // Use CachedNetworkImage
                                  imageUrl: food[
                                      'foodImage'], // Provide the image URL
                                  placeholder: (context, url) => const Center(
                                      child:
                                          CircularProgressIndicator()), // Show a loading indicator while the image is loading
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons
                                          .error), // Show an error icon if the image fails to load
                                  fit: BoxFit.fill,
                                  height: 130,
                                  width: double.infinity,
                                  // You can also provide other properties like width, height, fit, etc.
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  food['foodName'],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Iconsax.flash_1,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      food['cal'],
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const Text(
                                      " · ",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    const Icon(
                                      Iconsax.clock,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "${food['time']} Min",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }))
      ],
    );
  }
}
