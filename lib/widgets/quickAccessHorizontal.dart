import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_example/controllers/foodController.dart';
import 'package:food_example/screens/phone.dart';
import 'package:food_example/screens/viewAllFoodScreen.dart';
import 'package:food_example/screens/Buyfood.dart';
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
                  builder: (context) => AvailableFoodsScreen(),
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
                            Positioned(
                              top: 1,
                              right: 1,
                              child: IconButton(
                                onPressed: () async {
                                  if (FirebaseAuth.instance.currentUser ==
                                      null) {
                                    Get.dialog(
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Material(
                                                  child: Column(
                                                    children: [
                                                      const SizedBox(
                                                          height: 10),
                                                      const Text(
                                                        "Sign In",
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      const SizedBox(
                                                          height: 15),
                                                      const Text(
                                                        "To enable this feature you have to sign in",
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      const SizedBox(
                                                          height: 20),
                                                      //Buttons
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                minimumSize:
                                                                    const Size(
                                                                        0, 45),
                                                                foregroundColor:
                                                                    Colors
                                                                        .amber,
                                                                backgroundColor:
                                                                    const Color(
                                                                        0xFFFFFFFF),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              child: const Text(
                                                                'Cancel',
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          Expanded(
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                minimumSize:
                                                                    const Size(
                                                                        0, 45),
                                                                foregroundColor:
                                                                    Colors
                                                                        .amber,
                                                                backgroundColor:
                                                                    const Color(
                                                                        0xFFFFFFFF),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                Get.to(() =>
                                                                    const LogIn());
                                                              },
                                                              child: const Text(
                                                                'Sign In',
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        .collection('ownItems')
                                        .where('foodName',
                                            isEqualTo: food['foodName'])
                                        .get()
                                        .then((querySnapshot) {
                                      for (var doc in querySnapshot.docs) {
                                        doc.reference.update({'isLiked': true});
                                      }
                                    });

                                    // .update({'isLiked': true});
                                  }
                                },
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  fixedSize: const Size(30, 30),
                                ),
                                iconSize: 20,
                                icon: Icon(
                                  Iconsax.heart,
                                  color: food['isLiked'] == true
                                      ? Colors.red
                                      : Colors.white,
                                ),
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
