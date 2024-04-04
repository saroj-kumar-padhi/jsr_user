import 'package:flutter/material.dart';
import 'package:food_example/controllers/foodController.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class SerchController extends GetxController {
  final FoodController foodController = Get.find<FoodController>();
  final TextEditingController serchController = TextEditingController();
  RxList<Map<String, dynamic>> searchedData = <Map<String, dynamic>>[].obs;

  void performSearch(String searchTerm) {
    searchTerm = searchTerm.toLowerCase();
    // userData.clear();
    Logger().d(foodController.fetchedFoodItems);

    // Filter the userData list based on the search term
    List<Map<String, dynamic>> filteredUsers = foodController.fetchedFoodItems
        .where((user) => user['foodName'].toLowerCase().contains(searchTerm))
        .toList();

    // Update the UI with the filtered users
    searchedData.assignAll(filteredUsers);
  }
}
