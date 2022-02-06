import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'style.dart';

import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
      },
      initialRoute: '/',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            headline1: headline1Style,
            headline2: headline2Style,
            headline3: headline3Style,
            bodyText1: bodyText1Style,
          )),
    );
  }
}
