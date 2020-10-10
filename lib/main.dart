
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/Convertor.dart';
import 'package:flutter_app/components/todoey.dart';
import 'package:flutter_app/models/task_data.dart';
import 'components/BMICalculator.dart';
import 'file:///C:/Users/Nithin/Desktop/MYCODEPR/Playstore1/flutter_app/lib/components/BasicExamples.dart';
import 'file:///C:/Users/Nithin/Desktop/MYCODEPR/Playstore1/flutter_app/lib/components//ListTileEX.dart';
import 'file:///C:/Users/Nithin/Desktop/MYCODEPR/Playstore1/flutter_app/lib/components/Quizzler.dart';
import 'components/Dice.dart';
import 'components/Xylophone.dart';
import 'file:///C:/Users/Nithin/Desktop/MYCODEPR/Playstore1/flutter_app/lib/components/Flashchat/flash_chat.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/models/task_data.dart';

void main() {


  runApp(ChangeNotifierProvider(
    create: (_) =>TaskData(),
    child: Todoey(),
  ));




//   runApp(FlashChat());
//   runApp(Convertor());
//   runApp(BMICalculator());
//   runApp(Quizzler());
//   runApp(Xylophone2());
//   runApp(DiceExample());
//   runApp(ListTileAPP()); // Using ListTile  **
//   runApp(FirstAPP()); // I am Rich
//   runApp(MYLogin()); // ID Form
//   runApp(MyColumn()); // Multi Widgets ==> Rows and Columns
//   runApp(MyAPP()); // Good looking APP ******   cranberries
//   runApp(MyContainer()); // Container


 }
