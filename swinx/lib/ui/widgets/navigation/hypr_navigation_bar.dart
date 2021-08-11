import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:swinx/providers/nav_provider.dart';

import 'hypr_navbar_mobile.dart';
import 'hypr_navbar_tablet.dart';
import 'hypr_navbar_web.dart';

class HyprAppBarTabMenu extends StatelessWidget {
  const HyprAppBarTabMenu({required this.items, required this.onSelectTab});

  final ValueChanged<String> onSelectTab;
  final List<NavTab> items;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: items
            .map((navTab) => GestureDetector(
                onTap: () => {onSelectTab(navTab.rootName)},
                child: Container(
                  margin: const EdgeInsetsDirectional.only(end: 10),
                  child: navTab.icon,
                )))
            .toList(),
      );
}

class HyprAppBar extends StatelessWidget {
  const HyprAppBar({required this.tabMenu});
  final HyprAppBarTabMenu tabMenu;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const NavigationBarMobile(),
      tablet: NavigationBarTablet(
        tabMenu: tabMenu,
      ),
      desktop: NavigationBarWeb(
        tabMenu: tabMenu,
      ),
    );
  }
}
