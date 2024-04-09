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

    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            catgories.length,
            (index) => GestureDetector(
              onTap: () => categoryController.selectCategory(catgories[index]),
              child: Container(
                decoration: BoxDecoration(
                  color: categoryController.selectedCategory.value ==
                          catgories[index]
                      ? kprimaryColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                margin: const EdgeInsets.only(right: 20),
                child: Text(
                  catgories[index],
                  style: TextStyle(
                    color: categoryController.selectedCategory.value ==
                            catgories[index]
                        ? Colors.white
                        : Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
