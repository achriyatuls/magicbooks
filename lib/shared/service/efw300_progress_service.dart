import 'package:flutter/material.dart';
import 'package:magicbook/module/efw300_list/validator/efw300_validator.dart';

class Efw300ProgressService {
  static Efw300ProgressService? _instance;
  static Efw300ProgressService get instance =>
      _instance ??= Efw300ProgressService._();
  Efw300ProgressService._();

  dynamic _efw300View;

  void setEfw300View(dynamic view) {
    _efw300View = view;
  }

  dynamic get efw300View => _efw300View;

  Map<String, bool> getExerciseStatus({bool useDefault = true}) {
    try {
      Map<String, bool> status = {};
      for (int i = 1; i <= 15; i++) {
        final exerciseId = 'EFW300_ex$i';
        Widget? widget;

        if (_efw300View != null) {
          // Call exercise methods from view
          switch (i) {
            case 1:
              widget = _efw300View.exercise1();
              break;
            case 2:
              widget = _efw300View.exercise2();
              break;
            case 3:
              widget = _efw300View.exercise3();
              break;
            case 4:
              widget = _efw300View.exercise4();
              break;
            case 5:
              widget = _efw300View.exercise5();
              break;
            case 6:
              widget = _efw300View.exercise6();
              break;
            case 7:
              widget = _efw300View.exercise7();
              break;
            case 8:
              widget = _efw300View.exercise8();
              break;
            case 9:
              widget = _efw300View.exercise9();
              break;
            case 10:
              widget = _efw300View.exercise10();
              break;
            case 11:
              widget = _efw300View.exercise11();
              break;
            case 12:
              widget = _efw300View.exercise12();
              break;
            case 13:
              widget = _efw300View.exercise13();
              break;
            case 14:
              widget = _efw300View.exercise14();
              break;
            case 15:
              widget = _efw300View.exercise15();
              break;
            // ... tambahkan untuk semua exercises
          }
        } else {
          // Use default widgets
          widget = _getDefaultWidget(i);
        }

        status[exerciseId] = Efw300Validator.validateExercise(i, widget);
      }
      return status;
    } catch (e) {
      print('Error getting EFW300 status: $e');
      return {};
    }
  }

  Widget? _getDefaultWidget(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        // ListView dengan 5 ListTile
        return ListView(
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 2:
        // ListView.builder dengan 10 item
        return ListView.builder(
          itemCount: 10,
          itemBuilder: (c, i) => ListTile(title: Text('Item ${i + 1}')),
        );
      case 3:
        // ListView.separated dengan separator Divider
        return ListView.separated(
          itemCount: 5,
          itemBuilder: (c, i) => ListTile(title: Text('Item ${i + 1}')),
          separatorBuilder: (c, i) => const Divider(height: 1),
        );
      case 4:
        // ListView dengan scrollDirection horizontal
        return ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
              5,
              (i) => Container(
                    width: 80,
                    margin: const EdgeInsets.all(8),
                    color: Colors.purpleAccent.withOpacity(0.2),
                    child: Center(child: Text('Item ${i + 1}')),
                  )),
        );
      case 5:
        // ListView dengan physics BouncingScrollPhysics
        return ListView(
          physics: const BouncingScrollPhysics(),
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 6:
        // ListView dengan controller ScrollController
        return ListView(
          controller: ScrollController(),
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 7:
        // ListView dengan shrinkWrap true
        return ListView(
          shrinkWrap: true,
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 8:
        // ListView dengan padding EdgeInsets.all(16)
        return ListView(
          padding: const EdgeInsets.all(16),
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 9:
        // ListView dengan itemExtent 100
        return ListView(
          itemExtent: 100,
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 10:
        // ListView dengan cacheExtent 200
        return ListView(
          cacheExtent: 200,
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 11:
        // ListView dengan addAutomaticKeepAlives true
        return ListView(
          addAutomaticKeepAlives: true,
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 12:
        // ListView dengan addRepaintBoundaries true
        return ListView(
          addRepaintBoundaries: true,
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 13:
        // ListView reverse: true
        return ListView(
          reverse: true,
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 14:
        // ListView primary: false, shrinkWrap: true
        return ListView(
          primary: false,
          shrinkWrap: true,
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 15:
        // ListView.custom dengan SliverChildListDelegate
        return ListView.custom(
          childrenDelegate: SliverChildListDelegate(
            List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
          ),
        );
      default:
        return null;
    }
  }
}
