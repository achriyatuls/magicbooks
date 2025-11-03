# 🎯 PANDUAN DUPLIKASI MODUL EXERCISES - EFW Modules

## 📋 DAFTAR ISI
1. [Overview](#overview)
2. [Struktur File yang Telah Dipisahkan](#struktur-file-yang-telah-dipisahkan)
3. [Langkah-Langkah Duplikasi](#langkah-langkah-duplikasi)
4. [Format File Exercises](#format-file-exercises)
5. [Update View File](#update-view-file)
6. [Update Progress Service (Jika Ada)](#update-progress-service-jika-ada)
7. [Update core.dart](#update-core.dart)
8. [Verifikasi](#verifikasi)

---

## 🎯 OVERVIEW

Modul EFW100, EFW200, EFW300, EFW301, dan EFW400 telah dipisahkan struktur filenya. **Exercises** yang sebelumnya ada di dalam file **View** sekarang berada di file terpisah di folder **exercises/**.

### Kenapa Perlu Dipisah?
✅ **Separation of Concerns**: View fokus pada UI, Exercises fokus pada logika  
✅ **Maintainability**: Lebih mudah maintain dan debug  
✅ **Consistency**: Mengikuti pattern yang sama dengan modul EFD  
✅ **Reusability**: Exercises bisa dipakai ulang di tempat lain  

---

## 📁 STRUKTUR FILE YANG TELAH DIPISAHKAN

### EFW100 - Common Widget
```
lib/module/efw100_common_widget/
├── exercises/
│   └── efw100_exercises.dart          ← BARU! File exercises yang terpisah
├── validator/
│   └── efw100_validator.dart
└── view/
    └── efw100_common_widget_view.dart  ← Updated: Menggunakan efw100_exercises.dart
```

### EFW200 - Layout
```
lib/module/efw200_layout/
├── exercises/
│   └── efw200_exercises.dart          ← BARU! File exercises yang terpisah
├── validator/
│   └── efw200_validator.dart
└── view/
    └── efw200_layout_view.dart        ← Updated: Menggunakan efw200_exercises.dart
```

### EFW300 - List
```
lib/module/efw300_list/
├── exercises/
│   └── efw300_exercises.dart          ← BARU! File exercises yang terpisah
├── controller/
│   └── efw300_list_controller.dart
├── validator/
│   └── efw300_validator.dart
└── view/
    └── efw300_list_view.dart          ← Updated: Menggunakan efw300_exercises.dart
```

### EFW301 - List Advanced
```
lib/module/efw301_list/
├── exercises/
│   └── efw301_exercises.dart          ← BARU! File exercises yang terpisah
├── controller/
│   └── efw301_list_controller.dart
├── validator/
│   └── efw301_validator.dart
└── view/
    └── efw301_list_view.dart          ← Updated: Menggunakan efw301_exercises.dart
```

### EFW400 - Grid
```
lib/module/efw400_grid/
├── exercises/
│   └── efw400_exercises.dart          ← BARU! File exercises yang terpisah
├── controller/
│   └── efw400_grid_controller.dart
├── validator/
│   └── efw400_validator.dart
└── view/
    └── efw400_grid_view.dart          ← Updated: Menggunakan efw400_exercises.dart
```

---

## 🔧 LANGKAH-LANGKAH DUPLIKASI

Jika Anda ingin membuat modul EFW baru atau merestruktur modul existing, ikuti langkah berikut:

### STEP 1: Buat Folder exercises/
```bash
mkdir lib/module/[nama_modul]/exercises
```

### STEP 2: Buat File Exercises
Buat file `[nama_modul]_exercises.dart` di dalam folder exercises/

---

## 📝 FORMAT FILE EXERCISES

Contoh file exercises yang baik:

```dart
// LEMBAR KERJA SISWA - [NAMA_MODUL] [JUDUL]
//
// ════════════════════════════════════════════════════════════════════════════
// PETUNJUK PENGGUNAAN:
// ════════════════════════════════════════════════════════════════════════════
//
// 1. File ini BOLEH diubah untuk menjawab exercise
// 2. Tulis kode HANYA di area yang ditandai dengan "TULIS KODE DI SINI"
// 3. JANGAN mengubah:
//    - Nama function
//    - Parameter function
//    - Return statement (kecuali diminta)
//
// ════════════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';

/// Class yang berisi jawaban siswa untuk semua exercise
class [NamaModul]Exercises {
  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 1: [Judul Exercise]
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: [Detail instruksi]
  static Widget? exercise1() {
    // TULIS KODE DI SINI:
    return Container(
      // Kode exercises di sini
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 2: [Judul Exercise]
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: [Detail instruksi]
  static Widget? exercise2() {
    // TULIS KODE DI SINI:
    return Text("Hello");
  }

  // ... exercise 3, 4, 5, dst
}
```

**PENTING:**
- ✅ Nama class: `[NamaModul]Exercises` (contoh: `Efw100Exercises`)
- ✅ Semua method harus `static`
- ✅ Return type: `Widget?`
- ✅ Penamaan method: `exercise[1-999]()`
- ✅ Setiap exercise harus ada komentar instruksi yang jelas

---

## 🔄 UPDATE VIEW FILE

Setelah membuat file exercises, update file view untuk menggunakan exercises class tersebut.

### BEFORE (Old Pattern):
```dart
class Efw100CommonWidgetView extends StatefulWidget {
  // Exercise methods - siswa akan mengisi ini
  Widget? exercise1() {
    // Buat sebuah Container dengan lebar 100, tinggi 100, dan warna merah
    return Container(
      width: 100,
      height: 100,
      color: Colors.red,
    );
  }

  Widget? exercise2() {
    // ... kode exercise di sini
  }
  // ... dst banyak code
}
```

### AFTER (New Pattern):
```dart
import '../exercises/efw100_exercises.dart';

class Efw100CommonWidgetView extends StatefulWidget {
  // Exercise methods - siswa akan mengisi ini di file efw100_exercises.dart
  Widget? exercise1() => Efw100Exercises.exercise1();
  Widget? exercise2() => Efw100Exercises.exercise2();
  Widget? exercise3() => Efw100Exercises.exercise3();
  Widget? exercise4() => Efw100Exercises.exercise4();
  Widget? exercise5() => Efw100Exercises.exercise5();
  // ... dst
}
```

**Langkah-Langkah:**
1. ✅ Import file exercises: `import '../exercises/[nama_modul]_exercises.dart';`
2. ✅ Ganti semua method exercise menjadi one-liner delegasi
3. ✅ Update komentar untuk memberitahu siswa bahwa exercises ada di file terpisah
4. ✅ **HAPUS** semua implementasi old exercises dari view

---

## 🔧 UPDATE PROGRESS SERVICE (JIKA ADA)

Untuk modul yang punya ProgressService (seperti EFW100), update service untuk menggunakan exercises class.

### EFW100 Progress Service:
```dart
import '../../module/efw100_common_widget/exercises/efw100_exercises.dart';

class Efw100ProgressService {
  // ...

  Map<String, bool> _getDefaultExerciseStatus() {
    Map<String, bool> status = {};

    for (int i = 1; i <= 15; i++) {
      final exerciseId = 'EFW100_ex$i';

      try {
        Widget? testWidget;
        switch (i) {
          case 1:
            testWidget = Efw100Exercises.exercise1();  // ← Gunakan Exercises class
            break;
          case 2:
            testWidget = Efw100Exercises.exercise2();
            break;
          // ... dst
        }

        final isValid = Efw100Validator.validateExercise(i, testWidget);
        status[exerciseId] = isValid;
      } catch (e) {
        print('Error testing EFW100 exercise $i: $e');
        status[exerciseId] = false;
      }
    }

    return status;
  }
}
```

---

## 📦 UPDATE core.dart

Tambahkan export untuk file exercises baru di `lib/core.dart`:

```dart
//modul efw100 (atau nama modul Anda)
export 'package:magicbook/module/efw100_common_widget/view/efw100_common_widget_view.dart';
export 'package:magicbook/module/efw100_common_widget/exercises/efw100_exercises.dart';  // ← Tambahkan ini
export 'package:magicbook/module/efw100_common_widget/validator/efw100_validator.dart';
// ... lainnya
```

---

## ✅ VERIFIKASI

Setelah semua perubahan selesai, lakukan verifikasi:

### 1. Check Linter Errors
```bash
flutter analyze
```

Jika ada linter errors, fix terlebih dahulu.

### 2. Test App
```bash
flutter run
```

Pastikan app berjalan tanpa error.

### 3. Manual Test
- ✅ Buka modul di app
- ✅ Test preview untuk beberapa exercise
- ✅ Pastikan validation masih bekerja
- ✅ Pastikan UI tampil dengan benar

### 4. Check File Structure
```bash
tree lib/module/[nama_modul]/
```

Pastikan struktur folder sudah benar.

---

## 🎯 CONTOH LENGKAP: EFW100

### File: `lib/module/efw100_common_widget/exercises/efw100_exercises.dart`
```dart
import 'package:flutter/material.dart';

class Efw100Exercises {
  static Widget? exercise1() {
    return Container(
      width: 100,
      height: 100,
      color: Colors.red,
    );
  }

  static Widget? exercise2() {
    return Text(
      "Hello Flutter",
      style: TextStyle(fontSize: 24),
    );
  }
  // ... exercise lainnya
}
```

### File: `lib/module/efw100_common_widget/view/efw100_common_widget_view.dart`
```dart
import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../exercises/efw100_exercises.dart';

class Efw100CommonWidgetView extends StatefulWidget {
  const Efw100CommonWidgetView({Key? key}) : super(key: key);

  @override
  State<Efw100CommonWidgetView> createState() => _Efw100CommonWidgetViewState();
}

class _Efw100CommonWidgetViewState extends State<Efw100CommonWidgetView> {
  @override
  void initState() {
    super.initState();
    Efw100ProgressService.instance.setEfw100View(this);
  }

  // Exercise methods - siswa akan mengisi ini di file efw100_exercises.dart
  Widget? exercise1() => Efw100Exercises.exercise1();
  Widget? exercise2() => Efw100Exercises.exercise2();
  // ... exercise lainnya

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("EFW100 - Common Widget")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildExerciseCard(rowLabelEfw100(exercise1, 1)),
            _buildExerciseCard(rowLabelEfw100(exercise2, 2)),
            // ... dst
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseCard(Widget child) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
```

### File: `lib/core.dart`
```dart
//modul efw100
export 'package:magicbook/module/efw100_common_widget/view/efw100_common_widget_view.dart';
export 'package:magicbook/module/efw100_common_widget/exercises/efw100_exercises.dart';
export 'package:magicbook/module/efw100_common_widget/validator/efw100_validator.dart';
export 'package:magicbook/shared/widget/row_label/row_label_efw100.dart';
```

---

## 🚨 TROUBLESHOOTING

### Error: "The static method can't be accessed through an instance"
**Solusi:** Pastikan semua method di Exercises class adalah `static`

### Error: "Undefined name 'EfwXXXExercises'"
**Solusi:** Pastikan sudah import file exercises di view

### Error: "Module not found"
**Solusi:** Pastikan sudah menambahkan export di `lib/core.dart`

### Preview tidak muncul
**Solusi:** Check apakah ProgressService sudah di-update untuk menggunakan Exercises class

---

## 📌 CHECKLIST DUPLIKASI

Saat menduplikasi modul baru, pastikan:

- [ ] Folder `exercises/` sudah dibuat
- [ ] File `[nama_modul]_exercises.dart` sudah dibuat dengan format yang benar
- [ ] View file sudah di-update untuk menggunakan Exercises class
- [ ] Implementasi old exercises dihapus dari view
- [ ] Progress Service (jika ada) sudah di-update
- [ ] Export di `lib/core.dart` sudah ditambahkan
- [ ] `flutter analyze` tidak ada error
- [ ] App berjalan tanpa error
- [ ] Manual test berhasil
- [ ] File structure sudah benar

---

## 🎓 KESIMPULAN

Struktur exercises yang terpisah membuat code lebih:
- ✅ **Clean**: View hanya fokus pada UI
- ✅ **Maintainable**: Mudah di-maintain dan di-debug
- ✅ **Consistent**: Mengikuti pattern yang sama dengan modul lain
- ✅ **Professional**: Code organization yang lebih baik

**Untuk pertanyaan atau bantuan lebih lanjut, hubungi tim development.**

---

**Last Updated:** 2024
**Version:** 1.0
**Author:** Development Team

