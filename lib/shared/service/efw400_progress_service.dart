import 'package:flutter/material.dart';
import 'package:magicbook/module/efw400_grid/validator/efw400_validator.dart';

class Efw400ProgressService {
  static Efw400ProgressService? _instance;
  static Efw400ProgressService get instance =>
      _instance ??= Efw400ProgressService._();
  Efw400ProgressService._();

  dynamic _efw400View;

  void setEfw400View(dynamic view) {
    _efw400View = view;
  }

  dynamic get efw400View => _efw400View;

  Map<String, bool> getExerciseStatus({bool useDefault = true}) {
    try {
      Map<String, bool> status = {};
      for (int i = 1; i <= 9; i++) {
        final exerciseId = 'EFW400_ex$i';
        Widget? widget;

        if (_efw400View != null) {
          switch (i) {
            case 1:
              widget = _efw400View.exercise1();
              break;
            case 2:
              widget = _efw400View.exercise2();
              break;
            case 3:
              widget = _efw400View.exercise3();
              break;
            case 4:
              widget = _efw400View.exercise4();
              break;
            case 5:
              widget = _efw400View.exercise5();
              break;
            case 6:
              widget = _efw400View.exercise6();
              break;
            case 7:
              widget = _efw400View.exercise7();
              break;
            case 8:
              widget = _efw400View.exercise8();
              break;
            case 9:
              widget = _efw400View.exercise9();
              break;
          }
        } else {
          widget = _getDefaultWidget(i);
        }

        status[exerciseId] = Efw400Validator.validateExercise(i, widget);
      }
      return status;
    } catch (e) {
      print('Error getting EFW400 status: $e');
      return {};
    }
  }

  Widget? _getDefaultWidget(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: List.generate(
              6,
              (i) => Container(
                    color: Colors.purple.withOpacity(0.1),
                  )),
        );
      case 2:
        return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
        );
      case 3:
        return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
        );
      case 4:
        return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5,
          ),
        );
      case 5:
        return GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200),
        );
      case 6:
        return GridView(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
        );
      case 7:
        return GridView(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
        );
      case 8:
        return GridView(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
        );
      case 9:
        return GridView(
          cacheExtent: 200,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
        );
      default:
        return null;
    }
  }
}
