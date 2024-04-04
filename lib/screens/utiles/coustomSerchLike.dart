import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeSearchContainer extends StatelessWidget {
  const HomeSearchContainer({
    Key? key,
  }) : super(key: key);

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
            child: Container(
              // Replace TextField with Container
              decoration: BoxDecoration(
                // Add your container decoration here
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Search any food",
                style: TextStyle(
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
