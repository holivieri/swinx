import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swinx/providers/app_provider.dart';
import 'package:swinx/providers/login_form_provider.dart';
import 'package:swinx/ui/widgets/backgrounds/triangle_background.dart';
import 'package:swinx/ui/widgets/login_form.dart';
import 'package:swinx/ui/widgets/page_content.dart';
import 'package:swinx/utils/color.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Scaffold(
        body: PageContent(
          appProvider: appProvider,
          content: Stack(
            children: [
              TriangleBackground(
                color: themeBlue,
              ),
              Center(
                child: LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
