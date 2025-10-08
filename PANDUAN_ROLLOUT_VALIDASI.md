# 🚀 PANDUAN ROLLOUT: Sistem Validasi ke Semua Module

## 📋 Overview

Dokumen ini menjelaskan cara menerapkan sistem validasi yang sudah berhasil di **EFD1100 Variable** ke semua module exercise lainnya.

---

## 🎯 Module Target

| #   | Module               | Status      | Est. Exercises | Priority    |
| --- | -------------------- | ----------- | -------------- | ----------- |
| 1   | EFD1100 Variable     | ✅ COMPLETE | 35             | DONE        |
| 2   | EFB100 Null Safety   | ⏳ To Do    | ~28            | ⭐⭐⭐ High |
| 3   | EFD1200 DateTime     | ⏳ To Do    | ~30            | ⭐⭐ Medium |
| 4   | EFD1300 String       | ⏳ To Do    | ~35            | ⭐⭐ Medium |
| 5   | EFD1400 Number       | ⏳ To Do    | ~30            | ⭐⭐ Medium |
| 6   | EFD1500 IF Statement | ⏳ To Do    | ~40            | ⭐⭐ Medium |
| 7   | EFD1600 List and Map | ⏳ To Do    | ~45            | ⭐ Low      |
| 8   | EFD1700 Regex        | ⏳ To Do    | ~20            | ⭐ Low      |

**Total Estimasi:** ~260+ exercises

---

## 📝 LANGKAH-LANGKAH ROLLOUT

### STEP 1: Analisis Module

1. **Buka file view module** (contoh: `efb100_null_safety_view.dart`)
2. **Hitung jumlah exercises** dengan grep:
   ```bash
   grep -c "exercise[0-9]" lib/module/efb100_null_safety/view/efb100_null_safety_view.dart
   ```
3. **Identifikasi jenis exercises:**
   - Print-based (void function dengan print)
   - Return-based (bool function dengan return)
   - Mixed

### STEP 2: Buat Folder Structure

```bash
mkdir -p lib/module/MODULENAME/exercises
mkdir -p lib/module/MODULENAME/tests
mkdir -p lib/module/MODULENAME/validator
```

### STEP 3: Extract Exercises ke File Terpisah

**Template:**

```dart
// lib/module/MODULENAME/exercises/MODULENAME_exercises.dart

/// 📝 LEMBAR KERJA SISWA - MODULENAME
class ModuleNameExercises {

  // Exercise 1
  static ReturnType exercise1Solution(ParamType param) {
    ReturnType? output;

    // 👇 TULIS KODE DI SINI:

    return output;
  }

  // ... dst untuk semua exercises
}
```

### STEP 4: Buat Test Cases

**Template:**

```dart
// lib/module/MODULENAME/tests/MODULENAME_tests.dart

import '../exercises/MODULENAME_exercises.dart';

// Copy TestCase & TestResult classes dari efd1100_tests.dart

class ModuleNameTests {

  static TestResult testExercise1() {
    List<TestCase<InputType, OutputType>> testCases = [
      TestCase(input: ..., expected: ..., description: "..."),
      // ... 3-8 test cases
    ];

    int passed = 0;
    int total = testCases.length;
    List<String> errors = [];

    for (var testCase in testCases) {
      try {
        var result = ModuleNameExercises.exercise1Solution(testCase.input);

        if (result == testCase.expected) {
          passed++;
        } else {
          errors.add("❌ ${testCase.description}: ...");
        }
      } catch (e) {
        errors.add("💥 Error: $e");
      }
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("💡 Hint 1");
      hints.add("💡 Hint 2");
    }

    return TestResult(
      exerciseName: "Exercise 1: Description",
      exerciseNumber: 1,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ... repeat untuk semua exercises
}
```

### STEP 5: Buat Validator

**Template:**

```dart
// lib/module/MODULENAME/validator/MODULENAME_validator.dart

import '../tests/MODULENAME_tests.dart';

class ModuleNameValidator {
  static TestResult runTest(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        return ModuleNameTests.testExercise1();
      case 2:
        return ModuleNameTests.testExercise2();
      // ... semua exercises
      default:
        return TestResult(
          exerciseName: "Exercise $exerciseNumber",
          exerciseNumber: exerciseNumber,
          passed: 0,
          total: 1,
          isPerfect: false,
          errors: ["⚠️ Test belum diimplementasi"],
        );
    }
  }

  static Map<int, TestResult> runAllTests() {
    Map<int, TestResult> results = {};
    List<int> implementedExercises = [1, 2, 3, /* ... semua */];

    for (int exerciseNum in implementedExercises) {
      try {
        results[exerciseNum] = runTest(exerciseNum);
      } catch (e) {
        results[exerciseNum] = TestResult(
          exerciseName: "Exercise $exerciseNum",
          exerciseNumber: exerciseNum,
          passed: 0,
          total: 1,
          isPerfect: false,
          errors: ["💥 Fatal error: $e"],
        );
      }
    }

    return results;
  }

  static OverallStats getOverallStats() {
    var allResults = runAllTests();

    int totalExercises = allResults.length;
    int perfectExercises = allResults.values.where((r) => r.isPerfect).length;
    int partialExercises = allResults.values.where((r) => r.passed > 0 && !r.isPerfect).length;
    int failedExercises = allResults.values.where((r) => r.passed == 0).length;

    int totalTests = 0;
    int passedTests = 0;

    for (var result in allResults.values) {
      totalTests += result.total;
      passedTests += result.passed;
    }

    return OverallStats(
      totalExercises: totalExercises,
      perfectExercises: perfectExercises,
      partialExercises: partialExercises,
      failedExercises: failedExercises,
      totalTests: totalTests,
      passedTests: passedTests,
    );
  }
}

// Copy OverallStats class dari efd1100_validator.dart
```

### STEP 6: Update View

**Template:**

```dart
// lib/module/MODULENAME/view/MODULENAME_view.dart

import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../../../shared/widget/row_label/row_label_validated.dart';

class ModuleNameView extends StatefulWidget {
  const ModuleNameView({Key? key}) : super(key: key);

  Widget build(context, ModuleNameController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: const Color(0xFFE5D9F2),
      appBar: AppBar(
        title: const Text("Module Name"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics),
            onPressed: () {
              OverallStats stats = ModuleNameValidator.getOverallStats();
              showOverallStatsDialog(stats);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildInfoBanner(),
              _buildQuickStatsCard(),
              _buildSectionTitle("📝 Exercise List"),
              _buildExerciseCard(rowLabelValidated(1)),
              _buildExerciseCard(rowLabelValidated(2)),
              // ... semua exercises
            ],
          ),
        ),
      ),
    );
  }

  // Copy helper methods dari efd1100_variable_view.dart:
  // - _buildInfoBanner()
  // - _buildQuickStatsCard()
  // - _buildSectionTitle()
  // - _buildExerciseCard()
  // - _buildInstructionsCard()
  // - _buildInstructionItem()
  // - _showRunAllTestsDialog()
}
```

### STEP 7: Update Core.dart

```dart
export 'package:magicbook/module/MODULENAME/exercises/MODULENAME_exercises.dart';
export 'package:magicbook/module/MODULENAME/tests/MODULENAME_tests.dart';
export 'package:magicbook/module/MODULENAME/validator/MODULENAME_validator.dart';
```

### STEP 8: Test & Verify

```bash
# Analyze
flutter analyze lib/module/MODULENAME/

# Manual test
dart <<EOF
import 'lib/module/MODULENAME/validator/MODULENAME_validator.dart';
void main() {
  var stats = ModuleNameValidator.getOverallStats();
  print("Total: \${stats.totalExercises}");
  print("Tests: \${stats.totalTests}");
}
EOF
```

---

## 🛠️ TOOLS & HELPERS

### Script: Extract Exercises dari View

Karena task ini sangat besar, saya sudah membuat contoh lengkap di **EFD1100 Variable**.

Untuk rollout ke module lain, Anda bisa:

1. **Copy folder structure dari EFD1100:**

   ```bash
   cp -r lib/module/efd1100_variable/exercises lib/module/MODULENAME/
   cp -r lib/module/efd1100_variable/tests lib/module/MODULENAME/
   cp -r lib/module/efd1100_variable/validator lib/module/MODULENAME/
   ```

2. **Rename classes:**

   - `Efd1100Exercises` → `ModuleNameExercises`
   - `Efd1100Tests` → `ModuleNameTests`
   - `Efd1100Validator` → `ModuleNameValidator`

3. **Extract exercises dari view lama**
4. **Buat test cases untuk setiap exercise**
5. **Update validator dengan semua exercise numbers**
6. **Update view untuk gunakan rowLabelValidated()**

---

## 📊 ESTIMASI EFFORT

| Module  | Exercises | Est. Time | Complexity              |
| ------- | --------- | --------- | ----------------------- |
| EFB100  | ~28       | 2-3 hours | Medium (print-based)    |
| EFD1200 | ~30       | 2-3 hours | Medium (datetime logic) |
| EFD1300 | ~35       | 2-3 hours | Medium (string ops)     |
| EFD1400 | ~30       | 2-3 hours | Medium (number ops)     |
| EFD1500 | ~40       | 3-4 hours | High (if/else logic)    |
| EFD1600 | ~45       | 3-4 hours | High (list/map complex) |
| EFD1700 | ~20       | 2 hours   | Medium (regex patterns) |

**Total Estimasi:** 18-24 jam kerja

---

## ⚡ QUICK START: Rollout 1 Module

Saya akan demonstrate dengan mengimplementasikan sistem untuk **1 module lagi** sebagai contoh praktis.

**Pilihan:** Implementasi untuk module mana dulu?

- EFB100 Null Safety (High priority, ~28 exercises)
- EFD1200 DateTime (Medium, ~30 exercises)
- EFD1300 String (Medium, ~35 exercises)

Untuk efisiensi, saya rekomendasikan:

1. **Implement 1 module completely** sebagai template kedua
2. **Buat script generator** untuk automate sebagian proses
3. **Dokumentasi detail** cara manual rollout

---

## 🎓 REKOMENDASI

### Option A: Manual Rollout (Bertahap)

**Pros:**

- Control penuh atas test cases
- Quality assurance tinggi
- Customizable per module

**Cons:**

- Time consuming (~20 jam total)
- Repetitive work

**Timeline:**

- Week 1: EFB100, EFD1200
- Week 2: EFD1300, EFD1400
- Week 3: EFD1500, EFD1600, EFD1700

### Option B: Semi-Automated (Recommended)

**Pros:**

- Faster (extract exercises automatic)
- Human verify test cases
- Balance speed & quality

**Cons:**

- Perlu buat generator script
- Still manual untuk test cases

**Timeline:**

- Day 1: Buat generator script
- Day 2-3: Rollout semua modules
- Day 4-5: Review & refine test cases

### Option C: Prioritized Rollout

**Pros:**

- Focus on high-impact modules first
- Get student feedback early
- Iterate based on usage

**Cons:**

- Some modules tetap old system
- Inconsistent experience

**Timeline:**

- Week 1: EFB100, EFD1300 (high usage)
- Week 2: Review & iterate
- Week 3+: Rollout sisanya based on feedback

---

## 💡 YANG SUDAH SELESAI (EFD1100 sebagai Template)

### Files Created:

```
✅ exercises/efd1100_exercises.dart    (35 exercises)
✅ tests/efd1100_tests.dart            (64 test cases, 1357 lines)
✅ validator/efd1100_validator.dart    (192 lines)
✅ Updated view untuk gunakan validated widgets
```

### Shared Resources (Bisa Reuse):

```
✅ lib/shared/widget/row_label/row_label_validated.dart
✅ TestCase<I, O> class
✅ TestResult class
✅ OverallStats class
✅ ExercisePerformance class
```

### Documentation (Bisa Reuse):

```
✅ PANDUAN_ROLLOUT_VALIDASI.md (this file)
✅ README_SISTEM_VALIDASI.md (general guide)
✅ Templates & patterns
```

---

## 🔧 CONTOH PRAKTIS: EFB100 Null Safety

Saya akan implement untuk 1 module lagi sebagai contoh konkret.

**Apakah Anda ingin saya:**

1. ✅ **Implement complete untuk EFB100** (~28 exercises) - Recommended
2. ✅ **Implement complete untuk 2-3 modules** (EFB100 + EFD1300)
3. ⏳ **Buat generator script** untuk automate extraction
4. ⏳ **Dokumentasi saja** dengan detailed templates

**Pilih option yang Anda inginkan, atau saya proceed dengan Option 1 (EFB100 complete)?**

---

## 📋 CHECKLIST PER MODULE

Gunakan checklist ini untuk setiap module:

- [ ] Analisis exercises di view file
- [ ] Buat folder structure (exercises/, tests/, validator/)
- [ ] Extract exercises ke exercises file
- [ ] Buat test cases di tests file (1 test minimum per exercise)
- [ ] Buat validator dengan switch cases
- [ ] Update view untuk gunakan rowLabelValidated()
- [ ] Export di core.dart
- [ ] Test compile (flutter analyze)
- [ ] Manual test (dart test script)
- [ ] Update documentation

**Per Module:** ~2-4 jam kerja

---

## 🎯 KESIMPULAN

**Status Saat Ini:**

- ✅ EFD1100 Variable: **COMPLETE** (35 ex, 64 tests)
- ⏳ 7 Modules Lainnya: **PENDING**

**Recommended Next Action:**
Implement untuk **EFB100 Null Safety** sebagai template kedua, lalu rollout ke module lainnya menggunakan pattern yang sama.

**Apakah Anda ingin saya lanjutkan implement untuk module lainnya?** 🚀
