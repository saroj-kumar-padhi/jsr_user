import 'package:flutter/material.dart';

class CustBigUserCard extends StatelessWidget {
  final Color backgroundColor;
  final String userName;
  final ImageProvider userProfilePic;

  const CustBigUserCard({
    super.key,
    required this.backgroundColor,
    required this.userName,
    required this.userProfilePic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: userProfilePic,
          ),
          const SizedBox(height: 16),
          Text(
            userName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
