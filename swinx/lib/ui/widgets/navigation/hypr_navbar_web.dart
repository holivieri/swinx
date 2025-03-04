import 'package:flutter/material.dart';

import 'drawer/drawer_button.dart';
import 'hypr_navigation_bar.dart';
import 'navbar_item.dart';
import 'navbar_logo_item.dart';
import 'user_info.dart';

class NavigationBarWeb extends StatelessWidget {
  const NavigationBarWeb({required this.tabMenu, Key? key}) : super(key: key);
  final HyprAppBarTabMenu tabMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              MyDrawerButton(),
              const NavBarLogo(),
              const NavBarItem(iconType: ItemType.search),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              tabMenu,
              const NavBarItem(iconType: ItemType.divider),
              const NavBarItem(iconType: ItemType.messages),
              const NavBarItem(iconType: ItemType.alerts),
              const UserInfo(
                userName: 'Janine Jameson',
                pictureUrl:
                    'https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_3.jpg',
              )
            ],
          )
        ],
      ),
    );
  }
}
