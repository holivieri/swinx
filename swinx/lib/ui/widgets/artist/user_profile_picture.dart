import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../circle_button.dart';

Widget userProfilePicture(
  BuildContext context,
  String? imageUrl,
) {
  return Stack(
    children: [
      Image.network(
        imageUrl ??
            'https://artsmidnorthcoast.com/wp-content/uploads/2014/05/no-image-available-icon-6.png',
        fit: BoxFit.cover,
        height: 400,
        width: Size.infinite.width,
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: CircleButton(
          icon: Icons.chevron_left_sharp,
          backgroundColor: themeBoxBlue,
          onTap: () {
            Navigator.pushNamed(context, 'home');
          },
        ),
      ),
    ],
  );
}
