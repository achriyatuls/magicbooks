import 'package:flutter/material.dart';

class Efw400Validator {
  static final Map<int, bool Function(Widget?)> _validators = {
    // 1: GridView.count crossAxisCount 2
    1: (w) => _isGridView(w,
        rule: (gv, d) =>
            d is SliverGridDelegateWithFixedCrossAxisCount &&
            d.crossAxisCount == 2),
    // 2: GridView with crossAxisCount 3 (builder acceptable, we only check delegate)
    2: (w) => _isGridView(w,
        rule: (gv, d) =>
            d is SliverGridDelegateWithFixedCrossAxisCount &&
            d.crossAxisCount == 3),
    // 3: GridView with spacing
    3: (w) => _isGridView(w,
        rule: (gv, d) =>
            d is SliverGridDelegateWithFixedCrossAxisCount &&
            (d.mainAxisSpacing > 0 || d.crossAxisSpacing > 0)),
    // 4: childAspectRatio 1.5
    4: (w) => _isGridView(w,
        rule: (gv, d) =>
            d is SliverGridDelegateWithFixedCrossAxisCount &&
            (d.childAspectRatio == 1.5)),
    // 5: SliverGridDelegateWithMaxCrossAxisExtent 200
    5: (w) => _isGridView(w,
        rule: (gv, d) =>
            d is SliverGridDelegateWithMaxCrossAxisExtent &&
            d.maxCrossAxisExtent == 200),
    // 6: scrollDirection horizontal (lenient: accept GridView even if not set)
    6: (w) => _isGridView(w,
        rule: (gv, d) =>
            gv.scrollDirection == Axis.horizontal ||
            d is SliverGridDelegateWithFixedCrossAxisCount),
    // 7: physics BouncingScrollPhysics (lenient)
    7: (w) => _isGridView(w,
        rule: (gv, d) =>
            gv.physics is BouncingScrollPhysics ||
            d is SliverGridDelegateWithFixedCrossAxisCount),
    // 8: padding EdgeInsets.all(16) (lenient)
    8: (w) => _isGridView(w),
    // 9: cacheExtent 200
    9: (w) => _isGridView(w, rule: (gv, d) => (gv.cacheExtent ?? 0) == 200),
  };

  static bool validateExercise(int exerciseNumber, Widget? widget) {
    final fn = _validators[exerciseNumber];
    if (fn == null) return false;
    return fn(widget);
  }

  static bool _isGridView(
    Widget? widget, {
    bool Function(GridView gv, SliverGridDelegate delegate)? rule,
  }) {
    if (widget is! GridView) return false;
    final delegate = widget.gridDelegate;
    if (rule != null) return rule(widget, delegate);
    return true;
  }
}
