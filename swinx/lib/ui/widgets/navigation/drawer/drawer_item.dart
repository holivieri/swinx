import 'package:flutter/material.dart';
import 'package:swinx/utils/font.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(this.title, this.icon);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        top: 15,
        bottom: 15,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 30),
          Text(
            title,
            style: mediumWhiteStyle,
          ),
        ],
      ),
    );
  }
}
