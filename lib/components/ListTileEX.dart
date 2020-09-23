import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Card(
            child: ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('I am a Dev'),
              subtitle: Text('Angela Yu'),
            ),
          ),
        ),
      ),
    );
  }
}
