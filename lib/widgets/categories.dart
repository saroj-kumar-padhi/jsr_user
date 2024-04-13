import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_example/controllers/thaliController.dart';

import 'package:get/get.dart';

import '../screens/thaliItems.dart';

class Categories extends StatelessWidget {
  final String currentCat;

  const Categories({super.key, required this.currentCat});

  @override
  Widget build(BuildContext context) {
    ThaliController thaliController = Get.put(ThaliController());

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: FutureBuilder(
        future: thaliController.fetchThaliData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          } else {
            return Row(
              children: List.generate(
                thaliController.thaliList.length,
                (index) => InkWell(
                  onTap: () {
                    Get.to(ThaliItems(
                      thaliItem: thaliController.thaliList[index],
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: thaliController.thaliList[index].thaliImage,
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: imageProvider,
                            radius: 50,
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          thaliController.thaliList[index].thaliName,
                        )
                      ],
                    ),
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
