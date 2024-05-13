import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCategory extends StatelessWidget {
  const FoodCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15.0), // Adjust the radius as needed
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
                    "Breakfast",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Paratha,Chole,Dal,Pickle",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * .04,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15.0), // Adjust the radius as needed
              ),
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.2,
                    width: size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?cs=srgb&dl=pexels-chanwalrus-958545.jpg&fm=jpg"),
                        fit: BoxFit
                            .cover, // Adjust the fit as per your requirement
                      ),
                    ),
                  ),
                  Text(
                    "Lunch",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Rice,Dal,Panner,Curd,Pickle",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .04,
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
                                  "https://media.istockphoto.com/id/1457979959/photo/snack-junk-fast-food-on-table-in-restaurant-soup-sauce-ornament-grill-hamburger-french-fries.webp?b=1&s=170667a&w=0&k=20&c=A_MdmsSdkTspk9Mum_bDVB2ko0RKoyjB7ZXQUnSOHl0="),
                              fit: BoxFit
                                  .cover, // Adjust the fit as per your requirement
                            ),
                          ),
                        ),
                        Text(
                          "Dinner",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Chole Bhature,chesse cake",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
