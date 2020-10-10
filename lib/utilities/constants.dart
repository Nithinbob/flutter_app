import 'package:flutter/material.dart';
import 'dart:ui';

const kBlackHex = Color(0xFF0A0E21);
const kRedHex = Color(0xFFEB1555);
const kOverLayRedHex = Color(0x29EB1555);

const kInActiveBlackHex = Color(0xFF1D1E33);
const kGreyTextHex = Color(0xFF8D8E98);
const kActiveBlackHex = Color(0xFF111328);

const kGrey=Color(0xFF4C4F5E);
const kLabelTextStyle =TextStyle(
  fontSize: 18.0,
  color :Color(0xFF8D8E98),
);

const kNumberTextStyle=TextStyle(
  fontSize: 45.0,
  fontWeight: FontWeight.w900,
);

const kBMITextStyle = TextStyle(
  fontSize:95,
  fontWeight: FontWeight.bold,

);
const kResultTextStyle =TextStyle(
  color: Color(0XFF24D876),
  fontSize: 22.0,
  fontWeight:FontWeight.bold,
);


 InputDecoration kDecoration=InputDecoration(
  hintText: 'BBBOOOORRRRRDDDDDEEEEERRRRR',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(32.0)
  ),

  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0,),
    borderRadius: BorderRadius.all(Radius.circular(32.0),),
  ),

  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color:Colors.blueAccent,width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),

);

 const kSendButton=TextStyle(color: Colors.blueAccent,
 fontWeight: FontWeight.bold,
 fontSize:18.0,);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTodoey='Todoey';