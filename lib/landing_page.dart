import 'package:flutter/material.dart';
import 'package:g2h_medtech/home.dart';
import 'package:g2h_medtech/services/auth.dart';
import 'package:g2h_medtech/welcome.dart';
import 'package:provider/provider.dart';
import 'authentication/sign_in.dart';
import 'model/user.dart';


class LandingPage extends StatelessWidget {
  TextEditingController adminController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              print("A");
              return SignInPage();
            }
            else{
              print("B");
              return  Provider<User>.value(
                  value: user,
                  child: Home());
            }

          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
