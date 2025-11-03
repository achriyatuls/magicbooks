import 'package:flutter/material.dart';
import '../../module/efw100_common_widget/validator/efw100_validator.dart';
import '../../module/efw100_common_widget/exercises/efw100_exercises.dart';

/// Service untuk mengelola progress EFW100 exercises
class Efw100ProgressService {
  static Efw100ProgressService? _instance;
  static Efw100ProgressService get instance =>
      _instance ??= Efw100ProgressService._();

  Efw100ProgressService._();

  // Instance dari Efw100CommonWidgetView untuk mengakses exercise methods
  dynamic _efw100View;

  /// Set instance dari Efw100CommonWidgetView
  void setEfw100View(dynamic view) {
    _efw100View = view;
    print('Efw100View berhasil di-set');
  }

  /// Get instance dari Efw100CommonWidgetView
  dynamic get efw100View => _efw100View;

  /// Get exercise status untuk semua exercises EFW100
  Map<String, bool> getExerciseStatus({bool useDefault = true}) {
    print('getExerciseStatus dipanggil - _efw100View: ${_efw100View != null}');
    if (_efw100View == null) {
      print(
          'Efw100View belum di-set - menggunakan default status yang sudah benar');
      if (useDefault) {
        return _getDefaultExerciseStatus();
      }
      return _getInitialFalseStatus();
    }

    try {
      print('Efw100View tersedia - menggunakan instance untuk validasi');
      Map<String, bool> status = {};

      // Test exercises 1-15 untuk EFW100
      for (int i = 1; i <= 15; i++) {
        final exerciseId = 'EFW100_ex$i';

        try {
          // Panggil method exercise dari view
          Widget? widget;
          switch (i) {
            case 1:
              widget = _efw100View.exercise1();
              break;
            case 2:
              widget = _efw100View.exercise2();
              break;
            case 3:
              widget = _efw100View.exercise3();
              break;
            case 4:
              widget = _efw100View.exercise4();
              break;
            case 5:
              widget = _efw100View.exercise5();
              break;
            case 6:
              widget = _efw100View.exercise6();
              break;
            case 7:
              widget = _efw100View.exercise7();
              break;
            case 8:
              widget = _efw100View.exercise8();
              break;
            case 9:
              widget = _efw100View.exercise9();
              break;
            case 10:
              widget = _efw100View.exercise10();
              break;
            case 11:
              widget = _efw100View.exercise11();
              break;
            case 12:
              widget = _efw100View.exercise12();
              break;
            case 13:
              widget = _efw100View.exercise13();
              break;
            case 14:
              widget = _efw100View.exercise14();
              break;
            case 15:
              widget = _efw100View.exercise15();
              break;
          }

          // Validasi widget menggunakan Efw100Validator
          final isValid = Efw100Validator.validateExercise(i, widget);
          status[exerciseId] = isValid;

          print('EFW100 Exercise $i: ${isValid ? "VALID" : "INVALID"}');
        } catch (e) {
          print('Error validating EFW100 exercise $i: $e');
          status[exerciseId] = false;
        }
      }

      return status;
    } catch (e) {
      print('Error getting EFW100 exercise status: $e');
      return _getDefaultExerciseStatus();
    }
  }

  /// Get default exercise status (untuk exercises yang sudah benar)
  Map<String, bool> _getDefaultExerciseStatus() {
    Map<String, bool> status = {};

    // Test semua exercise dengan validator langsung
    for (int i = 1; i <= 15; i++) {
      final exerciseId = 'EFW100_ex$i';

      try {
        // Buat widget sesuai dengan exercise yang sudah ada
        Widget? testWidget;
        switch (i) {
          case 1:
            testWidget = Efw100Exercises.exercise1();
            break;
          case 2:
            testWidget = Efw100Exercises.exercise2();
            break;
          case 3:
            testWidget = Efw100Exercises.exercise3();
            break;
          case 4:
            testWidget = Efw100Exercises.exercise4();
            break;
          case 5:
            testWidget = Efw100Exercises.exercise5();
            break;
          case 6:
            testWidget = Efw100Exercises.exercise6();
            break;
          case 7:
            testWidget = Efw100Exercises.exercise7();
            break;
          case 8:
            testWidget = Efw100Exercises.exercise8();
            break;
          case 9:
            testWidget = Efw100Exercises.exercise9();
            break;
          case 10:
            testWidget = Efw100Exercises.exercise10();
            break;
          case 11:
            testWidget = Efw100Exercises.exercise11();
            break;
          case 12:
            testWidget = Efw100Exercises.exercise12();
            break;
          case 13:
            testWidget = Efw100Exercises.exercise13();
            break;
          case 14:
            testWidget = Efw100Exercises.exercise14();
            break;
          case 15:
            testWidget = Efw100Exercises.exercise15();
            break;
        }

        // Validasi dengan Efw100Validator
        final isValid = Efw100Validator.validateExercise(i, testWidget);
        status[exerciseId] = isValid;

        if (isValid) {
          print('EFW100 Exercise $i: VALID (default)');
        }
      } catch (e) {
        print('Error testing EFW100 exercise $i: $e');
        status[exerciseId] = false;
      }
    }

    final completedCount = status.values.where((v) => v).length;
    print(
        'Menggunakan default status EFW100: $completedCount exercises selesai');
    return status;
  }

  /// Initial status: semua exercise ditandai belum selesai (false)
  Map<String, bool> _getInitialFalseStatus() {
    final status = <String, bool>{};
    for (int i = 1; i <= 15; i++) {
      status['EFW100_ex$i'] = false;
    }
    return status;
  }

  /// Get completed exercise count
  int getCompletedExerciseCount() {
    final status = getExerciseStatus();
    return status.values.where((isCompleted) => isCompleted).length;
  }

  /// Check if specific exercise is completed
  bool isExerciseCompleted(int exerciseNumber) {
    final status = getExerciseStatus();
    return status['EFW100_ex$exerciseNumber'] ?? false;
  }
}
