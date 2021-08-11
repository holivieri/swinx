import 'package:flutter/material.dart';
import 'package:swinx/utils/text_style.dart';

import '../circle_avatar.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    required this.userName,
    required this.pictureUrl,
    Key? key,
  }) : super(key: key);

  final String userName;
  final String pictureUrl;

  @override
  Widget build(BuildContext context) {
    return _returnUserInfo();
  }

  Widget _returnUserInfo() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            userName,
            style: userNameTextStyle,
          ),
          const SizedBox(width: 10),
          CircleAvatarWidget(
            pictureUrl: pictureUrl,
            radiusSize: 20,
          ),
        ],
      ),
    );
  }
}
