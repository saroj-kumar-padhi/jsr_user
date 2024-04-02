import 'package:flutter/material.dart';
import 'package:food_example/constants.dart';
import 'package:food_example/screens/home_screen.dart';
import 'package:food_example/controllers/mainScreenController.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List screens = [
    HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  MainScreenController mainScreenController = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => mainScreenController.currentTab.value = 0,
              child: Column(
                children: [
                  Obx(
                    () => Icon(
                      mainScreenController.currentTab.value == 0
                          ? Iconsax.home5
                          : Iconsax.home,
                      color: mainScreenController.currentTab.value == 0
                          ? kprimaryColor
                          : Colors.grey,
                    ),
                  ),
                  Obx(
                    () => Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 14,
                        color: mainScreenController.currentTab.value == 0
                            ? kprimaryColor
                            : Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () => mainScreenController.currentTab.value = 1,
              child: Column(
                children: [
                  Obx(
                    () => Icon(
                      mainScreenController.currentTab.value == 1
                          ? Iconsax.heart5
                          : Iconsax.heart,
                      color: mainScreenController.currentTab.value == 1
                          ? kprimaryColor
                          : Colors.grey,
                    ),
                  ),
                  Obx(
                    () => Text(
                      "Favorites",
                      style: TextStyle(
                        fontSize: 14,
                        color: mainScreenController.currentTab.value == 1
                            ? kprimaryColor
                            : Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () => mainScreenController.currentTab.value = 2,
              child: Column(
                children: [
                  Obx(
                    () => Icon(
                      mainScreenController.currentTab.value == 2
                          ? Iconsax.calendar_25
                          : Iconsax.calendar_2,
                      color: mainScreenController.currentTab.value == 2
                          ? kprimaryColor
                          : Colors.grey,
                    ),
                  ),
                  Obx(
                    () => Text(
                      "Meal Plan",
                      style: TextStyle(
                        fontSize: 14,
                        color: mainScreenController.currentTab.value == 2
                            ? kprimaryColor
                            : Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                mainScreenController.currentTab.value = 3;
              },
              child: Column(
                children: [
                  Obx(
                    () => Icon(
                      mainScreenController.currentTab.value == 3
                          ? Iconsax.setting5
                          : Iconsax.setting,
                      color: mainScreenController.currentTab.value == 3
                          ? kprimaryColor
                          : Colors.grey,
                    ),
                  ),
                  Obx(
                    () => Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 14,
                        color: mainScreenController.currentTab.value == 3
                            ? kprimaryColor
                            : Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Obx(() => screens[mainScreenController.currentTab.value]),
    );
  }
}
