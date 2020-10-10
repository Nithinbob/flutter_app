
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Nithin/Desktop/MYCODEPR/Playstore1/flutter_app/lib/Utilities/constants.dart';

import '../components/BMICalculator.dart';

class VenusMars extends StatelessWidget {
  VenusMars(this.mIcon, this.mGender);

  final String mGender;
  final IconData mIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          mIcon,
          size: 75.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          mGender,
          style:kLabelTextStyle ,
        ),
      ],
    );
  }
}

class Reusable extends StatelessWidget {
  Reusable({Widget child, Color color, Function onPress}) {
    this.mChild = child;
    this.mColor = color;
    this.mPress = onPress;
  }

  Widget mChild;
  Color mColor;
  Function mPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: mPress,
      child: Container(
        child: mChild,
        margin: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        decoration: BoxDecoration(
            color: mColor, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon,this.onPressed});
  final IconData icon ;
  final Function onPressed ;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,height: 56.0,),
      shape: CircleBorder(),
      fillColor: kGrey,
    );

  }
}


