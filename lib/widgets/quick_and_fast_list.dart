import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_example/controllers/foodController.dart';
import 'package:food_example/screens/quick_foods_screen.dart';
import 'package:food_example/screens/recipe_screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AvailableFoodList extends StatelessWidget {
  final FoodController foodController =
      Get.put(FoodController()); // Get the instance of FoodController

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
                  builder: (context) => const QuickFoodsScreen(),
                ),
              ),
              child: const Text("View all"),
            ),
          ],
        ),
        const SizedBox(height: 20),
        FutureBuilder(
          future: foodController.getFoodItems(), // Call getFoodItems method
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return SizedBox(
                height: 200, // Set the height of the ListView
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodController.fetchedFoodItems.length,
                  itemBuilder: (context, index) {
                    var food = foodController.fetchedFoodItems[index];
                    return GestureDetector(
                      // onTap: () => Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => RecipeScreen(food: food),
                      //   ),
                      // ),
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
                                const Row(
                                  children: [
                                    Icon(
                                      Iconsax.flash_1,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "1234",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      " · ",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Icon(
                                      Iconsax.clock,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      "30 Min",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Positioned(
                              top: 1,
                              right: 1,
                              child: IconButton(
                                onPressed: () {},
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  fixedSize: const Size(30, 30),
                                ),
                                iconSize: 20,
                                icon: const Icon(Iconsax.heart),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
