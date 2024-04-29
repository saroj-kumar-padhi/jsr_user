import 'package:flutter/material.dart';
import 'package:food_example/screens/foodCategory.dart';
import 'package:food_example/screens/singleFood.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: size.height * .17, child: _buildProfileCard(size)),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView(
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const FoodCategory());
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
                        Text(
                          "Today's Menu",
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
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
                  onTap: () {
                    Get.to(const SingleFood());
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
                        Text(
                          "Extra Services",
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
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
                      Text(
                        "Absentee Mark",
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
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
        height: size.height * .16,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                    padding: EdgeInsets.only(left: 20),
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
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 70),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "6280644889",
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 27),
                    child: Row(
                      children: [
                        Text(
                          "Plan Exp : ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("2024-05-12",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
