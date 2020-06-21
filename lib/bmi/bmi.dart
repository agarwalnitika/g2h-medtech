import 'package:flutter/material.dart';
import 'package:g2h_medtech/bmi/screens/input_page.dart';





class BMICalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF000000),
        scaffoldBackgroundColor: Color(0xFF000000),
      ),
      home: InputPage(),
    );
  }
}
