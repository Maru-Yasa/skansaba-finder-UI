import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skansaba_finder/providers/auth.dart';
import 'package:skansaba_finder/providers/barang.dart';
import 'screens/home_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'style.dart';

import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProvider(create: (context) => BarangProvider())
      ],
      child: MaterialApp(
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
        },
        initialRoute: HomeScreen.routeName,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: const TextTheme(
              headline1: headline1Style,
              headline2: headline2Style,
              headline3: headline3Style,
              bodyText1: bodyText1Style,
            )),
      ),
    );
  }
}
