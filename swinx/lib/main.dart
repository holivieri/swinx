import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:swinx/models/user_preferences.dart';
import 'package:swinx/ui/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initConfiguration() async {
    UserPreferences prefs = UserPreferences();
    prefs.init();

    await dotenv.load(fileName: '.env');

    prefs.apiUrl = 'https://localhost:44375/api/v1/';
  }

  @override
  void initState() {
    super.initState();
    initConfiguration();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SwinX',
      home: LoginPage(),
    );
  }
}
