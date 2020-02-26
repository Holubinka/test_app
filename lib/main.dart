import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:flutter/widgets.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainVidget();
  }
}

class MainVidget extends StatefulWidget {
  @override
  MainVidgetState createState() => MainVidgetState();
}

class MainVidgetState extends State<MainVidget> {
  Color mainColor = Colors.white;
  Color lastColor;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: mainColor,
            appBar: AppBar(
              title: Text('Tap anywhere'),
            ),
            body: Stack(
              children: <Widget>[
                Center(
                    child: Text(
                        counter == 0 ? 'Hey there':'You have pressed $counter times and last color ${getColorNameFromColor(lastColor).getName} ',
                        style: TextStyle(fontSize: 32.0, color: lastColor),
                    )
                ),
                Listener(
                  behavior: HitTestBehavior.translucent,
                  onPointerDown: (e) {
                    setState(() {
                      lastColor = mainColor;
                      mainColor = Color.fromRGBO(Random().nextInt(254) + 1,
                          Random().nextInt(254) + 1, Random().nextInt(254) + 1, 1);
                      ++counter;
                    });
                  },
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed:() => changeIndex(),
              label: Text('Clean'),
              icon: Icon(Icons.clear),
              backgroundColor: Colors.pink,
            ),
        )
    );
  }

  changeIndex() {
    setState(() {
      counter = 0;
      mainColor = Colors.white;
      lastColor = Colors.black;
    });
  }
}
