import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanPricePage extends StatelessWidget {
  const PlanPricePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Plan & Price",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.21,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                elevation: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications,
                      size: 35,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Short Plan",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Short term guest plan",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "1500rs/-",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.21,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Card(
                elevation: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications,
                      size: 35,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Standard Plan",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Monthly plan with Lunch and Dinner",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "2800rs/-",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
