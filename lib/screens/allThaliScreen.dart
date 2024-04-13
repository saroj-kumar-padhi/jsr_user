import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:food_example/controllers/thaliController.dart';
import 'package:food_example/screens/thaliItems.dart';

import 'package:food_example/widgets/quick_screen_appbar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AllThaliScreen extends StatelessWidget {
  final ThaliController thaliController = Get.put(ThaliController());
  AllThaliScreen({super.key});

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
                      Get.to(ThaliItems(
                          thaliItem: thaliController.thaliList[index]));
                    },
                    child: FoodCard(
                      index: index,
                    ),
                  ),
                  itemCount: thaliController.thaliList.length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final ThaliController thaliController = Get.put(ThaliController());
  final int index;

  FoodCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => BuyFoodScreen(food: food),
      //   ),
      // ),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),

                    // image: DecorationImage(
                    //   image: NetworkImage(food['foodImage']),
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: thaliController.thaliList[index].thaliImage,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      thaliController.thaliList[index].thaliName,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "₹ ${thaliController.thaliList[index].thaliPrice}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Iconsax.star5,
                        color: Colors.yellow.shade700, size: 20),
                    const SizedBox(width: 5),
                    Text(
                      "4/5",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "(26 Reviews)",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade400,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
