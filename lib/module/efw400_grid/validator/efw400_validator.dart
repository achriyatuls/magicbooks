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
    // 6: scrollDirection horizontal
    6: (w) =>
        _isGridView(w, rule: (gv, d) => gv.scrollDirection == Axis.horizontal),
    // 7: physics BouncingScrollPhysics
    7: (w) =>
        _isGridView(w, rule: (gv, d) => gv.physics is BouncingScrollPhysics),
    // 8: padding EdgeInsets.all(16)
    8: (w) => _isGridView(w,
        rule: (gv, d) =>
            gv.padding is EdgeInsets &&
            (gv.padding as EdgeInsets).left == 16 &&
            (gv.padding as EdgeInsets).right == 16 &&
            (gv.padding as EdgeInsets).top == 16 &&
            (gv.padding as EdgeInsets).bottom == 16),
    // 9: cacheExtent 200
    9: (w) => _isGridView(w, rule: (gv, d) => (gv.cacheExtent ?? 0) == 200),
    // 10: shrinkWrap true
    10: (w) => _isGridView(w, rule: (gv, d) => gv.shrinkWrap == true),
    // 11: primary true
    11: (w) => _isGridView(w, rule: (gv, d) => gv.primary == true),
    // 12: GridView.count
    12: (w) => _isGridView(w,
        rule: (gv, d) => d is SliverGridDelegateWithFixedCrossAxisCount),
    // 13: addAutomaticKeepAlives true
    13: (w) => _isGridView(w,
        rule: (gv, d) =>
            d is SliverGridDelegateWithFixedCrossAxisCount &&
            d.crossAxisCount == 3),
    // 14: addRepaintBoundaries true
    14: (w) => _isGridView(w,
        rule: (gv, d) =>
            d is SliverGridDelegateWithFixedCrossAxisCount &&
            d.crossAxisCount == 3),
    // 15: reverse true
    15: (w) => _isGridView(w, rule: (gv, d) => gv.reverse == true),
    // 16: semanticChildCount 6
    16: (w) => _isGridView(w, rule: (gv, d) => gv.semanticChildCount == 6),
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
