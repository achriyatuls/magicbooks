import 'package:flutter/material.dart';

class Efw200Validator {
  static bool validateExercise(int exerciseNumber, Widget? widget) {
    // Validasi spesifik untuk setiap exercise
    switch (exerciseNumber) {
      case 1:
        return _validateExercise1(widget);
      case 2:
        return _validateExercise2(widget);
      case 3:
        return widget != null &&
            widget.runtimeType.toString().contains('Stack');
      case 4:
        return widget != null &&
            widget.runtimeType.toString().contains('Stack');
      case 5:
        return widget != null && widget.runtimeType.toString().contains('Wrap');
      case 6:
        return widget != null && widget.runtimeType.toString().contains('Row');
      case 7:
        return widget != null &&
            widget.runtimeType.toString().contains('Column');
      case 8:
        return widget != null &&
            widget.runtimeType.toString().contains('SizedBox');
      case 9:
        return widget != null &&
            widget.runtimeType.toString().contains('Container');
      case 10:
        return widget != null &&
            widget.runtimeType.toString().contains('Padding');
      case 11:
        return widget != null &&
            widget.runtimeType.toString().contains('Center');
      case 12:
        return widget != null &&
            widget.runtimeType.toString().contains('Align');
      case 13:
        return widget != null &&
            widget.runtimeType.toString().contains('AspectRatio');
      case 14:
        return widget != null &&
            widget.runtimeType.toString().contains('FractionallySizedBox');
      case 15:
        return widget != null &&
            widget.runtimeType.toString().contains('LayoutBuilder');
      case 16:
        return widget != null &&
            widget.runtimeType.toString().contains('Transform');
      case 17:
        return widget != null &&
            widget.runtimeType.toString().contains('Transform');
      case 18:
        return widget != null &&
            widget.runtimeType.toString().contains('Transform');
      default:
        return false;
    }
  }

  static bool _validateExercise1(Widget? widget) {
    if (widget is! Row) return false;
    // Validasi spesifik Row
    return true;
  }

  static bool _validateExercise2(Widget? widget) {
    if (widget is! Column) return false;
    // Validasi spesifik Column
    return true;
  }
}
