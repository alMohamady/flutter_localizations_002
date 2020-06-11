import 'package:flutter/material.dart';
import 'package:flutterlacalization002/pages/about_page.dart';
import 'package:flutterlacalization002/pages/home_page.dart';
import 'package:flutterlacalization002/pages/not_found_page.dart';
import 'package:flutterlacalization002/pages/settings_page.dart';
import 'package:flutterlacalization002/routs/route_names.dart';

class CustomRoute {

  static Route<dynamic> allRoutes(RouteSettings settings) {
       switch (settings.name) {
         case homeRoute:
           return MaterialPageRoute(builder: (_) => HomePage());
         case settingsRoute:
           return MaterialPageRoute(builder: (_) => SettingsPage());
         case aboutRoute:
           return MaterialPageRoute(builder: (_) => AboutPage());
       }
       return MaterialPageRoute(builder: (_) => NotFoundPage());
  }


}

