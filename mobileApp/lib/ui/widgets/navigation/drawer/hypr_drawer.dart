import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:swinx/utils/color.dart';

import 'drawer_item.dart';

class HyprDrawer extends StatefulWidget {
  const HyprDrawer({Key? key}) : super(key: key);

  @override
  _HyprDrawerState createState() => _HyprDrawerState();
}

class _HyprDrawerState extends State<HyprDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: const BoxDecoration(
        color: themeBoxBlue,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)],
      ),
      child: Column(
        children: [
          const SizedBox(height: 50),
          DrawerItem('videos'.tr, Icons.play_arrow_outlined),
          const Divider(color: Colors.white),
          DrawerItem('shop'.tr, Icons.shopping_cart),
          const Divider(color: Colors.white),
          DrawerItem('settings'.tr, Icons.settings),
          const Divider(color: Colors.white),
          DrawerItem('inviteFriends'.tr, FontAwesomeIcons.shareAltSquare),
          const Divider(color: Colors.white),
          DrawerItem('logout'.tr, FontAwesomeIcons.signOutAlt),
        ],
      ),
    );
  }
}
