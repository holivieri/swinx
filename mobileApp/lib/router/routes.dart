import 'package:flutter/material.dart';
import 'package:swinx/ui/pages/home_page.dart';

const String homeRoute = 'home';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    homeRoute: (BuildContext context) => HomePage(),
  };
}
