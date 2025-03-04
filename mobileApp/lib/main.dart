import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:swinx/models/user_preferences.dart';
import 'package:swinx/providers/app_provider.dart';
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
  }

  @override
  void initState() {
    super.initState();
    initConfiguration();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(
          create: (_) => AppProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SwinX',
        home: LoginPage(),
      ),
    );
  }
}
