import 'package:flutter/material.dart';
import 'package:food_example/constants.dart';
import 'package:food_example/screens/home_screen.dart';
import 'package:food_example/controllers/mainScreenController.dart';
import 'package:food_example/screens/settings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyMainScreen extends StatelessWidget {
  MyMainScreen({super.key});

  List screens = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const MySettings(),
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
                          ? Iconsax.shopping_cart
                          : Iconsax.shopping_cart,
                      color: mainScreenController.currentTab.value == 1
                          ? kprimaryColor
                          : Colors.grey,
                    ),
                  ),
                  Obx(
                    () => Text(
                      "Cart",
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
                          ? Icons.person
                          : Icons.person,
                      color: mainScreenController.currentTab.value == 2
                          ? kprimaryColor
                          : Colors.grey,
                    ),
                  ),
                  Obx(
                    () => Text(
                      "Profile",
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
