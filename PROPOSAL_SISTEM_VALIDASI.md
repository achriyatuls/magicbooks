# 🔒 PROPOSAL: SISTEM VALIDASI ANTI-CURANG

## 📋 MASALAH YANG DITEMUKAN

### ❌ Sistem Saat Ini (Cacat Desain):

```dart
bool? exercise2() {
  double? price;
  String text = "100.24";

  // Siswa bisa langsung:
  return true;  // ❌ CURANG! Dapat centang hijau tanpa belajar!
}
```

**Kelemahan:**

- ✗ Siswa bisa edit `return` statement
- ✗ Tidak ada validasi objektif
- ✗ Centang hijau tidak menunjukkan pemahaman sebenarnya
- ✗ Tidak ada pembanding jawaban siswa vs jawaban benar

---

## ✅ SOLUSI: SISTEM UNIT TEST TERPISAH

### Konsep:

**SOAL (Editable oleh Siswa)** ≠ **VALIDASI (Protected/Read-Only)**

### Arsitektur Baru:

```
📁 lib/module/efd1100_variable/
  ├── 📄 view/efd1100_variable_view.dart          (UI)
  ├── 📄 exercises/efd1100_exercises.dart         (JAWABAN SISWA - EDITABLE)
  ├── 📄 tests/efd1100_tests.dart                 (VALIDASI - READ ONLY)
  └── 📄 validator/efd1100_validator.dart         (TEST RUNNER)
```

---

## 🎯 IMPLEMENTASI DETAIL

### 1️⃣ **File Exercises (Untuk Siswa)**

```dart
// lib/module/efd1100_variable/exercises/efd1100_exercises.dart

/// 📝 LEMBAR KERJA SISWA
/// File ini BOLEH diubah untuk menjawab exercise
class Efd1100Exercises {

  /// Exercise 2: Konversi String ke Double
  ///
  /// INSTRUKSI:
  /// - Ubah variable text menjadi double
  /// - Isi variable price dengan hasil konversi
  ///
  /// JANGAN UBAH:
  /// - Nama function
  /// - Parameter function
  /// - Variable yang sudah ada (hanya boleh MENGISI nilainya)
  static double? exercise2Solution(String text) {
    double? price;

    // 👇 TULIS KODE DI SINI:
    // Contoh: price = double.parse(text);


    return price;  // ← JANGAN UBAH BARIS INI!
  }

  /// Exercise 4: Cek Bilangan Ganjil
  static bool? exercise4Solution(int input) {
    bool? output;

    // 👇 TULIS KODE DI SINI:


    return output;  // ← JANGAN UBAH BARIS INI!
  }

  // ... dst untuk exercise lainnya
}
```

### 2️⃣ **File Tests (Protected - Guru Saja)**

```dart
// lib/module/efd1100_variable/tests/efd1100_tests.dart

/// 🔒 SISTEM VALIDASI
/// File ini TIDAK BOLEH diubah oleh siswa!
///
/// PROTEKSI:
/// - Read-only di production
/// - Hidden dari siswa
/// - Atau gunakan checksums untuk deteksi perubahan

class Efd1100Tests {

  /// Test untuk Exercise 2
  static TestResult testExercise2() {
    List<TestCase> testCases = [
      TestCase(input: "100.24", expected: 100.24),
      TestCase(input: "50.5", expected: 50.5),
      TestCase(input: "0.99", expected: 0.99),
      TestCase(input: "1000.0", expected: 1000.0),
    ];

    int passed = 0;
    int total = testCases.length;
    List<String> errors = [];

    for (var testCase in testCases) {
      try {
        double? result = Efd1100Exercises.exercise2Solution(testCase.input);

        if (result == testCase.expected) {
          passed++;
        } else {
          errors.add(
            "Input: '${testCase.input}' → Expected: ${testCase.expected}, Got: $result"
          );
        }
      } catch (e) {
        errors.add("Error dengan input '${testCase.input}': $e");
      }
    }

    return TestResult(
      exerciseName: "Exercise 2",
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
    );
  }

  /// Test untuk Exercise 4
  static TestResult testExercise4() {
    List<TestCase> testCases = [
      TestCase(input: 12, expected: false),  // genap
      TestCase(input: 13, expected: true),   // ganjil
      TestCase(input: 100, expected: false), // genap
      TestCase(input: 99, expected: true),   // ganjil
      TestCase(input: 1, expected: true),    // ganjil
      TestCase(input: 0, expected: false),   // genap
    ];

    int passed = 0;
    int total = testCases.length;
    List<String> errors = [];

    for (var testCase in testCases) {
      try {
        bool? result = Efd1100Exercises.exercise4Solution(testCase.input);

        if (result == testCase.expected) {
          passed++;
        } else {
          errors.add(
            "Input: ${testCase.input} → Expected: ${testCase.expected}, Got: $result"
          );
        }
      } catch (e) {
        errors.add("Error dengan input ${testCase.input}: $e");
      }
    }

    return TestResult(
      exerciseName: "Exercise 4",
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
    );
  }

  // ... dst untuk exercise lainnya
}

/// Model untuk Test Case
class TestCase {
  final dynamic input;
  final dynamic expected;

  TestCase({required this.input, required this.expected});
}

/// Model untuk Test Result
class TestResult {
  final String exerciseName;
  final int passed;
  final int total;
  final bool isPerfect;
  final List<String> errors;

  TestResult({
    required this.exerciseName,
    required this.passed,
    required this.total,
    required this.isPerfect,
    required this.errors,
  });

  double get percentage => (passed / total) * 100;
}
```

### 3️⃣ **Validator (Test Runner)**

```dart
// lib/module/efd1100_variable/validator/efd1100_validator.dart

class Efd1100Validator {

  /// Run test untuk specific exercise
  static TestResult runTest(int exerciseNumber) {
    switch (exerciseNumber) {
      case 2:
        return Efd1100Tests.testExercise2();
      case 4:
        return Efd1100Tests.testExercise4();
      // ... dst
      default:
        throw Exception("Exercise $exerciseNumber tidak ditemukan");
    }
  }

  /// Run semua tests
  static Map<int, TestResult> runAllTests() {
    Map<int, TestResult> results = {};

    // List semua exercise yang ada
    List<int> exercises = [2, 4, 8, 9, 10, 11, 12, /* ... */];

    for (int exerciseNum in exercises) {
      results[exerciseNum] = runTest(exerciseNum);
    }

    return results;
  }

  /// Get overall statistics
  static OverallStats getOverallStats() {
    var allResults = runAllTests();

    int totalExercises = allResults.length;
    int perfectExercises = allResults.values.where((r) => r.isPerfect).length;

    int totalTests = 0;
    int passedTests = 0;

    for (var result in allResults.values) {
      totalTests += result.total;
      passedTests += result.passed;
    }

    return OverallStats(
      totalExercises: totalExercises,
      perfectExercises: perfectExercises,
      totalTests: totalTests,
      passedTests: passedTests,
    );
  }
}

class OverallStats {
  final int totalExercises;
  final int perfectExercises;
  final int totalTests;
  final int passedTests;

  OverallStats({
    required this.totalExercises,
    required this.perfectExercises,
    required this.totalTests,
    required this.passedTests,
  });

  double get exercisePercentage => (perfectExercises / totalExercises) * 100;
  double get testPercentage => (passedTests / totalTests) * 100;
}
```

### 4️⃣ **Update rowLabel (UI)**

```dart
// lib/shared/widget/row_label/row_label.dart

Widget rowLabelWithValidation(int exerciseNumber) {
  TestResult result = Efd1100Validator.runTest(exerciseNumber);

  return InkWell(
    onTap: () {
      // Show detailed test results
      showTestResultDialog(result);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result.exerciseName,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${result.passed}/${result.total} tests passed (${result.percentage.toStringAsFixed(0)}%)",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: result.isPerfect ? Colors.green : Colors.orange,
                  ),
                ),
              ],
            ),
          ),
          if (result.isPerfect)
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 32.0,
            )
          else if (result.passed > 0)
            Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.circle_outlined,
                  color: Colors.orange,
                  size: 32.0,
                ),
                Text(
                  "${result.percentage.toStringAsFixed(0)}%",
                  style: const TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            )
          else
            const Icon(
              Icons.cancel,
              color: Colors.red,
              size: 32.0,
            ),
        ],
      ),
    ),
  );
}

void showTestResultDialog(TestResult result) {
  showDialog(
    context: Get.currentContext,
    builder: (context) => AlertDialog(
      title: Text(result.exerciseName),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "✅ Passed: ${result.passed}/${result.total}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            if (result.errors.isNotEmpty) ...[
              const Text(
                "❌ Errors:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 5),
              ...result.errors.map((error) => Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  "• $error",
                  style: const TextStyle(fontSize: 12),
                ),
              )),
            ] else
              const Text(
                "🎉 Sempurna! Semua test passed!",
                style: TextStyle(color: Colors.green),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("OK"),
        ),
      ],
    ),
  );
}
```

### 5️⃣ **Update View**

```dart
// lib/module/efd1100_variable/view/efd1100_variable_view.dart

Widget build(context, Efd1100VariableController controller) {
  controller.view = this;
  return Scaffold(
    backgroundColor: const Color(0xFFE5D9F2),
    appBar: AppBar(
      title: const Text("FbkDartVariable"),
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white,
      elevation: 0,
      actions: [
        // Tombol untuk lihat overall stats
        IconButton(
          icon: const Icon(Icons.analytics),
          onPressed: () {
            OverallStats stats = Efd1100Validator.getOverallStats();
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
            _buildExerciseCard(rowLabelWithValidation(2)),
            _buildExerciseCard(rowLabelWithValidation(4)),
            _buildExerciseCard(rowLabelWithValidation(8)),
            // ... dst untuk exercise lainnya
            const SizedBox(height: 20),
          ],
        ),
      ),
    ),
  );
}
```

---

## 🎯 KEUNTUNGAN SISTEM BARU

### ✅ Keunggulan:

1. **Anti-Curang**
   - Siswa tidak bisa langsung `return true`
   - Multiple test cases memvalidasi logic, bukan hanya output tunggal
2. **Feedback Lebih Baik**

   - Siswa tahu berapa % test yang passed
   - Error messages menunjukkan case mana yang gagal
   - Bisa debug dengan lebih mudah

3. **Grading Objektif**

   - Centang hijau = 100% test passed
   - Partial credit = 50-99% test passed (icon orange)
   - Gagal = 0-49% test passed (icon merah)

4. **Skalabel**

   - Mudah tambah test cases
   - Mudah tambah exercise baru
   - Test cases bisa di-update tanpa ubah UI

5. **Real-World Practice**
   - Siswa belajar konsep unit testing
   - Mirip workflow developer profesional
   - Memahami pentingnya validasi

---

## 🔒 SISTEM PROTEKSI

### Option 1: File Permissions (Production)

```dart
// Buat file tests read-only di production build
// Hanya bisa diubah oleh guru dengan admin password
```

### Option 2: Checksum Validation

```dart
// Verifikasi integritas file tests dengan checksum
static bool validateTestFile() {
  String fileContent = getTestFileContent();
  String actualHash = sha256Hash(fileContent);
  String expectedHash = "abc123..."; // Stored securely
  return actualHash == expectedHash;
}
```

### Option 3: Remote Tests (Advanced)

```dart
// Tests di-fetch dari server
// Siswa tidak punya akses lokal ke test cases
Future<TestResult> runRemoteTest(int exerciseNumber) async {
  String studentCode = Efd1100Exercises.exercise2Solution.toString();
  return await API.validateCode(exerciseNumber, studentCode);
}
```

---

## 📊 VISUAL COMPARISON

### Sistem Lama:

```
Exercise 2          ➖  (Abu-abu - tapi siswa bisa curang)
Exercise 4          ✅  (Hijau - bisa fake dengan return true)
```

### Sistem Baru:

```
Exercise 2          ✅  4/4 tests (100%)  [Tap untuk detail]
Exercise 4          🟠  4/6 tests (67%)   [Tap untuk detail]
Exercise 8          ❌  0/3 tests (0%)    [Tap untuk detail]
```

Tap pada exercise menampilkan:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━
Exercise 4: Cek Bilangan Ganjil

✅ Passed: 4/6 tests

❌ Errors:
• Input: 1 → Expected: true, Got: null
• Input: 99 → Expected: true, Got: false

💡 Hint: Pastikan Anda mengisi variable
output dengan kondisi yang benar untuk
mengecek bilangan ganjil.
━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## 🚀 IMPLEMENTASI PLAN

### Phase 1: Prototype (1 Module)

- ✅ Implementasi untuk EFD1100 Variable
- ✅ Test dengan 5 exercise terlebih dahulu
- ✅ Gather feedback dari guru & siswa

### Phase 2: Rollout

- Implementasi untuk semua modules
- Training untuk guru
- Update documentation

### Phase 3: Enhancement

- Tambah hints system
- Tambah auto-correction suggestions
- Implementasi remote validation

---

## 💡 KESIMPULAN

Sistem saat ini **tidak memenuhi goal** aplikasi karena:

- ❌ Siswa bisa curang dengan mudah
- ❌ Tidak ada validasi objektif
- ❌ Centang hijau tidak berarti pemahaman

Sistem baru dengan **Unit Test Terpisah**:

- ✅ Anti-curang
- ✅ Validasi objektif dengan multiple test cases
- ✅ Feedback yang lebih baik
- ✅ Mendidik siswa tentang konsep testing
- ✅ Memenuhi goal aplikasi

---

**Rekomendasi:** Implementasi sistem baru untuk menjaga integritas pembelajaran! 🎓
