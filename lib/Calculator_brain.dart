import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;
  double _minWeight;
  double _maxWeight;
  double _toLose;
  double _toGain;
  String calculateBMI(){
    _bmi = weight/pow(height/100, 2);
      return _bmi.toStringAsFixed(1);}

  String getResult(){
    if(_bmi < 18.5) {
      return 'Underweight';
    } else if(_bmi >= 18.5 && _bmi < 24.9){
      return 'Healthy';
    }else if(_bmi >= 24.9 && _bmi < 29.9){
      return 'Overweight';
    }else{
      return 'Obese';
    }
  }

  String getWeightRange(){
    _minWeight = double.parse((18.5*pow(height/100,2)).toStringAsFixed(1));
    _maxWeight = double.parse((24.9*pow(height/100,2)).toStringAsFixed(1));
    if(_bmi < 18.5) {
      return 'Your minimum weight should be $_minWeight, \n Your weight:$weight';

    } else if(_bmi >= 18.5 && _bmi < 24.9){
      return 'Range for healthy weight is $_minWeight to $_maxWeight\n\n Your weight: $weight';
    }else if(_bmi >= 24.9 && _bmi < 29.9){
      return 'Range for healthy weight is $_minWeight to $_maxWeight\n\n Your weight: $weight';
    }else{
      return 'Range for healthy weight is $_minWeight to $_maxWeight\n\n Your weight: $weight';
    }
  }
  String getWeightChange(){
    if(_bmi < 18.5) {
      _toGain = double.parse((_minWeight - weight).toStringAsFixed(1));
      return 'Weight to gain : $_toGain kg';
    } else if(_bmi >= 18.5 && _bmi < 24.9){
      return 'Healthy';
    }else if(_bmi >= 24.9 && _bmi < 29.9){
      _toLose = double.parse((weight - _maxWeight).toStringAsFixed(1));
      return 'Weight to lose: $_toLose kg';
    }else{
      _toLose = weight - _maxWeight;
      return 'Weight to lose: $_toLose kg';
    }
  }
    String getInterpretation(){
    if(_bmi < 18.5) {
      return 'You have lower than normal body weight, you can eat more!';
    } else if(_bmi >= 18.5 && _bmi < 24.9){
      return 'You have a normal body weight. Keep it up!';
    }else if(_bmi >= 24.9 && _bmi < 29.9){
      return 'You have to begin exercising and reduce your weight';
    }else{
      return 'You seriously have to shed a lot of weight!';
    }
  }
}