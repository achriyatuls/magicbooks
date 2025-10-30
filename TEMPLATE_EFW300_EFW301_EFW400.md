# Template Implementation EFW300, EFW301, EFW400

## 🎯 Quick Start Guide

Ikuti langkah-langkah berikut untuk mengimplementasikan setiap modul EFW.

---

## 📋 Step-by-Step Implementation

### Step 1: Create Validator

**File**: `lib/module/efwXXX_YOUR_MODULE/validator/efwXXX_validator.dart`

```dart
import 'package:flutter/material.dart';

class EfwXXXValidator {
  static bool validateExercise(int exerciseNumber, Widget? widget) {
    switch (exerciseNumber) {
      case 1:
        return _validateExercise1(widget);
      case 2:
        return _validateExercise2(widget);
      // ... tambahkan cases untuk exercise lainnya
      default:
        return false;
    }
  }

  static bool _validateExercise1(Widget? widget) {
    if (widget is! YOUR_WIDGET_TYPE) return false;
    // Validasi spesifik
    return true;
  }

  // Tambahkan validators untuk exercise lainnya
}
```

**✅ Checklist**:

- [ ] Import 'package:flutter/material.dart'
- [ ] Switch case untuk semua exercises
- [ ] Specific validators untuk exercise 1-2
- [ ] Runtime type checking untuk exercise 3+

---

### Step 2: Create Progress Service

**File**: `lib/shared/service/efwXXX_progress_service.dart`

```dart
import 'package:flutter/material.dart';
import '../../module/efwXXX_YOUR_MODULE/validator/efwXXX_validator.dart';

class EfwXXXProgressService {
  static EfwXXXProgressService? _instance;
  static EfwXXXProgressService get instance =>
      _instance ??= EfwXXXProgressService._();
  EfwXXXProgressService._();

  dynamic _efwXXXView;

  void setEfwXXXView(dynamic view) {
    _efwXXXView = view;
  }

  dynamic get efwXXXView => _efwXXXView;

  Map<String, bool> getExerciseStatus({bool useDefault = true}) {
    try {
      Map<String, bool> status = {};
      for (int i = 1; i <= TOTAL_EXERCISES; i++) {
        final exerciseId = 'EFWXXX_ex$playerentMove';
        Widget? widget;

        if (_efwXXXView != null) {
          // Call exercise methods from view
          switch (i) {
            case 1: widget = _efwXXXView.exercise1(); break;
            // ... tambahkan untuk semua exercises
          }
        } else {
          // Use default widgets
          widget = _getDefaultWidget(i);
        }

        status[exerciseId] = EfwXXXValidator.validateExercise(i, widget);
      }
      return status;
    } catch (e) {
      print('Error getting EFWXXX status: $e');
      return {};
    }
  }

  Widget? _getDefaultWidget(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        return YOUR_DEFAULT_WIDGET_FOR_EX1();
      // ... tambahkan untuk semua exercises
      default:
        return null;
    }
  }
}
```

**✅ Checklist**:

- [ ] Singleton pattern
- [ ] setEfwXXXView() method
- [ ] efwXXXView getter
- [ ] getExerciseStatus() dengan default widgets
- [ ] \_getDefaultWidget() untuk semua exercises
- [ ] Error handling

---

### Step 3: Create Row Label

**File**: `lib/shared/widget/row_label/row_label_efwXXX.dart`

```dart
import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

Widget rowLabelEfwXXX(Widget? Function() func, int number) {
  return Builder(
    builder: (context) {
      final result = func();
      final hasWidget = result != null;
      final isValid = EfwXXXValidator.validateExercise(number, result);

      return InkWell(
        onTap: hasWidget
            ? () => _showWidgetPreview(context, result, number, isValid)
            : null,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Exercise $number',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              if (hasWidget)
                Icon(
                  Icons.visibility,
                  color: Colors.blue,
                  size: 20,
                ),
              SizedBox(width: 8),Icon(
                isValid ? Icons.check_circle : Icons.cancel,
                color: isValid ? Colors.green : Colors.red,
                size: 20,
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _showWidgetPreview(
    BuildContext context, Widget widget, int number, bool isValid) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        width: 350,
        height: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFAD88C6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.visibility, color: Colors.white),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'EFWXXX - YOUR_MODULE_NAME',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    isValid ? Icons.check_circle : Icons.error,
                    color: isValid ? Colors.green : Colors.red,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: _buildPreviewSurface(widget),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildPreviewSurface(Widget widget) {
  // Implement smart rendering untuk widget types
  return Material(child: widget);
}
```

**✅ Checklist**:

- [ ] Preview icon
- [ ] Status icon (checkmark/X)
- [ ] InkWell untuk preview
- [ ] Dialog dengan purple header
- [ ] \_buildPreviewSurface dengan smart rendering
- [ ] Color header: 0xFFAD88C6

---

### Step 4: Update View

**File**: `lib/module/efwXXX_YOUR_MOD原型/view/efwXXX_YOUR_MODULE_view.dart`

```dart
import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

class EfwXXXYourModuleView extends StatefulWidget {
  const EfwXXXYourModuleView({Key? key}) : super(key: key);

  @override
  State<EfwXXXYourModuleView> createState() => _EfwXXXYourModuleViewState();
}

class _EfwXXXYourModuleViewState extends State<EfwXXXYourModuleView> {
  @override
  void initState() {
    super.initState();
    // Daftarkan instance ini ke EfwXXXProgressService
    EfwXXXProgressService.instance.setEaderView(this);
  }

  Widget? exercise1() {
    // INSTRUKSI: ...
    return YOUR_WIDGET_HERE();
  }

  // Tambahkan exercise methods untuk exercise lainnya

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5C6FF),
      appBar: AppBar(
        title: const Text("EFWXXX - YOUR_MODULE_NAME"),
        backgroundColor: const Color(0xFFAD88C6),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Debug Info Card
              Card(
                color: Colors.yellow[300],
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.all(16 primi types0),
                  child: Column(
                    children: [
                      Text('Debug Info',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Builder(
                        builder: (context) {
                          Widget? testWidget = exercise1();
                          bool isValid =
                              EfwXXXValidator.validateExercise(1, testWidget);
                          return Column(
                            children: [
                              Text(
                                  'Exercise 1 Widget: ${testWidget?.runtimeType}'),
                              Text('Is Valid: $isValid'),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Exercise Cards
              _buildExerciseCard(rowLabelEfwXXX(exercise1, 1)),
              _buildExerciseCard(rowLabelEfwXXX(exercise2, 2)),
              // ... tambahkan untuk semua exercises
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseCard(Widget child) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: child,
      ),
    );
  }
}
```

**✅ Checklist**:

- [ ] StatefulWidget dengan proper state
- [ ] initState() registers ke progress service
- [ ] All exercise methods return Widget?
- [ ] Debug info card
- [ ] Exercise cards dengan rowLabelEfwXXX
- [ ] Background color: 0xFFD5C6FF
- [ ] AppBar color: 0xFFAD88C6

---

### Step 5: Create Preview Screen

**File**: `lib/screens/efwXXX_preview_screen.dart`

```dart
import 'package:flutter/material.dart';

class EfwXXXPreviewScreen extends StatelessWidget {
  final int exerciseNumber;
  final Widget? widget;
  final bool isValid;

  const EfwXXXPreviewScreen({
    Key? key,
    required this.exerciseNumber,
    required this.widget,
    required this.isValid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5C6FF),
      appBar: AppBar(
        title: const Text('EFWXXX - YOUR_MODULE_NAME'),
        backgroundColor: const Color(0xFFAD88C6),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // Status badge
            ),
          ),
        ],
      ),
      body: Container(
        // Info card, preview card, validation card
      ),
    );
  }

  Widget _buildPreviewSurface(Widget widget) {
    // Smart rendering logic
  }
}
```

**✅ Checklist**:

- [ ] AppBar with correct title
- [ ] Info card dengan exercise number
- [ ] Preview card dengan status border
- [ ] Validation info card
- [ ] \_buildPreviewSurface method
- [ ] Background color: 0xFFD5C6FF
- [ ] AppBar color: 0xFFAD88C6

---

### Step 6: Update Core Exports

**File**: `lib/core.dart`

```dart
// Add these exports
export 'package:magicbook/shared/service/efwXXX_progress_service.dart';
export 'package:magicbook/shared/widget thereto_label/row_label_efwXXX.dart';
export 'package: pendidikan/module/efwXXX_YOUR_MODULE/validator/efwXXX_validator.dart';
export 'package:magicbook/screens/efwXXX_preview_screen.dart';
```

**✅ Checklist**:

- [ ] Service export
- [ ] Row label export
- [ ] Validator export
- [ ] Preview screen export

---

### Step 7: Update Module Exercise Service

**File**: `lib/shared/service/module_exercise_service.dart`

**7.1 Import**:

```dart
import 'efwXXX_progress_service.dart';
```

**7.2 getExerciseStatus()**:

```dart
} else if (moduleId == 'EFWXXX') {
  return EfwXXXProgressService.instance.getExerciseStatus();
}
```

**7.3 getTotalExercises 格**:

```dart
case 'EFWXXX':
  return YOUR_TOTAL_EXERCISES;
```

**7.4 \_getSampleExercises()**:

```dart
case 'EFWXXX':
  return List.generate(YOUR_TOTAL_EXERCISES, (index) {
    final exerciseNum = index + 1;
    return ExerciseInfo(...);
  });
```

**✅ Checklist**:

- [ ] Import service
- [ ] Add getExerciseStatus() case
- [ ] Add getTotalExercises() case
- [ ] Add \_getSampleExercises() case

---

### Step 8: Update Module Exercises Screen

**File**: `lib/screens/module_exercises_screen.dart`

**8.1 Imports**:

```dart
import '../shared/service/efwXXX_progress_service.dart';
import '../module/efwXXX_YOUR_MODULE/validator/efwXXX_validator.dart';
import 'efwXXX_preview_screen.dart';
```

**8.2 Preview Icon**:

```dart
if (widget.moduleId == 'EFW100' ||
    widget.moduleId == 'EFW200' ||
    widget.moduleId == 'EFWXXX')
  // Show preview button
```

**8.3 \_showPreviewWidget()**:

```dart
// EFWXXX Logic
if (widget.moduleId == 'EFWXXX') {
  final efwXXXView = EfwXXXProgressService.instance.efwXXXView;
  if (efwXXXView != null) {
    switch (exerciseNumber) {
      case 1: previewWidget = efwXXXView.exercise1(); break;
      // ... for all exercises
    }
  }
}
```

**8.4 Navigate**:

```dart
if (widget.moduleId == 'EFWXXX') {
  Navigator.push(context,
    MaterialPageRoute(builder: (context) => EfwXXXPreviewScreen(...))
  );
}
```

**8.5 \_getDefaultWidget()**:

```dart
if (widget.moduleId == 'EFWXXX') {
  return _getDefaultEfwXXXWidget(exerciseNumber);
}
```

**8.6 \_getDefaultEfwXXXWidget()**:

```dart
Widget? _getDefaultEfwXXXWidget(int exerciseNumber) {
  switch (exerciseNumber) {
    case 1: return YOUR_DEFAULT_WIDGET();
    // ... for all exercises
  }
}
```

**✅ Checklist**:

- [ ] Imports
- [ ] Preview icon logic
- [ ] \_showPreviewWidget() EFWXXX logic
- [ ] Navigation logic
- [ ] \_getDefaultWidget() case
- [ ] \_getDefaultEfwXXXWidget() method

---

## 🎯 Module-Specific Information

### EFW300 - ListView

- **Total Exercises**: ~15 exercises
- **Focus**: ListView, ListTile, ListView.builder, etc.
- **Key Widgets**: ListView, ListTile, ListView.separated

### EFW301 - ListView Advanced

- **Total Exercises**: ~12 exercises
- **Focus**: Advanced ListView features
- **Key Widgets**: SliverList, ReorderableListView, etc.

### EFW400 - GridView

- **Total Exercises**: ~15 exercises
- **Focus**: GridView, GridView.builder, etc.
- **Key Widgets**: GridView, GridView.count, GridView.extent

---

## 🔄 Copy-Paste Checklist

Untuk setiap modul (EFW300, EFW301, EFW400), copy files dan update:

- [ ] efwXXX_validator.dart
- [ ] efwXXX_progress_service.dart
- [ ] row_label_efwXXX.dart
- [ ] efwXXX_YOUR_MODULE_view.dart
- [ ] efwXXX_preview_screen.dart
- [ ] Update core.dart exports
- [ ] Update module_exercise_service.dart
- [ ] Update module_exercises_screen.dart
- [ ] Test all exercises
- [ ] Test preview functionality
- [ ] Test save to Firebase
- [ ] Test status updates

---

## 📝 Notes

1. **Naming Convention**:

   - Services: `efwXXX_progress_service.dart`
   - Validators: `efwXXX_validator.dart`
   - Row labels: `row_label_efwXXX.dart`
   - Views: `efwXXX_YOUR_MODULE_view.dart`
   - Screens: `efwXXX_preview_screen.dart`

2. **Color Scheme**:

   - Background: `Color(0xFFD5C6FF)`
   - AppBar: `Color(0xFFAD88C6)`
   - White: `Colors.white`

3. **Total Exercises**:

   - EFW300: 15 exercises
   - EFW301: 12 exercises
   - EFW400: 15 exercises

4. **Common Widgets**:
   - Each module needs smart \_buildPreviewSurface for its widgets
   - ListView widgets need special rendering
   - GridView widgets need special rendering

---

**Good luck implementing EFW300, EFW301, and EFW release! 🚀**
