import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Nithin/Desktop/MYCODEPR/Playstore1/flutter_app/lib/services/QuestionAnswers.dart';
import 'package:flutter_app/services/QuestionBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Quizzler extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quizzler> {
  QuestionBank questionBank = QuestionBank();
  List<Icon> scoreKeeper = [];
  int questionPosition = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    questionBank.getQuestions(),

                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: 50,
                height: 70,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      checkAnswer(true);
                      questionBank.increasePosition();
Alert(context: context,title: "Clicked",desc: "on True").show();
                    });
                  },
                  color: Colors.green,
                  child: Text(
                    "True",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 70,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      checkAnswer(false);
                      questionBank.increasePosition();
                      Alert(
                        context: context,
                        type: AlertType.warning,
                        title: "RFLUTTER ALERT",
                        desc: "Flutter is more awesome with RFlutter Alert.",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "FLAT",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            color: Color.fromRGBO(0, 179, 134, 1.0),
                          ),
                          DialogButton(
                            child: Text(
                              "GRADIENT",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(116, 116, 191, 1.0),
                              Color.fromRGBO(52, 138, 199, 1.0)
                            ]),
                          )
                        ],
                      ).show();
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    "False",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(children: scoreKeeper)
          ],
        ),
      ),
    );
  }

  void checkAnswer(bool clickedAnswer){
    clickedAnswer == questionBank.getAnswer()? addGreenButton(): addRedButton();

  }
  void addGreenButton() {
    scoreKeeper.add(
      Icon(Icons.check, color: Colors.green),
    );
  }

  void addRedButton() {
    scoreKeeper.add(
      Icon(Icons.clear, color: Colors.red),
    );
  }
}
