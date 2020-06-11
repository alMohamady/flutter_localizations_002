import 'package:flutter/material.dart';
import 'package:flutterlacalization002/routs/custom_route.dart';
import 'package:flutterlacalization002/routs/route_names.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: CustomRoute.allRoutes,
      initialRoute: homeRoute,
    );
  }
}
