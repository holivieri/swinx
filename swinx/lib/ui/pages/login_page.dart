import 'package:flutter/material.dart';
import 'package:swinx/ui/widgets/backgrounds/triangle_background.dart';
import 'package:swinx/ui/widgets/login_form.dart';
import 'package:swinx/utils/color.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TriangleBackground(
            color: themeBlue,
          ),
          const Center(child: LoginForm()),
        ],
      ),
    );
  }
}
