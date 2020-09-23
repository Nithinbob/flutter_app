import 'package:flutter_app/services/QuestionAnswers.dart';

import 'QuestionAnswers.dart';

class QuestionBank {

  int _nextPosition=0;
  List<QuestionAnswers> _qA = [QuestionAnswers(q:" QUESTION 1 : Is MAhathma Gandhi non - Indian  ?",a:false),
    QuestionAnswers(q:"Question 2 : Is Donald trump American physico ?",a:true),
    QuestionAnswers(q:"Question 3 :  IS GUN's ROSES ALBUM THE BEST ?",a:true)];

  void increasePosition(){
    if(_nextPosition < _qA.length-1)
    _nextPosition++;
  }

   String getQuestions() => _qA[_nextPosition].question;

   bool getAnswer( ) => _qA[_nextPosition].answer;

}