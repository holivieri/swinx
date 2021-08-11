import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:swinx/ui/pages/home_page.dart';
import 'package:swinx/utils/color.dart';

class HyprBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _returnBottomNavigationBar();
  }

  Widget _returnBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: themeBlue,
      //fixedColor: themeBlue,
      items: [
        BottomNavigationBarItem(
          icon: _returnDiscoveryButton(),
          label: 'discovery'.tr,
        ),
        BottomNavigationBarItem(
          icon: _returnTribesButton(),
          label: 'tribes'.tr,
        ),
        BottomNavigationBarItem(
          icon: _returnMusicButton(),
          label: 'music'.tr,
        ),
        BottomNavigationBarItem(
          icon: _returnMovementsButton(),
          label: 'movements'.tr,
        ),
      ],
    );
  }

  Widget _returnDiscoveryButton() {
    return GestureDetector(
      onTap: () {
        Get.to(HomePage());
      },
      child: Container(
        height: 48,
        width: 48,
        child: SvgPicture.asset('assets/images/icons/discovery_white_icon.svg'),
      ),
    );
  }

  Widget _returnTribesButton() {
    return GestureDetector(
      onTap: () {
        // Get.to(TribesPage());
      },
      child: Container(
        height: 48,
        width: 48,
        child: SvgPicture.asset('assets/images/icons/tribes_icon.svg'),
      ),
    );
  }

  Widget _returnMusicButton() {
    return GestureDetector(
      onTap: () {
        Get.to(HomePage());
      },
      child: Container(
        height: 48,
        width: 48,
        child: SvgPicture.asset('assets/images/icons/music_icon.svg'),
      ),
    );
  }

  Widget _returnMovementsButton() {
    return GestureDetector(
      onTap: () {
        Get.to(HomePage());
      },
      child: Container(
        height: 48,
        width: 48,
        child: SvgPicture.asset('assets/images/icons/movement_icon.svg'),
      ),
    );
  }
}
