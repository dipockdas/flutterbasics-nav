import 'package:flutter/material.dart';
import 'dart:async';

// pages
import './page2.dart';
import './page3.dart';
// import './getBabel.dart';


var imageUrl = 'https://res.cloudinary.com/twenty20/private_images/t_watermark-criss-cross-10/v1511855385000/photosp/a34bb9ae-979e-4b2d-acf5-b8b56b755fe3/stock-photo-nature-nobody-outdoors-flower-garden-petal-plant-flower-head-fragility-a34bb9ae-979e-4b2d-acf5-b8b56b755fe3.jpg';


void main() {
  runApp(new MaterialApp(
    home: new Landing(),

    //set up the route for the other pages. Widget Builder will construct a Material PageRoute
    routes: <String, WidgetBuilder>{
      '/page2': (BuildContext context) => new Page2(),
      '/page3': (BuildContext context) => new Page3()
    },
  ));
}

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new LandingBody(),
      appBar: new AppBar(
        title: new Text('Babelfish'),
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
    );
  }
}


class LandingBody extends StatefulWidget {
  @override
  LandingBodyState createState() {
    return new LandingBodyState();
  }
}


class LandingBodyState extends State<LandingBody> {
  String name;
  // BabelResult queryResult;

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: new ListView(
        children: <Widget>[
          new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new CircleAvatar(
                    backgroundImage: new NetworkImage(imageUrl),
                    radius: 70.0),
                new Padding(
                    padding: const EdgeInsets.only(top: 78.0),
                    child: new Container(
                      width: 302.0,
                      child: new TextField(
                        onChanged: (String text) => setState(() {
                          name = text;
                        }),
                        style: new TextStyle(color: Colors.white),
                        decoration: new InputDecoration(
                            hintText: 'Enter your search',
                            hintStyle: new TextStyle(color: Colors.white)),

                      ),
                    )),
                new Padding(
                  padding: const EdgeInsets.only(top: 78.0),
                  child: new IconButton(
                    onPressed: () {
                      print('Navigating');
                      // queryResult = getBabel(name);

                     //  print('Query Result');
                     //  print(queryResult);

                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                              new Page2(name: name)));
                    },
                    icon: new Icon(Icons.arrow_forward),
                    iconSize: 60.0,
                    color: Colors.pink[300],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}