import 'package:flutter/material.dart';
import 'package:food_example/models/category.dart';
import 'package:get/get.dart';
import 'package:food_example/constants.dart';

import '../controllers/categoriesController.dart';

class Categories extends StatelessWidget {
  final String currentCat;

  const Categories({super.key, required this.currentCat});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.put(CategoryController());

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          thaliList.length,
          (index) => GestureDetector(
            // onTap: () => categoryController.selectCategory(catgories[index]),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(thaliList[index].thaliImage),
                    // You might need to adjust the radius and other properties according to your design
                    radius: 30,
                  ),
                  Text(
                    thaliList[index].thaliName,
                    style: customTextStyle,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
