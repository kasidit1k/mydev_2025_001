import 'package:flutter/material.dart';
import 'package:myapp/src/pages/home/home_page.dart';
import 'package:myapp/src/pages/info/info_page.dart';

//route'

class AppRoute {
  static const homeRoute = '/home';
  static const infoRoute = '/info';

  final _route = <String, WidgetBuilder>{
    homeRoute: (context) => HomePage(),
    infoRoute: (context) => InfoPage(),
  };

  get getAll => _route;
}
