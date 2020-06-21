import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g2h_medtech/landing_page.dart';
import 'package:g2h_medtech/services/auth.dart';
import 'package:g2h_medtech/splash_screen.dart';
import 'package:g2h_medtech/welcome.dart';
import 'package:provider/provider.dart';

import 'home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Provider<AuthBase>(
        builder: (context) => Auth(),
        child: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.teal,
            ),
            debugShowCheckedModeBanner: false,
            title: "G2H Medtech",
            home: Splash_Screen(),
            routes: <String, WidgetBuilder>{
              '/home': (BuildContext context) => Home(),
              '/landingpage' :(BuildContext context) => LandingPage(),
              '/welcome': (BuildContext context) => Welcome(),
            }));
  }
}
