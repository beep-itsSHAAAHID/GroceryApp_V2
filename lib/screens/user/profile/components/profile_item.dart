import 'package:flutter/material.dart';
import 'package:grocery_app_2022/styles/app_layout.dart';
import 'package:unicons/unicons.dart';

import '../../../../styles/styles.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        height: AppLayout.getHeight(50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Styles.secondaryColor.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Styles.primaryColor,
            ),
            SizedBox(width: AppLayout.getWidth(10)), // Adjusted spacing here
            Text(
              title,
              style: Styles.textStyle,
            ),
            const Spacer(),
            Icon(
              UniconsLine.angle_right_b,
              color: Styles.orangeColor,
            ),
          ],
        ),
      ),
    );
  }
}
