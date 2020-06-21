import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home.dart';


class Helpline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pushReplacement(
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                backgroundColor: Colors.cyan[900],
                title: Center(child: Text('COVID Helpline Number'))),
            body: Center(child: ListSearch())));
  }
}

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {
  TextEditingController _textController = TextEditingController();

  static List<String> mainDataList = [
    "Andhra Pradesh",
    "Andaman and Nicobar Islands",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Dadra and Nagar Haveli and Daman & Diu",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu & Kashmir ",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Ladakh",
    "Lakshadweep",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya ",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Puducherry",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "Uttar Pradesh",
    "West Bengal",
  ];
  static List<int> number = [
    08662410978,
    03192 - 232102,
    9436055743,
    6913347770,
    104,
    9779558282,
    104,
    104,
    01122307145,
    104,
    104,
    8558893911,
    104,
    01912520982,
    104,
    104,
    04712552056,
    01982256462,
    104,
    104,
    020 - 26127394,
    3852411668,
    108,
    102,
    7005539653,
    9439994859,
    104,
    104,
    0141 - 2225624,
    104,
    044 - 29510500,
    104,
    0381 - 2315879,
    104,
    18001805145,
    1800313444222,
  ];

  // Copy Main List into New List.
  List<String> newDataList = List.from(mainDataList);

  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  int index = 0;
  int num;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search Here...',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12.0),
              children: newDataList.map((data) {
                index = mainDataList.indexOf(
                  data,
                );
                num = number[index];
                return ListTile(
                  title: Text(data),
                  onTap: () => launch("tel://$num"),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
