import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_example/constants.dart';
import 'package:food_example/screens/utiles/CostmomDialog.dart';
import 'package:food_example/screens/utiles/bigUserCard.dart';

class MySettings extends StatelessWidget {
  const MySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            // User card
            const CustBigUserCard(
              backgroundColor: kprimaryColor,
              userName: "6280644889",
              userProfilePic: AssetImage(
                "assets/images/profile.png",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.bubble_left_bubble_right_fill,
                  iconStyle: IconStyle(),
                  title: 'Notifications',
                  subtitle: "Your's Notification",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.history,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'History',
                  subtitle: "Your's History",
                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About',
                  subtitle: "Learn more about JSR User 'App",
                ),
              ],
            ),
            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const SignInDialog(
                            title: 'Sign Out',
                            subTitle: "Are you sure you want to sign out?",
                          );
                        });
                  },
                  icons: Icons.exit_to_app_rounded,
                  title: "Sign Out",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.delete_solid,
                  title: "Privacy Policy",
                  titleStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
