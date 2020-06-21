import 'package:flutter/material.dart';
import 'package:flutter_star_rating/flutter_star_rating.dart';

class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.black,
          title: Center(child: Text("Feedback")),
        ),
        body: Rate(),
      ),
    );
  }
}

class Rate extends StatefulWidget {
  @override
  _RateState createState() => _RateState();
}

class _RateState extends State<Rate> {
  double product_quality = 0.0;
  double service = 0.0;
  double variety = 0.0;
  double cleanliness = 0.0;
  double mess_staff_hospitality = 0.0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(
            'Your rating id 100% confidential and will not be shared with anyone. '
                'Thank you!',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          color: Colors.black,
          child: ListTile(
            title: Text(
              'Product Quality',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          height: 100,
          color: Colors.teal[700],
          child: Center(
            child: ListTile(
              title: StarRating(
                rating: product_quality,
                starConfig: StarConfig(
                  fillColor: Colors.pink,
                  size: 25.0,
                ),
                onChangeRating: (int rating) {
                  setState(() {
                    this.product_quality = rating.toDouble();
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          color: Colors.black,
          child: ListTile(
            title: Text(
              'Service',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          height: 100,
          color: Colors.teal[700],
          child: Center(
            child: ListTile(
              title: StarRating(
                rating: service,
                starConfig: StarConfig(
                  fillColor: Colors.orange,
                  size: 25.0,
                ),
                onChangeRating: (int rating) {
                  setState(() {
                    this.service = rating.toDouble();
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          color: Colors.black,
          child: ListTile(
            title: Text(
              'Product Variety',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          color: Colors.teal[700],
          height: 100,
          child: Center(
            child: ListTile(
              title: StarRating(
                rating: variety,
                starConfig: StarConfig(
                  fillColor: Colors.yellow,
                  size: 25.0,
                ),
                onChangeRating: (int rating) {
                  setState(() {
                    this.variety = rating.toDouble();
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          color: Colors.black,
          child: ListTile(
            title: Text(
              'Interface',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          color: Colors.teal[700],
          height: 100,
          child: Center(
            child: ListTile(
              title: StarRating(
                rating: cleanliness,
                starConfig: StarConfig(
                  fillColor: Colors.blue,
                  size: 25.0,
                ),
                onChangeRating: (int rating) {
                  setState(() {
                    this.cleanliness = rating.toDouble();
                  });
                },
              ),
            ),
          ),
        ),
        Container(
          color: Colors.black,
          child: ListTile(
            title: Text(
              'Convenience',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          color: Colors.teal[700],
          height: 100,
          child: Center(
            child: ListTile(
              title: StarRating(
                rating: mess_staff_hospitality,
                starConfig: StarConfig(
                  fillColor: Colors.red,
                  size: 25.0,
                ),
                onChangeRating: (int rating) {
                  setState(() {
                    this.mess_staff_hospitality = rating.toDouble();
                  });
                },
              ),
            ),
          ),
        ),
        ListTile(
          title: TextField(
            autofocus: false,
            maxLengthEnforced: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Comments',
              icon: Icon(
                Icons.comment,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.teal[200],
                  Colors.teal[900],
                ],
              ),
            ),
            child: MaterialButton(
              child: Text(
                'Submit',
              ),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
