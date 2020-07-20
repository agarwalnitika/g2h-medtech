import 'package:flutter/material.dart';
import 'package:g2h_medtech/display/display.dart';

import 'package:g2h_medtech/screens/my_account.dart';
import 'package:g2h_medtech/upload/upload.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  
}

class _HomeState extends State<Home> {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }




  static List<dynamic> _widgetOptions = <Widget>[
    Display(),
    Upload(),
    MyAccount(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.file_upload),
            title: Text('Upload'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('My Account'),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
}
