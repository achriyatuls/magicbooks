import 'package:flutter/material.dart';
import '../../module/efw200_layout/validator/efw200_validator.dart';

class Efw200ProgressService {
  static Efw200ProgressService? _instance;
  static Efw200ProgressService get instance =>
      _instance ??= Efw200ProgressService._();
  Efw200ProgressService._();

  dynamic _efw200View;

  void setEfw200View(dynamic view) {
    _efw200View = view;
  }

  dynamic get efw200View => _efw200View;

  Map<String, bool> getExerciseStatus({bool useDefault = true}) {
    try {
      Map<String, bool> status = {};
      for (int i = 1; i <= 18; i++) {
        final exerciseId = 'EFW200_ex$i';
        Widget? widget;

        // Jika view sudah diregister, ambil dari view
        if (_efw200View != null) {
          // Panggil method exercise dari view
          switch (i) {
            case 1:
              widget = _efw200View.exercise1();
              break;
            case 2:
              widget = _efw200View.exercise2();
              break;
            case 3:
              widget = _efw200View.exercise3();
              break;
            case 4:
              widget = _efw200View.exercise4();
              break;
            case 5:
              widget = _efw200View.exercise5();
              break;
            case 6:
              widget = _efw200View.exercise6();
              break;
            case 7:
              widget = _efw200View.exercise7();
              break;
            case 8:
              widget = _efw200View.exercise8();
              break;
            case 9:
              widget = _efw200View.exercise9();
              break;
            case 10:
              widget = _efw200View.exercise10();
              break;
            case 11:
              widget = _efw200View.exercise11();
              break;
            case 12:
              widget = _efw200View.exercise12();
              break;
            case 13:
              widget = _efw200View.exercise13();
              break;
            case 14:
              widget = _efw200View.exercise14();
              break;
            case 15:
              widget = _efw200View.exercise15();
              break;
            case 16:
              widget = _efw200View.exercise16();
              break;
            case 17:
              widget = _efw200View.exercise17();
              break;
            case 18:
              widget = _efw200View.exercise18();
              break;
          }
        } else {
          // Jika view belum diregister, gunakan default widgets
          widget = _getDefaultWidget(i);
        }

        status[exerciseId] = Efw200Validator.validateExercise(i, widget);
      }
      return status;
    } catch (e) {
      print('Error getting EFW200 status: $e');
      return {};
    }
  }

  Widget? _getDefaultWidget(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        return Row(
          children: [
            Container(width: 50, height: 50, color: Colors.red),
            Container(width: 50, height: 50, color: Colors.green),
            Container(width: 50, height: 50, color: Colors.blue),
          ],
        );
      case 2:
        return Column(
          children: [
            Text("Text 1"),
            Text("Text 2"),
            Text("Text 3"),
          ],
        );
      case 3:
        return Stack(
          children: [
            Container(width: 100, height: 100, color: Colors.red),
            Container(width: 50, height: 50, color: Colors.green),
          ],
        );
      case 4:
        return Stack(
          children: [
            Container(width: 100, height: 100, color: Colors.red),
            Positioned(
              top: 20,
              left: 20,
              child: Container(width: 50, height: 50, color: Colors.green),
            ),
          ],
        );
      case 5:
        return Wrap(
          children: [
            Container(width: 50, height: 50, color: Colors.red),
            Container(width: 50, height: 50, color: Colors.green),
            Container(width: 50, height: 50, color: Colors.blue),
            Container(width: 50, height: 50, color: Colors.yellow),
            Container(width: 50, height: 50, color: Colors.purple),
          ],
        );
      case 6:
        return Row(
          children: [
            Expanded(child: Container(height: 50, color: Colors.red)),
            Expanded(child: Container(height: 50, color: Colors.green)),
          ],
        );
      case 7:
        return Column(
          children: [
            Flexible(
                child: Container(width: 50, height: 50, color: Colors.red)),
            Flexible(
                child: Container(width: 50, height: 50, color: Colors.green)),
          ],
        );
      case 8:
        return SizedBox(width: 100, height: 100);
      case 9:
        return Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
        );
      case 10:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(width: 50, height: 50),
        );
      case 11:
        return Center(
          child: Container(width: 50, height: 50, color: Colors.red),
        );
      case 12:
        return Align(
          alignment: Alignment.topLeft,
          child: Container(width: 50, height: 50, color: Colors.red),
        );
      case 13:
        return AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(color: Colors.red),
        );
      case 14:
        return FractionallySizedBox(
          widthFactor: 0.5,
          child: Container(height: 50, color: Colors.red),
        );
      case 15:
        return LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              color: Colors.red,
            );
          },
        );
      case 16:
        return Transform.rotate(
          angle: 0.5,
          child: Container(width: 50, height: 50, color: Colors.blue),
        );
      case 17:
        return Transform.scale(
          scale: 1.5,
          child: Container(width: 50, height: 50, color: Colors.green),
        );
      case 18:
        return Transform.translate(
          offset: Offset(10, 10),
          child: Container(width: 50, height: 50, color: Colors.purple),
        );
      default:
        return null;
    }
  }
}
