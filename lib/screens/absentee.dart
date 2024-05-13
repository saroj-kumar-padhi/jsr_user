import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AbsenteePage extends StatefulWidget {
  const AbsenteePage({super.key});

  @override
  State<AbsenteePage> createState() => _AbsenteePageState();
}

class _AbsenteePageState extends State<AbsenteePage> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text("Absentee"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.38,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/avoidfood.jpg",
                fit: BoxFit.fill,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "Avoid Food Wastage ",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 8),
            child: Center(
              child: Text(
                "Food is a gift.Lets work together to ensure that every mouth is fed and no food goes to waste. ",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 8),
            child: Text(
              "15/5/2024",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            "Check if you are absent for following",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Checkbox(
                  value: this.value,
                  onChanged: (bool? value) {},
                ), //
                Text(
                  "Not having BREAKFAST today(Morning) ",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: Center(
              child: Row(
                children: [
                  Checkbox(
                    value: this.value,
                    onChanged: (bool? value) {},
                  ),
                  Text(
                    "  Not having LUNCH today(Afternoon) ",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: Center(
              child: Row(
                children: [
                  Checkbox(
                    value: this.value,
                    onChanged: (bool? value) {},
                  ),
                  Text(
                    "  Not having DINNER today(Night) ",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Submit",
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  // side: BorderSide(color: Colors.yellow, width: 5),
                  textStyle: TextStyle(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
