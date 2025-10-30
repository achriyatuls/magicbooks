import 'package:flutter/material.dart';

class Efw300Validator {
  static final Map<int, bool Function(Widget?)> _validators = {
    1: (w) => _validateListView(w),
    2: (w) => _validateListView(w),
    3: (w) => _validateListView(w),
    4: (w) => _validateListView(w),
    5: (w) => _validateListView(w),
    6: (w) => _validateListView(w),
    7: (w) => _validateListView(w),
    8: (w) => _validateListView(w),
    9: (w) => _validateListView(w),
    10: (w) => _validateListView(w),
    11: (w) => _validateListView(w),
    12: (w) => _validateListView(w),
    13: (w) => _validateListView(w, rule: (lv) => lv.reverse == true),
    14: (w) => _validateListView(
          w,
          rule: (lv) => lv.primary == false && lv.shrinkWrap == true,
        ),
    15: (w) => _validateListView(w),
  };

  static bool validateExercise(int exerciseNumber, Widget? widget) {
    final validator = _validators[exerciseNumber];
    if (validator == null) return false;
    return validator(widget);
  }

  static Widget? _getDefaultWidget(int exerciseNumber) {
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
                  color: Colors.purple[100],
                  child: Center(child: Text('Item ${i + 1}')))),
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
      default:
        return null;
    }
  }

  static bool _validateListView(
    Widget? widget, {
    bool Function(ListView listView)? rule,
  }) {
    if (widget is! ListView) return false;
    if (rule != null) return rule(widget);
    return true;
  }
}
