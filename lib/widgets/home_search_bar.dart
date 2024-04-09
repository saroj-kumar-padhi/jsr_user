import 'package:flutter/material.dart';
import 'package:food_example/controllers/serchController.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeSearchBar extends StatelessWidget {
  final SerchController serchController = Get.put(SerchController());
  HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: Row(
        children: [
          const Icon(Iconsax.search_normal),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: serchController.serchController,
              onChanged: (value) {
                if (value != "") {
                  serchController.performSearch(value);
                }
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search any food",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
