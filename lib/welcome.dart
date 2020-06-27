import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';


class Welcome extends StatefulWidget {
  Welcome({Key key, this.uid})
      : super(key: key); //update this to include the uid in the constructor
  final String uid;
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(1.0), BlendMode.dstATop),
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: DoubleBackToCloseApp(
            snackBar: SnackBar(
              content: Text('Tap back again to leave'),
            ),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 310.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Text(
                          "WELCOME TO",
                          style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      'A one-Stop Solution for All\n your healthcare needs',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 80, right: 80),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white70,
                          Colors.white70,
                        ],
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/landingpage');
                      },
                      child: Text(
                        "Continue",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
