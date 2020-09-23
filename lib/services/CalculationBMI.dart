import 'dart:math';

class CalculationBMI {
  double bmi;

  CalculationBMI({ this.weight,this.height});


 final int height;
 final int weight;

  String calculateBMi() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'OverWeight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderEeight';
    }
  }

  String getInterPretation(){
    if(bmi >=25){
      return 'You have a higher than normal body weight . Try to excercise more.';

    }else if(bmi >=18.5){
      return 'You have a normal body weight. Atta Boy';
    }else{
      return 'You have lean /lower body weight . You can eat a bit more';
    }
  }


}
