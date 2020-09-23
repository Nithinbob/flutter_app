import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Nithin/Desktop/MYCODEPR/Playstore1/flutter_app/lib/services/CalculationBMI.dart';
import 'file:///C:/Users/Nithin/Desktop/MYCODEPR/Playstore1/flutter_app/lib/services/ReUsableCodes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'file:///C:/Users/Nithin/Desktop/MYCODEPR/Playstore1/flutter_app/lib/Utilities/constants.dart';

class CreatedBMI extends StatelessWidget {
    final String mBMI;
   final String mString1;
    final String mString2;

    CreatedBMI({this.mBMI, this.mString1,this.mString2});
   // CalculationBMI calB =    CalculationBMI(weight: mWeight,height: mHeight);

    // mSliderHeight, int weight);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 20,
              child: Center(
                child: Text(
                  "Your Result",
                  style: kNumberTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 70,
              child: Reusable(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                    mString1,
                      style: kResultTextStyle,
                    ),
                    Text(mBMI,
                      style: kBMITextStyle,
                    ),
                    Text(mString2,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize:22 ))
                  ],
                ),
                color: kActiveBlackHex,
              ),
            ),
            Expanded(
              flex: 15,
              child: DialogButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                color: kRedHex,
                child: Text("RE-CALCULATE"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
