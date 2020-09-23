import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Xylophone extends StatefulWidget {
  @override
  XyloPhone_State createState() => XyloPhone_State();
}

class XyloPhone_State extends State<Xylophone> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: FlatButton(
            color: Colors.white,
            onPressed: () {
              final player = AudioPlayer();
              player.play('assets/note2.wav');
            },
            child: Text("Click me"),
          ),
        ),
      ),
    );
  }
}

//******************************************************************************
//                                                                             ******************************************************************************************
class Xylophone2 extends StatelessWidget {
  var colors = [
    Colors.red,
    Colors.yellow,
    Colors.teal,
    Colors.grey,
    Colors.orange,
    Colors.blueAccent
    // Colors.deepPurple,
    // Colors.teal,
    // Colors.white,
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("PLAY"),
          ),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [for (int i = 1; i <= colors.length; i++) Play(i)]),
        ),
      ),
    );
  }

  Widget Play(int i) {
    return Expanded(
      child: FlatButton(
        child: Icon(Icons.music_note),
        color: colors[i - 1],
        onPressed: () {
          final player = AudioCache();
          switch (i) {
            case 8:
              i = 1;
              break;
            case 9:
              i = 2;
              break;
            case 10:
              i = 3;
              break;
          }
          player.play('note$i.wav');
        },
      ),
    );
  }
}
//
// class DuplicateIT extends StatelessWidget {
//   int mId;
//   MaterialColor mColor;
//   DuplicateIT(int i, MaterialColor color) {
//     this.mId = i;
//     this.mColor = color;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
