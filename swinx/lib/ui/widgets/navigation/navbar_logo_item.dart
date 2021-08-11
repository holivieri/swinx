import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({this.padding = 20, Key? key}) : super(key: key);
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      height: 80,
      child: SvgPicture.asset('assets/images/logo/Logo.svg'),
    );
  }
}
