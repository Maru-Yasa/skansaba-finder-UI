import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'style.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline1: headline1Style,
            headline2: headline2Style,
            headline3: headline3Style,
            bodyText1: bodyText1Style,
          )),
    );
  }
}
