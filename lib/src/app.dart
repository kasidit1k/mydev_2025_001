import 'package:flutter/material.dart';
import 'package:myapp/src/pages/home/home_page.dart';
import 'package:myapp/src/pages/info/info_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'home': (context) => HomePage(),
        'info': (context) => InfoPage(),
      },
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
