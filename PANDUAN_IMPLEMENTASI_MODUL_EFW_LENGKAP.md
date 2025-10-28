# PANDUAN IMPLEMENTASI MODUL EFW LENGKAP

## Panduan Penerapan Sistem EFW100 ke EFW200, EFW300, EFW301, EFW400

**Tanggal:** 2024  
**Versi:** 1.0  
**Modul Target:** EFW200, EFW300, EFW301, EFW400

---

## 📋 DAFTAR ISI

1. [Overview Sistem EFW](#1-overview-sistem-efw)
2. [Struktur File EFW100](#2-struktur-file-efw100)
3. [Langkah Implementasi](#3-langkah-implementasi)
4. [Templat Implementasi](#4-templat-implementasi)
5. [Checklist Implementasi](#5-checklist-implementasi)

---

## 1. OVERVIEW SISTEM EFW

### Perbedaan Sistem EFW vs EFD

| Aspek                       | EFD (Data Types)         | EFW (Widgets)                 |
| --------------------------- | ------------------------ | ----------------------------- |
| **Validator**               | Fungsi boolean (`bool?`) | Validasi widget (`Widget?`)   |
| **Return Type**             | `bool?`                  | `Widget?`                     |
| **Validasi**                | Output function          | Struktur widget tree          |
| **Preview**                 | Tampilkan output text    | Tampilkan widget              |
| **Progress Service**        | Tidak perlu              | Perlu `EfwXXXProgressService` |
| **Module Exercise Service** | Langsung ke validator    | Via progress service          |

### Konsep Utama

- **Widget-based validation**: Student membuat widget, sistem memvalidasi struktur
- **Preview system**: Widget ditampilkan dalam preview screen
- **Progress service**: Service untuk track progress dan akses view instance
- **Row label**: UI component khusus untuk menampilkan status dan preview button

---

## 2. STRUKTUR FILE EFW100

```
lib/
├── module/
│   └── efw100_common_widget/
│       ├── view/
│       │   └── efw100_common_widget_view.dart       # Main view dengan exercise methods
│       └── validator/
│           └── efw100_validator.dart                # Validator untuk setiap exercise
├── shared/
│   ├── widget/
│   │   └── row_label/
│   │       └── row_label_efw100.dart                # UI component untuk exercise list
│   └── service/
│       └── efw100_progress_service.dart             # Service untuk progress tracking
└── screens/
    └── efw100_preview_screen.dart                   # Preview screen untuk widget
```

---

## 3. LANGKAH IMPLEMENTASI

### **PHASE 1: Persiapan Struktur File**

#### **Step 1.1: Copy Template File**

```bash
# Untuk EFW200
cp -r lib/module/efw100_common_widget lib/module/efw200_layout_backup
```

#### **Step 1.2: Buat File Validator**

Buat file: `lib/module/efw200_layout/validator/efw200_validator.dart`

```dart
import 'package:flutter/material.dart';

class Efw200Validator {
  static bool validateExercise(int exerciseNumber, Widget? widget) {
    // Validasi spesifik untuk setiap exercise
    switch (exerciseNumber) {
      case 1:
        return _validateExercise1(widget);
      case 2:
        return _validateExercise2(widget);
      // ... dst
      default:
        return false;
    }
  }

  static bool _validateExercise1(Widget? widget) {
    if (widget is! Row) return false;
    // Validasi spesifik Row
    return true;
  }

  static bool _validateExercise2(Widget? widget) {
    if (widget is! Column) return false;
    // Validasi spesifik Column
    return true;
  }
}
```

#### **Step 1.3: Buat Progress Service**

Buat file: `lib/shared/service/efw200_progress_service.dart`

```dart
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
    if (_efw200View == null) return {};

    try {
      Map<String, bool> status = {};
      for (int i = 1; i <= 15; i++) {
        final exerciseId = 'EFW200_ex$i';
        Widget? widget;

        // Panggil method exercise dari view
        switch (i) {
          case 1:
            widget = _efw200View.exercise1();
            break;
          // ... dst
        }

        status[exerciseId] = Efw200Validator.validateExercise(i, widget);
      }
      return status;
    } catch (e) {
      print('Error getting EFW200 status: $e');
      return {};
    }
  }
}
```

#### **Step 1.4: Update View File**

Modifikasi: `lib/module/efw200_layout/view/efw200_layout_view.dart`

```dart
import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

class Efw200LayoutView extends StatefulWidget {
  const Efw200LayoutView({Key? key}) : super(key: key);

  @override
  State<Efw200LayoutView> createState() => _Efw200LayoutViewState();
}

class _Efw200LayoutViewState extends State<Efw200LayoutView> {
  @override
  void initState() {
    super.initState();
    // Daftarkan instance ini ke Efw200ProgressService
    Efw200ProgressService.instance.setEfw200View(this);
  }

  // Exercise methods - siswa akan mengisi ini
  Widget? exercise1() {
    // INSTRUKSI: Buat sebuah Row dengan 3 Container berwarna berbeda
    return Row(
      children: [
        Container(width: 50, height: 50, color: Colors.red),
        Container(width: 50, height: 50, color: Colors.green),
        Container(width: 50, height: 50, color: Colors.blue),
      ],
    );
  }

  Widget? exercise2() {
    // INSTRUKSI: Buat sebuah Column dengan 3 Text widget
    return Column(
      children: [
        Text("Text 1"),
        Text("Text 2"),
        Text("Text 3"),
      ],
    );
  }

  // ... dst untuk exercise 3-15

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5C6FF),
      appBar: AppBar(
        title: const Text("EFW200 - Layout"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Debug Info Card
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.yellow[300],
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text('Debug Info',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Builder(
                          builder: (context) {
                            Widget? testWidget = exercise1();
                            bool isValid =
                                Efw200Validator.validateExercise(1, testWidget);
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
              ),
              SizedBox(height: 16),

              // Exercise Cards
              _buildExerciseCard(rowLabelEfw200(exercise1, 1)),
              _buildExerciseCard(rowLabelEfw200(exercise2, 2)),
              // ... dst untuk exercise 3-15
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

#### **Step 1.5: Buat Row Label**

Buat file: `lib/shared/widget/row_label/row_label_efw200.dart`

```dart
import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

Widget rowLabelEfw200(Widget? Function() func, int number) {
  return Builder(
    builder: (context) {
      final result = func();
      final hasWidget = result != null;
      final isValid = Efw200Validator.validateExercise(number, result);

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
              SizedBox(width: 8),
              Icon(
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

void _showWidgetPreview(BuildContext context, Widget widget, int number, bool isValid) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        width: 350,
        height: 400,
        decoration: BoxDecoration(
          border: Border.all(
            color: isValid ? Colors.green : Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.purple,
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
                      'EFW200 - Layout',
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
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
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
  // Implementasi preview surface seperti EFW100
  return Material(child: widget);
}
```

---

### **PHASE 2: Integrasi dengan System**

#### **Step 2.1: Update Module Exercise Service**

Tambahkan di `lib/shared/service/module_exercise_service.dart`:

```dart
// Di method getExerciseStatus, tambahkan:
else if (moduleId == 'EFW200') {
  return Efw200ProgressService.instance.getExerciseStatus();
}
```

#### **Step 2.2: Update module_exercises_screen.dart**

Tambahkan handling untuk EFW200 di `_showPreviewWidget`:

```dart
if (widget.moduleId == 'EFW200') {
  // Logic untuk EFW200 preview
}
```

#### **Step 2.3: Update core.dart**

Tambahkan export:

```dart
export 'package:magicbook/shared/service/efw200_progress_service.dart';
export 'package:magicbook/shared/widget/row_label/row_label_efw200.dart';
export 'package:magicbook/module/efw200_layout/view/efw200_layout_view.dart';
export 'package:magicbook/module/efw200_layout/validator/efw200_validator.dart';
```

---

## 4. TEMPLAT IMPLEMENTASI

### **Template Progress Service**

```dart
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
    if (_efwXXXView == null) return {};

    try {
      Map<String, bool> status = {};
      for (int i = 1; i <= TOTAL_EXERCISES; i++) {
        final exerciseId = 'EFWXXX_ex$i';
        Widget? widget;

        switch (i) {
          case 1: widget = _efwXXXView.exercise1(); break;
          case 2: widget = _efwXXXView.exercise2(); break;
          // ... dst
        }

        status[exerciseId] = EfwXXXValidator.validateExercise(i, widget);
      }
      return status;
    } catch (e) {
      print('Error getting EFWXXX status: $e');
      return {};
    }
  }
}
```

### **Template Validator**

```dart
class EfwXXXValidator {
  static bool validateExercise(int exerciseNumber, Widget? widget) {
    switch (exerciseNumber) {
      case 1: return _validateExercise1(widget);
      case 2: return _validateExercise2(widget);
      // ... dst
      default: return false;
    }
  }

  static bool _validateExercise1(Widget? widget) {
    // Validasi spesifik exercise 1
    if (widget is! ExpectedWidgetType) return false;
    // Validasi tambahan
    return true;
  }
}
```

### **Template View**

```dart
class _EfwXXXViewState extends State<EfwXXXView> {
  @override
  void initState() {
    super.initState();
    EfwXXXProgressService.instance.setEfwXXXView(this);
  }

  Widget? exercise1() {
    // Implementasi sesuai instruksi
    return ExpectedWidget(...);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // UI implementation
    );
  }
}
```

---

## 5. CHECKLIST IMPLEMENTASI

### **Untuk Setiap Modul (EFW200, EFW300, EFW301, EFW400)**

- [ ] **1. Buat Validator**

  - [ ] File: `lib/module/efwXXX/validator/efwXXX_validator.dart`
  - [ ] Implement method `validateExercise(int number, Widget? widget)`
  - [ ] Implement validasi spesifik untuk setiap exercise

- [ ] **2. Buat Progress Service**

  - [ ] File: `lib/shared/service/efwXXX_progress_service.dart`
  - [ ] Implement singleton pattern
  - [ ] Implement `setEfwXXXView` method
  - [ ] Implement `getExerciseStatus` method

- [ ] **3. Update View**

  - [ ] Ubah return type dari `bool?` ke `Widget?`
  - [ ] Implement exercise methods dengan return `Widget?`
  - [ ] Register di `initState`
  - [ ] Update UI dengan row_label

- [ ] **4. Buat Row Label**

  - [ ] File: `lib/shared/widget/row_label/row_label_efwXXX.dart`
  - [ ] Implement `rowLabelEfwXXX` function
  - [ ] Implement `_showWidgetPreview` function
  - [ ] Implement `_buildPreviewSurface` function

- [ ] **5. Integrasi System**

  - [ ] Update `module_exercise_service.dart`
  - [ ] Update `module_exercises_screen.dart`
  - [ ] Update `core.dart` untuk exports
  - [ ] Update `module_service.dart` untuk total exercises

- [ ] **6. Testing**
  - [ ] Test preview system
  - [ ] Test progress tracking
  - [ ] Test validator
  - [ ] Test Firebase save

---

## 6. CATATAN PENTING

### **Perbedaan Utama dengan EFD**

1. **Return Type**: `Widget?` bukan `bool?`
2. **Validator**: Validasi widget tree, bukan output
3. **Preview**: Tampilkan widget, bukan text
4. **Progress Service**: Diperlukan untuk akses view instance
5. **Row Label**: UI component khusus dengan preview button

### **Tips Implementasi**

1. **Start Small**: Implement 1-2 exercises dulu, baru expand
2. **Test Incrementally**: Test setiap component sebelum lanjut
3. **Copy Pattern**: Gunakan EFW100 sebagai template
4. **Debug**: Gunakan print statements untuk debugging
5. **Document**: Catat perubahan penting

### **Common Issues & Solutions**

| Issue                 | Solution                                         |
| --------------------- | ------------------------------------------------ |
| Preview tidak muncul  | Check `rowLabelEfwXXX` implementation            |
| Validator tidak jalan | Check `validateExercise` method                  |
| Progress tidak save   | Check `module_exercise_service.dart` integration |
| UI tidak update       | Check `initState` registration                   |

---

## 7. TEMPLAT LENGKAP

Lihat file lengkap di direktori:

- `lib/module/efw100_common_widget/` → Template lengkap
- `lib/shared/service/efw100_progress_service.dart` → Service template
- `lib/shared/widget/row_label/row_label_efw100.dart` → Row label template

---

**End of Document**
