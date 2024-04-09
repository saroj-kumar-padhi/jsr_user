import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_example/constants.dart';
import 'package:hive/hive.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('myBox');
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Your's cart",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            box.get("index") != null
                ? Expanded(
                    child: AnimationLimiter(
                      child: ListView.builder(
                        itemCount: box.get("index"),
                        itemBuilder: (BuildContext context, int index) {
                          var data = box.get(index);
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: Dismissible(
                                  key: Key(data[
                                      'foodName']), // Unique key for each item
                                  onDismissed: (direction) {
                                    // Remove the item from the list when swiped
                                    box.delete(index);
                                    int currentIndex = box.get("index") ?? 0;
                                    box.put("index", currentIndex - 1);
                                  },
                                  background: Container(
                                    alignment: Alignment.centerRight,
                                    color: Colors.red,
                                    child: const Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Icon(Icons.delete,
                                          color: Colors.white),
                                    ),
                                  ),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    elevation: 5,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10),
                                      leading: CachedNetworkImage(
                                        imageUrl: data[
                                            'foodImage'], // Provide the image URL
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          width: 60,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image:
                                                  imageProvider, // Use the provided imageProvider
                                              fit: BoxFit
                                                  .cover, // Ensure the image covers the entire container
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CircularProgressIndicator(),
                                          // Placeholder widget while the image is loading
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons
                                                .error), // Widget to display in case of loading error
                                      ),
                                      title: Text(
                                        data['foodName'],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      trailing: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Text(
                                          '₹${data['price']}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : const Center(
                    child: Text("No items is added to your cart"),
                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
