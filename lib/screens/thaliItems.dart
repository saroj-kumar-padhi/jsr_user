import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_example/constants.dart';
import 'package:food_example/controllers/thaliItemController.dart';

import 'package:food_example/models/thaliModel.dart';
import 'package:food_example/widgets/quick_screen_appbar.dart';
import 'package:get/get.dart';

class ThaliItems extends StatelessWidget {
  final ThaliModel thaliItem;
  final ThaliItemsController thaliItemsController =
      Get.put(ThaliItemsController());

  ThaliItems({super.key, required this.thaliItem});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const QuickScreenAppbar(),
            SizedBox(
              height: size.height * 0.5,
              child: ListView.builder(
                  itemCount: thaliItem.thaliItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(thaliItem.thaliItems[index]),
                        trailing: Obx(
                          () => Checkbox(
                            value: thaliItemsController.itemsList
                                .contains(thaliItem.thaliItems[index]),
                            onChanged: (bool? value) {
                              thaliItemsController
                                  .toggleItems(thaliItem.thaliItems[index]);
                            },
                          ),
                        ));
                  }),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kprimaryColor),
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size(size.width * 0.7, size.height * 0.05)),
                ),
                onPressed: () {
                  // Add your onPressed logic here
                },
                child: const Text(
                  'Proceed to Buy',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
