import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:food_example/widgets/customize_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCatagoryDetail extends StatelessWidget {
  final String type;
  final DatabaseReference ref = FirebaseDatabase.instance.ref('Menu');
  final FirebaseAuth auth = FirebaseAuth.instance;

  FoodCatagoryDetail({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Food Details'),
          centerTitle: true,
        ),
        body: FirebaseAnimatedList(
          query: ref.orderByChild('food Type').equalTo(type),
          itemBuilder: (context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            if (snapshot.value != null) {
              final Map<dynamic, dynamic> data =
                  snapshot.value as Map<dynamic, dynamic>;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                                // image: DecorationImage(image: data['food image']),
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.network(
                              data['food image'],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Name: ${data['food name']?.toString() ?? 'N/A'}',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Day:  ${data['food day']?.toString() ?? 'N/A'}',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Type:  ${data['food Type']?.toString() ?? 'N/A'}',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Price:  ${data['food price']?.toString() ?? 'N/A'} rs',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            'Description',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            '${data['food des']?.toString() ?? 'N/A'}',
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomizeButton(
                                onPressed: () {
                                  Get.back();
                                },
                                text: 'Cancel',
                                bgColor: Colors.red,
                                textColor: Colors.black),
                            CustomizeButton(
                                onPressed: () {
                                  // Save order to Firebase
                                  DatabaseReference ordersRef =
                                      FirebaseDatabase.instance.ref('Orders');
                                  ordersRef.push().set({
                                    'userId': auth.currentUser?.uid,
                                    'foodName': data['food name'],
                                    'foodDay': data['food day'],
                                    'foodType': data['food Type'],
                                    'foodPrice': data['food price'],
                                    'foodImage': data['food image'],
                                    'foodDes': data['food des'],
                                    'timestamp': DateTime.now().toString(),
                                  }).then((_) {
                                    Get.snackbar('Order',
                                        'Your order has been placed successfully.',
                                        backgroundColor: Colors.white);
                                    Get.back();
                                  }).catchError((error) {
                                    Get.snackbar('Error',
                                        'Failed to place order. Please try again.',
                                        backgroundColor: Colors.white);
                                  });
                                },
                                text: 'Order',
                                bgColor: Colors.green,
                                textColor: Colors.black),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                  child: Text(
                'Item not found.',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ));
            }
          },
        ));
  }
}
