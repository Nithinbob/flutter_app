import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiceExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Text('Dicee'),
          ),
        ),
        body: RollDice(),
      ),
    );
  }
}

class RollDice extends StatefulWidget {
  @override
  _RollDiceState createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  int leftButtonPressed = 1;
  int rightButtonPressed = 1;

  void stateChanged() {
    setState(() {
      leftButtonPressed = Random().nextInt(6) + 1;
      rightButtonPressed = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(children: [
          Expanded(
            child: FlatButton(
              onPressed: () {
                stateChanged();
              },
              child: Image.asset('dice_images/dice$leftButtonPressed.png'),
            ),
          ),

          // SizedBox(
          //   height: 0,
          //   width: 50,
          //   child: Divider(color: Colors.white),
          // ),

          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  stateChanged();
                });
              },
              child: Image.asset('dice_images/dice$rightButtonPressed.png'),
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.all(60.0),
          child: RaisedButton(
            textColor: Colors.red,
            color: Colors.white,
            onPressed: () {
              stateChanged();
            },
            child: Text("ROLL"),
          ),
        )
      ],
    ));
  }
}
