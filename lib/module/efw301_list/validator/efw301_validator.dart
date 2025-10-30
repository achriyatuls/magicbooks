// No Flutter imports needed for simple bool-based validation

import 'package:flutter/material.dart';

class Efw301Validator {
  // Validator berbasis Widget (menyesuaikan view terbaru)

  static final Map<int, bool Function(Widget?)> _validators = {
    1: (w) => w is ListView,
    2: (w) => w is RefreshIndicator,
    3: (w) => w is AnimatedList,
    4: (w) => w is ReorderableListView,
    5: (w) =>
        w is CustomScrollView, // SliverList biasanya di dalam CustomScrollView
    6: (w) => w is CustomScrollView,
    7: (w) => w is PageView,
    8: (w) => w is TabBarView || w is DefaultTabController,
    9: (w) => w is NestedScrollView,
  };

  static bool validateExercise(int exerciseNumber, Widget? widget) {
    final fn = _validators[exerciseNumber];
    if (fn == null) return false;
    return fn(widget);
  }

  static bool _isListView(Widget? widget) => widget is ListView;
}
