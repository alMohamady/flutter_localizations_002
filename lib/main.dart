import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterlacalization002/localization/set_localization.dart';
import 'package:flutterlacalization002/routs/custom_route.dart';
import 'package:flutterlacalization002/routs/route_names.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Locale _local;

  void setLocale(Locale locale) {
    setState(() {
      _local = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: CustomRoute.allRoutes,
      initialRoute: homeRoute,
      locale: _local,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'EG')
      ],
      localizationsDelegates: [
        SetLocalization.localizationsDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocal, supportedLocales) {
        for(var local in supportedLocales) {
          if(local.languageCode == deviceLocal.languageCode && local.countryCode == deviceLocal.countryCode) {
            return deviceLocal;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}

