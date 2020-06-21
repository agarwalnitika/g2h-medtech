import 'package:flutter/material.dart';
import 'package:g2h_medtech/animations/fade_animation.dart';
import '../home.dart';

class Contactform extends StatefulWidget {
  @override
  _ContactformState createState() => _ContactformState();
}

class _ContactformState extends State<Contactform> {
  String _email;
  String _password;

  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Colors.cyan[900],
        body: SingleChildScrollView(
          child: Container(
            height: 900,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 80,
                  left: 10,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 35,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 800,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            child: FadeAnimation(
                              1.6,
                              Container(
                                margin: EdgeInsets.only(bottom: 600),
                                child: Center(
                                  child: Text(
                                    "Contact Form",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      inherit: false,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 200.0, right: 15.0, left: 15.0),
                              child: Column(
                                children: <Widget>[
                                  FadeAnimation(
                                    1.8,
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  143, 148, 251, .2),
                                              blurRadius: 20.0,
                                              offset: Offset(0, 10))
                                        ],
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color:
                                                            Colors.grey[100]))),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Name",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[400])),
                                              onChanged: (value) {
                                                setState(() {
                                                  _email = value;
                                                });
                                              },
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color:
                                                            Colors.grey[100]))),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Email ID",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[400])),
                                              onChanged: (value) {
                                                setState(() {
                                                  _email = value;
                                                });
                                              },
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color:
                                                            Colors.grey[100]))),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Phone No.",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[400])),
                                              onChanged: (value) {
                                                setState(() {
                                                  _email = value;
                                                });
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8.0),
                                            height: 150,
                                            padding: EdgeInsets.only(
                                                left: 8.0, top: 50),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "Write your query here",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[400])),
                                              onChanged: (value) {
                                                setState(() {
                                                  _password = value;
                                                });
                                              },
                                              obscureText: true,
                                            ),
                                          ),
                                          CheckboxListTile(
                                            title: Text("Callback Required?"),
                                            value: checkedValue,
                                            onChanged: (bool newValue) {
                                              setState(() {
                                                checkedValue = newValue;
                                              });
                                            },
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            activeColor: Colors.teal[
                                                800], //  <-- leading Checkbox
                                          ),
                                          Container(
                                            height: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(
                                                      240, 240, 240, .8),
                                                  Color.fromRGBO(
                                                      240, 240, 240, .7),
                                                ],
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Send",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
