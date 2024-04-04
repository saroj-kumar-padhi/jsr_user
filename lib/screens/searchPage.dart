import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_example/controllers/serchController.dart';
import 'package:food_example/screens/Buyfood.dart';
import 'package:food_example/widgets/home_search_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/quick_screen_appbar.dart';

class SearchPage extends StatelessWidget {
  final SerchController serchController = Get.put(SerchController());
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const QuickScreenAppbar(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: HomeSearchBar(),
            ),
            Obx(() {
              return Expanded(
                  child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Set the number of columns
                  crossAxisSpacing: 10, // Set spacing between columns
                  mainAxisSpacing: 10, // Set spacing between rows
                ),
                itemCount: serchController.searchedData.length,
                itemBuilder: (context, index) {
                  var food = serchController.searchedData[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyFoodScreen(food: food),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              // Use CachedNetworkImage
                              imageUrl:
                                  food['foodImage'], // Provide the image URL
                              placeholder: (context, url) => const Center(
                                  child:
                                      CircularProgressIndicator()), // Show a loading indicator while the image is loading
                              errorWidget: (context, url, error) => const Icon(Icons
                                  .error), // Show an error icon if the image fails to load
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height * 0.14,
                              width: double.infinity,
                              // You can also provide other properties like width, height, fit, etc.
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              food['foodName'],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
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
                                const SizedBox(width: 5),
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
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ));
            })
          ],
        ),
      ),
    );
  }
}
