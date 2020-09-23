import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'file:///C:/Users/Nithin/Desktop/MYCODEPR/Playstore1/flutter_app/lib/Utilities/constants.dart';
import '../services/CalculationBMI.dart';
import 'Dice.dart';
import '../services/ReUsableCodes.dart';
import 'package:flutter_app/components/CreatedBMI.dart';

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kBlackHex,
        scaffoldBackgroundColor: kBlackHex,
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColorHolder = kInActiveBlackHex;
  Color femaleColorHolder = kInActiveBlackHex;
  int mSliderHeight = 120;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "BMI CALCULATOR",
            ),
          ),
        ),
        body: Column(children: [
          Expanded(
            flex: 29,
            child: Row(children: [
              Expanded(
                child: Reusable(
                    child: VenusMars(FontAwesomeIcons.venus, "FEMALE"),
                    color: maleColorHolder,
                    onPress: () {
                      setState(() {
                        maleColorHolder == kActiveBlackHex
                            ? maleColorHolder = kInActiveBlackHex
                            : maleColorHolder = kActiveBlackHex;
                        femaleColorHolder == kActiveBlackHex &&
                                maleColorHolder == kActiveBlackHex
                            ? femaleColorHolder = kInActiveBlackHex
                            : femaleColorHolder;
                      });
                    }),
              ),
              Expanded(
                child: Reusable(
                  child: VenusMars(FontAwesomeIcons.mars, "MALE"),
                  color: femaleColorHolder,
                  onPress: () {
                    setState(() {
                      femaleColorHolder == kActiveBlackHex
                          ? femaleColorHolder = kInActiveBlackHex
                          : femaleColorHolder = kActiveBlackHex;
                      femaleColorHolder == kActiveBlackHex &&
                              maleColorHolder == kActiveBlackHex
                          ? maleColorHolder = kInActiveBlackHex
                          : femaleColorHolder;
                    });
                  },
                ),
              ),
            ]),
          ),
          Expanded(
              flex: 27,
              child: Reusable(
                color: kInActiveBlackHex,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          mSliderHeight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 1,
                        activeTrackColor: Colors.white,
                        thumbColor: kRedHex,
                        overlayColor: kOverLayRedHex,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 28.0),
                      ),
                      child: Slider(
                        inactiveColor: kGreyTextHex,
                        onChanged: (double value) {
                          setState(() {
                            mSliderHeight = value.toInt();
                          });
                        },
                        value: mSliderHeight.toDouble(),
                        min: 120,
                        max: 220,
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 29,
            child: Row(children: [
              Expanded(
                child: Reusable(
                  color: kInActiveBlackHex,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Reusable(
                    color: kInActiveBlackHex,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ]),
          ),
          Expanded(
            flex: 13,
            child: DialogButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {

                    CalculationBMI calB   =    CalculationBMI(weight: weight,height: mSliderHeight);

                     return CreatedBMI(mBMI:calB.calculateBMi(),mString1:calB.getResult(),mString2:calB.getInterPretation());
                  }),
                );
              },
              color: kRedHex,
              child: Text(
                "CALCULATE YOUR BMI",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ]));
  }
}


