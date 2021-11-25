import 'dart:math';
import 'dart:ui';

import 'package:bmi_calculator/constants.dart';

class CalculatorBrain {
  CalculatorBrain({
    this.height,
    this.weight,
  });

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = this.weight / pow(this.height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= kBmiOverweight) return 'OVERWEIGHT';
    if (_bmi <= kBmiUnderweight) return 'UNDERWEIGHT';
    return 'NORMAL';
  }

  String getSuggestion() {
    if (_bmi >= kBmiOverweight) return 'Please exercise more';
    if (_bmi <= kBmiUnderweight) return 'Please eat more';
    return 'Good job mate!';
  }

  Color getColor() {
    if (_bmi >= kBmiOverweight) return kResultOverweightColor;
    if (_bmi <= kBmiUnderweight) return kResultUnderweightColor;
    return kResultNormalColor;
  }
}
