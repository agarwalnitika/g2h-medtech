import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g2h_medtech/bmi/bmi.dart';
import 'package:g2h_medtech/drawer/contact_us.dart';

import 'feedback.dart';
import 'helpline.dart';


class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  FirebaseUser currentUser;

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    currentUser = await FirebaseAuth.instance.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Container(
      color: Colors.cyan[800],
      width: 320.0,
      child: ListView(
        children: <Widget>[
          Container(
            height: 120,
            color: Colors.black,
            child: UserAccountsDrawerHeader(
              accountName: Text(
                'G2.HOS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
                textAlign: TextAlign.left,
              ),
              decoration: BoxDecoration(
                image: null,
              ),
            ),
          ),
          Container(
            color: Colors.cyan[800],
            child: ListTile(
              title: Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),

          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.assignment,
                color: Colors.black,
              ),
              title: Text(
                'BMI Calculator',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BMICalc()),
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.mail,
                color: Colors.black,
              ),
              title: Text(
                'Feedback',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Rating()),
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.mail,
                color: Colors.black,
              ),
              title: Text(
                'Contact Us',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contactform()),
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.call,
                color: Colors.black,
              ),
              title: Text(
                'COVID Helpline',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Helpline()),
                );
              },
            ),
          ),

          Image.asset("assets/ad.jpg"),
        ],
      ),
    );
  }
}
