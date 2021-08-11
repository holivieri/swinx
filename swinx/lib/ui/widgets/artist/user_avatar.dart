import 'package:flutter/material.dart';
import 'package:swinx/utils/text_style.dart';

import '../circle_avatar.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    required this.artistName,
    required this.pictureUrl,
    Key? key,
  }) : super(key: key);

  final String artistName;
  final String pictureUrl;

  @override
  Widget build(BuildContext context) {
    return _returnArtistInfo();
  }

  Widget _returnArtistInfo() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatarWidget(
              pictureUrl: pictureUrl,
              radiusSize: 20,
            ),
            const SizedBox(width: 10),
            Text(
              artistName,
              style: userNameTextStyle,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
