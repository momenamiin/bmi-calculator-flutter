import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.Height, this.Weight});
  final int Height;
  final int Weight;
  double _bmi;
  String calcualteBMI() {
    _bmi = Weight / pow(Height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Uncerweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'you have higher than normal boady weight, try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'you have a normal boady weight. good job';
    } else {
      return 'you have a lower than normal boady weight. you can eat a bit more.';
    }
  }
}
