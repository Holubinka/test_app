import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:flutter/widgets.dart'; // подключаем базовый набор виджетов

// Когда Dart запускает приложение он вызывает функцию main()
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
  String lastColor;
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
                child: RaisedButton(
                  onPressed: () => changeIndex(),
                  child: Text(
                    counter==0 ? 'Hey there':'You have pressed $counter times and last color $lastColor ',
                    style: TextStyle(fontSize: 32.0)
                ),
                )
              ),
              Listener(
                behavior: HitTestBehavior.translucent,
                onPointerDown: (e) {
                  setState(() {
                    lastColor = getColorNameFromColor(mainColor).getName;
                    mainColor = Color.fromRGBO(Random().nextInt(254) + 1,
                        Random().nextInt(254) + 1, Random().nextInt(254) + 1, 1);
                    ++counter;
                  });
                },
              ),
            ],
          ),
        ));
  }

  changeIndex() {
    setState(() {
      counter=0;
      mainColor = Colors.white;
      lastColor = "";
    });
  }
}
