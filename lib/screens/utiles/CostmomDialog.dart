import 'package:flutter/material.dart';
import 'package:food_example/controllers/authController.dart';
import 'package:food_example/screens/phone.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInDialog extends StatelessWidget {
  final String title;
  final String subTitle;

  const SignInDialog({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return GestureDetector(
      onTap: () {
        // This will dismiss the keyboard when tapping outside the dialog
        FocusScope.of(context).unfocus();
      },
      child: Dialog(
        // Dialog widget
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  //Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.amber,
                            backgroundColor: Colors.white,
                            minimumSize: const Size(0, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Get.back(); // Close the dialog
                          },
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(0, 45),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            title == 'Sign Out'
                                ? authController.logOut()
                                : Get.to(() =>
                                    const LogIn()); // Navigate to the login screen
                          },
                          child: title == 'Sign Out'
                              ? const Text('Sign Out')
                              : const Text("Sign In"),
                        ),
                      ),
                    ],
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
