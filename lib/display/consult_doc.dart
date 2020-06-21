import 'package:flutter/material.dart';


import '../home.dart';



class Consult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child:  Image.asset(
                'assets/fin.png',
                width: 100,
                height: 100.0,
                fit: BoxFit.fill,
              ),
            ),
            title: Center(
              child: Text(
                "Consultation",
                style: TextStyle(
                  color: Colors.cyan[800],
                ),
              ),
            ),
            backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.message,
                  color: Colors.cyan[800],
                ),
                onPressed: null,
              ),
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.cyan[800],
                ),
                onPressed:() {

                },
              ),
            ],
          ),
          body: ListView(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 19.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                            "My Appointments",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.cyan[800],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 86.0),
                        child: Text(
                          "Meet Us",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.cyan[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.cyan[800],
                height: 50,
                child: Card(
                  color: Colors.cyan[800],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "See a Medical Doctor",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: my_card ('assets/background.jpg', 'Mental \nIllness'),
                  ),
                  SizedBox(width: 9),
                  Expanded(
                    child: my_card ('assets/background.jpg', 'Mental \nIllness'),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: my_card ('assets/background.jpg', 'Mental \nIllness'),
                  ),
                  SizedBox(width: 9),
                  Expanded(
                    child:  my_card ('assets/background.jpg', 'Mental \nIllness'),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: my_card ('assets/background.jpg', 'Mental \nIllness'),
                  ),
                  SizedBox(width: 9),
                  Expanded(
                    child:  my_card ('assets/background.jpg', 'Mental \nIllness'),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}



Widget my_card (String my_img, String my_txt) {
  return Container(
    margin: EdgeInsets.only( top: 9.0),
    constraints: new BoxConstraints.expand(
      height: 185.0,
      width: 186,
    ),
    alignment: Alignment.center,
    decoration: new BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          spreadRadius: 1,
          blurRadius: 9,
          offset: Offset(0, 7), // changes position of shadow
        ),
      ],
      image: new DecorationImage(
        image: new AssetImage(my_img),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: new Text(my_txt,
          style: new TextStyle(
            fontSize: 25.0,
            color: Colors.white,
          )),
    ),
  );
}
