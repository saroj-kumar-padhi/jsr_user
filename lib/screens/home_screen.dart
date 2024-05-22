import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_example/screens/absentee.dart';
import 'package:food_example/screens/drawer/contact_us.dart';
import 'package:food_example/screens/drawer/order.dart';
import 'package:food_example/screens/drawer/plan&price.dart';
import 'package:food_example/screens/foodCategory.dart';
import 'package:food_example/screens/main_screen.dart';
import 'package:food_example/screens/otpPage.dart';
import 'package:food_example/screens/phone.dart';
import 'package:food_example/screens/settings.dart';
import 'package:food_example/screens/singleFood.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MESS",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 156, 243, 201),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://www.w3schools.com/howto/img_avatar.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Suraj',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Suraj@example.com',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Home',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Get.to(MyMainScreen());
                // Navigate to home screen
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(
                'Profile',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Get.to(MySettings());
                // Navigate to profile screen
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_support),
              title: Text(
                'Contact us',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Get.to(ContactUSPage());
                // Navigate to profile screen
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text(
                'Orders',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Get.to(OrderPage());
                // Navigate to orders screen
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Plan & Price',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Get.to(PlanPricePage());
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Get.to(MySettings());
                // Navigate to settings screen
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // SizedBox(height: size.height * .17,
            //  child: _buildProfileCard(size)),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView(
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                _buildProfileCard(size),
                SizedBox(
                  height: size.height * 0.01,
                ),
                InkWell(
                  // onTap: () {
                  //   Get.to(const FoodCategory());
                  // },

                  onTap: () async {
                    if (FirebaseAuth.instance.currentUser != null) {
                      Get.to(const FoodCategory());
                    } else {
                      Fluttertoast.showToast(
                        msg:
                            "To use services of app first you should create account.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey[600],
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      Get.to(LogIn());
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Adjust the radius as needed
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.2,
                          width: size.width,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://media.istockphoto.com/id/1457979959/photo/snack-junk-fast-food-on-table-in-restaurant-soup-sauce-ornament-grill-hamburger-french-fries.webp?b=1&s=170667a&w=0&k=20&c=A_MdmsSdkTspk9Mum_bDVB2ko0RKoyjB7ZXQUnSOHl0="),
                              fit: BoxFit
                                  .cover, // Adjust the fit as per your requirement
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Today's Menu",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    if (FirebaseAuth.instance.currentUser != null) {
                      Get.to(const SingleFood());
                    } else {
                      Fluttertoast.showToast(
                        msg:
                            "To use services of app first you should create account.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey[600],
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      Get.to(LogIn());
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Adjust the radius as needed
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.2,
                          width: size.width,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTg-o_iSkPj2T2vR9YBAjlWduYeeaFkFjUPEg&s"),
                              fit: BoxFit
                                  .cover, // Adjust the fit as per your requirement
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Extra Services",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    if (FirebaseAuth.instance.currentUser != null) {
                      Get.to(const AbsenteePage());
                    } else {
                      Fluttertoast.showToast(
                        msg:
                            "To use services of app first you should create account.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey[600],
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      Get.to(LogIn());
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Adjust the radius as needed
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.2,
                          width: size.width,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.shutterstock.com/image-vector/poor-attendance-work-2d-vector-600nw-2081359120.jpg"),
                              fit: BoxFit
                                  .cover, // Adjust the fit as per your requirement
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Absentee Mark",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

Widget _buildProfileCard(Size size) {
  return Center(
    child: Card(
      elevation: 10,
      shadowColor: Colors.black,
      color: Colors.greenAccent,
      child: SizedBox(
        width: size.width,
        height: size.height * .13,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CircleAvatar(
                      backgroundColor: Colors.cyan[200],
                      radius:
                          25, // Adjust this radius to make the avatar smaller
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1511367461989-f85a21fda167?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
                        radius:
                            25, // Match the radius of the outer CircleAvatar
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "chief suraj",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: const Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 70),
                        child: Text(
                          "6280644889",
                          style: TextStyle(fontSize: 14),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 27),
                      child: Row(
                        children: [
                          Text(
                            "Plan Exp:",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("2024-05-12",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
