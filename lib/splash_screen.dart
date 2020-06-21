import 'dart:async';

import 'package:flutter/material.dart';


class Splash_Screen extends StatefulWidget {
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {



    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 4),
          () => navigationPage(),
    );
  }

  void navigationPage() async{
    Navigator.of(context).pushReplacementNamed('/welcome');
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return  Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white70,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 200.0),
                ),
                Image(
                  width: 400,
                  height: 400,
                  image: AssetImage(
                    "assets/logo.png",
                  ),
                ),
                Expanded(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.cyan[800]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

    );
  }
}
