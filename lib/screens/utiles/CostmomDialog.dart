import 'package:flutter/material.dart';
import 'package:food_example/screens/phone.dart';
import 'package:get/get.dart';

class SignInDialog extends StatelessWidget {
  const SignInDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  const Text(
                    "Sign In",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "To enable this feature you have to sign in",
                    textAlign: TextAlign.center,
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
                            Get.to(() =>
                                const LogIn()); // Navigate to the login screen
                          },
                          child: const Text('Sign In'),
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
