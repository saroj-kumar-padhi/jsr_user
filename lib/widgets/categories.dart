import 'package:flutter/material.dart';
import 'package:food_example/controllers/thaliController.dart';
import 'package:food_example/models/category.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  final String currentCat;

  const Categories({super.key, required this.currentCat});

  @override
  Widget build(BuildContext context) {
    ThaliController thaliController = Get.put(ThaliController());

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: FutureBuilder(
        future:
            thaliController.fetchThaliData(), // Call the method to fetch data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for data, show a loading indicator
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If an error occurs during data fetching, display an error message
            return const Center(child: Text('Error fetching data'));
          } else {
            // Once data is fetched, build the row of items dynamically
            return Row(
              children: List.generate(
                thaliController.thaliList.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            thaliController.thaliList[index].thaliImage),
                        // You might need to adjust the radius and other properties according to your design
                        radius: 30,
                      ),
                      Text(
                        thaliController.thaliList[index].thaliName,
                        style: customTextStyle,
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
