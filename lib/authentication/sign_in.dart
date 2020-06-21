import 'package:flutter/material.dart';
import 'package:g2h_medtech/animations/fade_animation.dart';
import 'package:g2h_medtech/common_widgets/custom_raised_button.dart';
import 'package:g2h_medtech/services/auth.dart';
import 'package:provider/provider.dart';

import 'create_account.dart';
import 'email_sign_in.dart';

class SignInPage extends StatelessWidget {
  TextEditingController adminController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: _buildContent(context),
    );
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signInAnonymously();
    } catch (e) {
      print('${e.toString()}');
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (context) => EmailSignIn(),
      fullscreenDialog: true,
    ));
  }

  void _createAccount(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (context) => CreateAccount(),
      fullscreenDialog: true,
    ));
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      height: 900,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 30,
            width: 80,
            height: 200,
            child: FadeAnimation(
              1,
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/light-1.png'))),
              ),
            ),
          ),
          Positioned(
            left: 140,
            width: 80,
            height: 150,
            child: FadeAnimation(
                1.3,
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/light-2.png'))),
                )),
          ),
          Positioned(
            right: 40,
            top: 40,
            width: 80,
            height: 150,
            child: FadeAnimation(
              1.5,
              Container(
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/clock.png'))),
              ),
            ),
          ),
          Positioned(
            child: FadeAnimation(
              1.6,
              Container(
                margin: EdgeInsets.only(bottom: 380),
                child: Center(
                  child: Text(
                    "Login",
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
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 220),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 120.0,
                ),

                CustomRaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(
                        'assets/email.png',
                        height: 30,
                        width: 30,
                      ),
                      Text(
                        'Sign in with Email',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15.0,
                        ),
                      ),
                      Opacity(
                          opacity: 0.0,
                          child: Image.asset(
                            'assets/google.png',
                            height: 30,
                            width: 30,
                          )),
                    ],
                  ),
                  color: Colors.grey[300],
                  onPressed: () {
                    _signInWithEmail(context);
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                CustomRaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(
                        'assets/anonymous.png',
                        height: 30,
                        width: 30,
                      ),
                      Text(
                        'Go Anonymous',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15.0,
                        ),
                      ),

                      Opacity(
                          opacity: 0.0,
                          child: Image.asset(
                            'assets/google.png',
                            height: 30,
                            width: 30,
                          )),
                    ],
                  ),
                  color: Colors.grey[300],
                  onPressed: () {
                    _signInAnonymously(context);
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                CustomRaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(
                        'assets/create.png',
                        height: 30,
                        width: 30,
                      ),
                      Text(
                        'Create Account',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15.0,
                        ),
                      ),
                      Opacity(
                          opacity: 0.0,
                          child: Image.asset(
                            'assets/google.png',
                            height: 30,
                            width: 30,
                          )),
                    ],
                  ),
                  color: Colors.grey[300],
                  onPressed: () {
                    _createAccount(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
