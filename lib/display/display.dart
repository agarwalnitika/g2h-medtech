import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:g2h_medtech/animations/typing.dart';
import 'package:g2h_medtech/drawer/drawer.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';
import 'consult_doc.dart';

String name;
String phone_no;
String service;
String city;

class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String _currentService;
  List<String> items = [
    'Critical Care',
    'Diabetes Care',
    'Elder Care',
    'Physiotherapy',
    'Medical Equipment',
    'Lab Test',
    'Nursing',
    'Trained Attendent',
    'Newborn Baby and Mother Care',
    'Doctor Consultation',
    'Nutrition and Diet Consultation',
    'Counselling',
  ];

  List<DropdownMenuItem<String>> serviceDropdown = <DropdownMenuItem<String>>[
  ];

  String dropdownValue = 'Critical Care';
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    _currentService;
    _getServices();
  }

  List<DropdownMenuItem<String>> getServicesDropDown() {
    List<DropdownMenuItem<String>> service = new List();

    for (int i = 0; i < items.length; i++) {
      setState(() {
        service.insert(
            0,
            DropdownMenuItem(
              child: Text(items[i]),
              value: items[i],
            ));
      });
    }

    return service;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(1), BlendMode.dstATop),
            image: AssetImage(
              "assets/background.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent.withOpacity(.4),
          key: _scaffoldKey,
          drawer: SideBar(),
          body: ListView(
            children: <Widget>[
              Container(
                width: 200,
                child: Card(
                  color: Colors.cyan[800],
                  child: Column(
                    children: <Widget>[
                      MaterialButton(
                        padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 30.0),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: IconButton(
                                icon: Icon(
                                  Icons.list,
                                ),
                                onPressed: () {
                                  _scaffoldKey.currentState.openDrawer();
                                }),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'G2.HOS',
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Consult()),
                                    );
                                  },
                                  child:
                                  circular_image('assets/stethoscope.jpg'),
                                ),
                                my_text(' Consult \n Doctor'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {},
                                  child: circular_image('assets/test.jpg'),
                                ),
                                my_text('Book a \n Test'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    StoreRedirect.redirect(
                                      androidAppId: "com.phonegap.rxpal",
                                    );
                                  },
                                  child: circular_image('assets/buy.jpg'),
                                ),
                                my_text('     Buy \nMedicine'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {},
                                  child: circular_image('assets/share.png'),
                                ),
                                my_text('  Share \nReports'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child:
                    my_card('   Health \nInsurance', Icons.local_hospital),
                  ),
                  Expanded(
                    child:
                    my_card('   Family \nInsurance', Icons.local_hospital),
                  ),
                  Expanded(
                    child:
                    my_card('      Life \nInsurance', Icons.local_hospital),
                  ),
                ],
              ),
              SizedBox(height: 20),
              FlatButton(
                onPressed: () {
                  launch("tel://+91-11-23978046");
                },
                child: TypingTextAnimation(),
              ),
              Container(
                color: Colors.transparent.withOpacity(.3),
                child: Center(
                  child: Card(
                    color: Colors.white.withOpacity(0.1),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          CarouselSlider(
                            autoPlay: false,
                            enlargeCenterPage: false,
                            height: 150,
                            viewportFraction: 1.0,
                            items: [0, 1].map((i) {
                              return Builder(builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration:
                                  BoxDecoration(color: Colors.white),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_back_ios,
                                              color: Colors.teal.shade800,
                                            ),
                                            onPressed: null),
                                      ),
                                      SizedBox(
                                        child: Text(
                                          '  Life Insurance  ',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.cyan.shade800,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Text(
                                          '  Medical Insurance  ',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.cyan.shade800,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.cyan.shade800,
                                            ),
                                            onPressed: null),
                                      ),
                                    ],
                                  ),
                                );
                              });
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent.withOpacity(.3),
                child: Card(
                  color: Colors.white.withOpacity(0.2),
                  child: CarouselSlider(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: Duration(seconds: 2),
                    enlargeCenterPage: true,
                    height: MediaQuery.of(context).size.height * 0.30,
                    items: [0, 1, 2, 3, 4].map((i) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width / 4 * 3,
                          decoration: BoxDecoration(
                              color: Colors.transparent.withOpacity(0.2)),
                          child: images(i),
                        );
                      });
                    }).toList(),
                  ),
                ),
              ),
              Container(
                height: 600,
                color: Colors.white70.withOpacity(0.7),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Text(
                        "Home Healthcare Services",
                        style: TextStyle(
                          color: Colors.cyan[900],
                          fontSize: 28,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: my_card1(
                                "\n ${items[0]}", Icons.account_circle, 0),
                          ),
                          Expanded(
                            child: my_card1(
                                "\n ${items[1]}", Icons.local_hospital, 0),
                          ),
                          Expanded(
                            child: my_card1(
                                "\n ${items[2]}", Icons.local_hospital, 0),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: my_card1(
                                "\n ${items[3]}", Icons.local_hospital, 0),
                          ),
                          Expanded(
                            child: my_card1("  Medical\nEquipment",
                                Icons.local_hospital, 4),
                          ),
                          Expanded(
                            child: my_card1(
                                "\n ${items[5]}", Icons.local_hospital, 0),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: my_card1(
                                "\n ${items[6]}", Icons.local_hospital, 0),
                          ),
                          Expanded(
                            child: my_card1(
                                "\n ${items[7]}", Icons.local_hospital, 0),
                          ),
                          Expanded(
                            child: my_card1("Newborn Baby &\n  Mother Care",
                                Icons.local_hospital, 4),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: my_card1("    Doctor\nConsultation",
                                Icons.local_hospital, 4),
                          ),
                          Expanded(
                            child: my_card1('Nutrition & Diet\n  Consultation',
                                Icons.local_hospital, 4),
                          ),
                          Expanded(
                            child: my_card1(
                                "\n ${items[11]}", Icons.local_hospital, 0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      child: Center(
                          child: RaisedButton(
                            color: Colors.yellow[600],
                            child: Text(
                              'Book Now',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.cyan[900],
                                      content: Stack(
                                        overflow: Overflow.visible,
                                        children: <Widget>[
                                          Positioned(
                                            right: -40.0,
                                            top: -40.0,
                                            child: InkResponse(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: CircleAvatar(
                                                child: Icon(Icons.close),
                                                backgroundColor: Colors.red,
                                              ),
                                            ),
                                          ),
                                          Form(
                                            key: _formKey,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Text(
                                                  "Home Services",
                                                  style: TextStyle(
                                                    color: Colors.grey[100],
                                                    fontSize: 30,
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              color: Colors
                                                                  .grey[100]))),
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        hintText: "Name",
                                                        hintStyle: TextStyle(
                                                            color: Colors.grey[400],
                                                            fontSize: 15)),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if (_formKey.currentState
                                                            .validate()) {
                                                          print(value);
                                                        }
                                                      });
                                                    },
                                                    validator: (value) {
                                                      if (value.isEmpty) {
                                                        return 'Please enter valid name';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) =>
                                                    name = value,
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              color: Colors
                                                                  .grey[100]))),
                                                  child: TextFormField(
                                                    cursorColor: Colors.grey[100],
                                                    maxLength: 10,
                                                    maxLengthEnforced: true,
                                                    keyboardType:
                                                    TextInputType.phone,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      hintText: "Phone No.",
                                                      hintStyle: TextStyle(
                                                          color: Colors.grey[400],
                                                          fontSize: 15),
                                                    ),
                                                    onChanged: (value) {
                                                      setState(() {});
                                                    },
                                                    validator: (value) {
                                                      if (value.isEmpty) {
                                                        return 'Please enter valid phone no.';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) =>
                                                    phone_no = value,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: DropdownButton(
                                                    value: _currentService,
                                                    items: serviceDropdown,
                                                    onChanged: changeSelectedService,
                                                  ),
                                                ),

                                                Container(
                                                  padding:
                                                  EdgeInsets.only(top: 8.0),
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              color: Colors
                                                                  .grey[100]))),
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        hintText: "City",
                                                        hintStyle: TextStyle(
                                                            color: Colors.grey[400],
                                                            fontSize: 15)),
                                                    onChanged: (value) {
                                                      setState(() {});
                                                    },
                                                    onSaved: (value) =>
                                                    city = value,
                                                    validator: (value) {
                                                      if (value.isEmpty) {
                                                        return 'Please enter valid city';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.all(8.0),
                                                  child: RaisedButton(
                                                    child: Text("Submit"),
                                                    onPressed: () {
                                                      if (_formKey.currentState
                                                          .validate()) {
                                                        print(name);
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                          context) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  "Home Services"),
                                                              content: Text(
                                                                  "Thank you for booking with us $name"),
                                                            );
                                                          },
                                                        );
                                                        _formKey.currentState
                                                            .save();

                                                      }
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getServices()  {

    setState(() {
      serviceDropdown = getServicesDropDown();
      _currentService = items[0];
    });
  }



  changeSelectedService(String selectedService) {
    setState(() {
      _currentService = selectedService;
    });
  }

}





Widget images(int number) {
  var my_img = [
    'assets/ad.jpg',
    'assets/ad1.jpg',
    'assets/ad2.jpg',
    'assets/ad3.jpg',
    'assets/ad5.jpg',
  ];
  return Center(
    child: Container(
      child: Image.asset(my_img[number], fit: BoxFit.cover),
    ),
  );
}




Widget insurance(int number) {
  var my_img = [
    'assets/insurance1.jpg',
    'assets/insurance2.jpg',
  ];
  return Center(
    child: Container(
      child: Image.asset(my_img[number], fit: BoxFit.fill),
    ),
  );
}

Widget text(int number) {
  var my_text = [
    'Advertisement1',
    'Advertisement2',
    'Advertisement3',
    'Advertisement4',
    'Advertisement5',
  ];
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        my_text[number],
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    ),
  );
}

Widget circular_image(String my_img) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(50.0),
    child: Image.asset(
      my_img,
      width: 50.0,
      height: 50.0,
      fit: BoxFit.fill,
    ),
  );
}

Widget my_text(String my_txt) {
  return Padding(
    padding: const EdgeInsets.only(top: 5),
    child: Text(
      my_txt,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    ),
  );
}

Widget my_card(String my_txt, IconData my_icon) {
  return Card(
    elevation: 5,
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Icon(my_icon, size: 30),
          Text(my_txt),
        ],
      ),
    ),
  );
}

Widget my_card1(String my_txt, IconData my_icon, double h) {
  return Card(
    elevation: 5,
    color: Colors.cyan[900],
    child: Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Icon(my_icon, size: 30, color: Colors.white,),
            SizedBox(height: h),
            Text(my_txt, style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
    ),
  );
}

