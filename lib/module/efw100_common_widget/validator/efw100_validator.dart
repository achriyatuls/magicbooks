import 'package:flutter/material.dart';

class Efw100Validator {
  static bool validateExercise1(Widget? widget) {
    if (widget == null) return false;

    // Check if it's a Container
    if (widget is Container) {
      // Check properties - Container dengan width, height, dan color
      return widget.color == Colors.red;
    }
    return false;
  }

  static bool validateExercise2(Widget? widget) {
    if (widget == null) return false;

    if (widget is Text) {
      return widget.data == "Hello Flutter" && widget.style?.fontSize == 24;
    }
    return false;
  }

  static bool validateExercise3(Widget? widget) {
    if (widget == null) return false;

    if (widget is Icon) {
      return widget.icon == Icons.home && widget.color == Colors.blue;
    }
    return false;
  }

  static bool validateExercise4(Widget? widget) {
    if (widget == null) return false;

    if (widget is Image) {
      return widget.image is AssetImage &&
          (widget.image as AssetImage).assetName == "assets/images/image1.jpg";
    }
    return false;
  }

  static bool validateExercise5(Widget? widget) {
    if (widget == null) return false;

    if (widget is CircleAvatar) {
      return widget.radius == 30 && widget.backgroundColor == Colors.green;
    }
    return false;
  }

  static bool validateExercise6(Widget? widget) {
    if (widget == null) return false;

    if (widget is Card) {
      // Check if Card has padding 16 and contains Text "Card Content"
      return widget.child is Padding &&
          (widget.child as Padding).padding == EdgeInsets.all(16) &&
          (widget.child as Padding).child is Text &&
          ((widget.child as Padding).child as Text).data == "Card Content";
    }
    return false;
  }

  static bool validateExercise7(Widget? widget) {
    if (widget == null) return false;

    if (widget is ListTile) {
      return widget.title is Text &&
          (widget.title as Text).data == "List Tile" &&
          widget.subtitle is Text &&
          (widget.subtitle as Text).data == "Subtitle";
    }
    return false;
  }

  static bool validateExercise8(Widget? widget) {
    if (widget == null) return false;

    if (widget is ElevatedButton) {
      return widget.child is Text && (widget.child as Text).data == "Click Me";
    }
    return false;
  }

  static bool validateExercise9(Widget? widget) {
    if (widget == null) return false;

    if (widget is FloatingActionButton) {
      return widget.child is Icon && (widget.child as Icon).icon == Icons.add;
    }
    return false;
  }

  static bool validateExercise10(Widget? widget) {
    if (widget == null) return false;

    if (widget is AppBar) {
      return widget.title is Text && (widget.title as Text).data == "My App";
    }
    return false;
  }

  static bool validateExercise11(Widget? widget) {
    if (widget == null) return false;

    if (widget is Scaffold) {
      return widget.appBar is AppBar &&
          widget.body is Text &&
          (widget.body as Text).data == "Hello World";
    }
    return false;
  }

  static bool validateExercise12(Widget? widget) {
    if (widget == null) return false;

    if (widget is SizedBox) {
      return widget.width == 200 && widget.height == 100;
    }
    return false;
  }

  static bool validateExercise13(Widget? widget) {
    if (widget == null) return false;

    if (widget is Padding) {
      return widget.padding == EdgeInsets.all(16) &&
          widget.child is Text &&
          (widget.child as Text).data == "Padded Text";
    }
    return false;
  }

  static bool validateExercise14(Widget? widget) {
    if (widget == null) return false;

    if (widget is Center) {
      return widget.child is Text &&
          (widget.child as Text).data == "Centered Text";
    }
    return false;
  }

  static bool validateExercise15(Widget? widget) {
    if (widget == null) return false;

    if (widget is Align) {
      return widget.alignment == Alignment.centerRight &&
          widget.child is Text &&
          (widget.child as Text).data == "Right Aligned";
    }
    return false;
  }

  // Helper method to validate any exercise by number
  static bool validateExercise(int exerciseNumber, Widget? widget) {
    switch (exerciseNumber) {
      case 1:
        return validateExercise1(widget);
      case 2:
        return validateExercise2(widget);
      case 3:
        return validateExercise3(widget);
      case 4:
        return validateExercise4(widget);
      case 5:
        return validateExercise5(widget);
      case 6:
        return validateExercise6(widget);
      case 7:
        return validateExercise7(widget);
      case 8:
        return validateExercise8(widget);
      case 9:
        return validateExercise9(widget);
      case 10:
        return validateExercise10(widget);
      case 11:
        return validateExercise11(widget);
      case 12:
        return validateExercise12(widget);
      case 13:
        return validateExercise13(widget);
      case 14:
        return validateExercise14(widget);
      case 15:
        return validateExercise15(widget);
      default:
        return false;
    }
  }
}
