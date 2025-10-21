// SISTEM VALIDASI - EFD1600 LIST AND MAP
//
// ════════════════════════════════════════════════════════════════════════════
// PERINGATAN: FILE INI TIDAK BOLEH DIUBAH OLEH SISWA!
// ════════════════════════════════════════════════════════════════════════════
//
// File ini berisi test cases untuk memvalidasi jawaban siswa.
// Hanya guru/admin yang boleh mengubah file ini.
//
// ════════════════════════════════════════════════════════════════════════════

import '../exercises/efd1600_exercises.dart';

/// Model untuk satu test case
class TestCase<I, O> {
  final I input;
  final O expected;
  final String? description;

  TestCase({
    required this.input,
    required this.expected,
    this.description,
  });
}

/// Model untuk hasil test
class TestResult {
  final String exerciseName;
  final int exerciseNumber;
  final int passed;
  final int total;
  final bool isPerfect;
  final List<String> errors;
  final List<String> hints;

  TestResult({
    required this.exerciseName,
    required this.exerciseNumber,
    required this.passed,
    required this.total,
    required this.isPerfect,
    required this.errors,
    this.hints = const [],
  });

  double get percentage => total > 0 ? (passed / total) * 100 : 0;

  String get grade {
    if (percentage == 100) return "A+ (Perfect!)";
    if (percentage >= 90) return "A";
    if (percentage >= 80) return "B";
    if (percentage >= 70) return "C";
    if (percentage >= 60) return "D";
    return "F";
  }
}

/// Class yang berisi semua test cases
class Efd1600Tests {
  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 1: Total Penjualan
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise1() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise1();
      if (result) {
        passed++;
      } else {
        errors.add("Total penjualan tidak benar. Expected: 62.5");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("for(var sale in sales) { total += sale; }");
    }

    return TestResult(
      exerciseName: "Exercise 1: Total Penjualan",
      exerciseNumber: 1,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 2: Average Penjualan
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise2() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise2();
      if (result) {
        passed++;
      } else {
        errors.add("Average tidak benar. Expected: 12.5");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("Hitung total terlebih dahulu");
      hints.add("average = total / sales.length;");
    }

    return TestResult(
      exerciseName: "Exercise 2: Average Penjualan",
      exerciseNumber: 2,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 3: Nilai Tertinggi
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise3() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise3();
      if (result) {
        passed++;
      } else {
        errors.add("Nilai tertinggi tidak benar. Expected: 5");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("highest = numbers.reduce((a,b) => a > b ? a : b);");
      hints.add("Atau gunakan loop untuk membandingkan nilai");
    }

    return TestResult(
      exerciseName: "Exercise 3: Nilai Tertinggi",
      exerciseNumber: 3,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 4: Nilai Terendah
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise4() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise4();
      if (result) {
        passed++;
      } else {
        errors.add("Nilai terendah tidak benar. Expected: 1");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("lowest = numbers.reduce((a,b) => a < b ? a : b);");
      hints.add("Atau gunakan loop untuk membandingkan nilai");
    }

    return TestResult(
      exerciseName: "Exercise 4: Nilai Terendah",
      exerciseNumber: 4,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 5: Jumlah Angka Genap
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise5() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise5();
      if (result) {
        passed++;
      } else {
        errors.add("Total angka genap tidak benar. Expected: 30 (2+4+6+8+10)");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("for(var n in numbers) { if(n % 2 == 0) even += n; }");
    }

    return TestResult(
      exerciseName: "Exercise 5: Jumlah Angka Genap",
      exerciseNumber: 5,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 6: Jumlah Angka Ganjil
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise6() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise6();
      if (result) {
        passed++;
      } else {
        errors.add("Total angka ganjil tidak benar. Expected: 25 (1+3+5+7+9)");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("for(var n in numbers) { if(n % 2 != 0) odd += n; }");
    }

    return TestResult(
      exerciseName: "Exercise 6: Jumlah Angka Ganjil",
      exerciseNumber: 6,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 7: Angka Terbesar
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise7() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise7();
      if (result) {
        passed++;
      } else {
        errors.add("Angka terbesar tidak benar. Expected: 10");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add(" largest = numbers.reduce((a,b) => a > b ? a : b);");
    }

    return TestResult(
      exerciseName: "Exercise 7: Angka Terbesar",
      exerciseNumber: 7,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 8: Angka Terkecil
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise8() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise8();
      if (result) {
        passed++;
      } else {
        errors.add("Angka terkecil tidak benar. Expected: 1");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("smallest = numbers.reduce((a,b) => a < b ? a : b);");
    }

    return TestResult(
      exerciseName: "Exercise 8: Angka Terkecil",
      exerciseNumber: 8,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 9: Count Above 5
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise9() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise9();
      if (result) {
        passed++;
      } else {
        errors.add("Jumlah angka > 5 tidak benar. Expected: 5 (6,7,8,9,10)");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("above = numbers.where((n) => n > 5).length;");
    }

    return TestResult(
      exerciseName: "Exercise 9: Count Above 5",
      exerciseNumber: 9,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 10: Count Below 5
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise10() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise10();
      if (result) {
        passed++;
      } else {
        errors.add("Jumlah angka < 5 tidak benar. Expected: 4 (1,2,3,4)");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("below = numbers.where((n) => n < 5).length;");
    }

    return TestResult(
      exerciseName: "Exercise 10: Count Below 5",
      exerciseNumber: 10,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 11: String Starts With
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise11() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise11();
      if (result) {
        passed++;
      } else {
        errors.add("'elderberry' dimulai dengan 'e'");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("result = fruits.any((f) => f.startsWith('e'));");
    }

    return TestResult(
      exerciseName: "Exercise 11: String Starts With",
      exerciseNumber: 11,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 12: Check Multiple of 10
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise12() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise12();
      if (result) {
        passed++;
      } else {
        errors.add("Semua angka adalah kelipatan 10");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("result = numbers.every((n) => n % 10 == 0);");
    }

    return TestResult(
      exerciseName: "Exercise 12: Check Multiple of 10",
      exerciseNumber: 12,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 13: Check String Length
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise13() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise13();
      if (result) {
        passed++;
      } else {
        errors.add("'Dodge' memiliki 5 huruf");
      }
    } catch (e) {
      errors.add(" Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("result = cars.any((c) => c.length == 5);");
    }

    return TestResult(
      exerciseName: "Exercise 13: Check String Length",
      exerciseNumber: 13,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 14: Check Temperature Value
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise14() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise14();
      if (result) {
        passed++;
      } else {
        errors.add("Suhu 40.0 ada dalam list");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("result = temperatures.contains(40.0);");
    }

    return TestResult(
      exerciseName: "Exercise 14: Check Temperature Value",
      exerciseNumber: 14,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 15: Check Animal Name Length
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise15() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise15();
      if (result) {
        passed++;
      } else {
        errors.add("Ada hewan dengan 5 huruf (giraffe)");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("result = animals.any((a) => a.length == 5);");
    }

    return TestResult(
      exerciseName: "Exercise 15: Check Animal Name Length",
      exerciseNumber: 15,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 16: Check First Letter
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise16() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise16();
      if (result) {
        passed++;
      } else {
        errors.add("Semua nama dimulai dengan 'J'");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("result = names.any((n) => n.startsWith('J'));");
    }

    return TestResult(
      exerciseName: "Exercise 16: Check First Letter",
      exerciseNumber: 16,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 17: Check Divisible by 7
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise17() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise17();
      if (result) {
        passed++;
      } else {
        errors.add("Ada angka yang habis dibagi 7 (7, 35, 63)");
      }
    } catch (e) {
      errors.add(" Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("result = numbers.any((n) => n % 7 == 0);");
    }

    return TestResult(
      exerciseName: "Exercise 17: Check Divisible by 7",
      exerciseNumber: 17,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 18: Check Fibonacci
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise18() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise18();
      if (result) {
        passed++;
      } else {
        errors.add("Semua angka dalam list adalah fibonacci");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("result = numbers.isNotEmpty; // Simple check");
      hints.add("Atau: result = true;");
    }

    return TestResult(
      exerciseName: "Exercise 18: Check Fibonacci",
      exerciseNumber: 18,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 19: Check Same Length
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise19() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise19();
      if (result) {
        passed++;
      } else {
        errors.add("'apple' dan 'cherry' sama-sama 6 huruf");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("Gunakan loop untuk membandingkan length");
      hints.add("Atau cek jika ada duplicate dalam list of lengths");
    }

    return TestResult(
      exerciseName: "Exercise 19: Check Same Length",
      exerciseNumber: 19,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 20: Check Prime Number
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise20() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise20();
      if (result) {
        passed++;
      } else {
        errors.add("Ada bilangan prima: 2, 3, 5, 7");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("Bilangan prima: 2, 3, 5, 7");
      hints.add("result = numbers.any((n) => [2,3,5,7].contains(n));");
    }

    return TestResult(
      exerciseName: "Exercise 20: Check Prime Number",
      exerciseNumber: 20,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 21-35: Map Operations
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise21() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise21();
      if (result) {
        passed++;
      } else {
        errors.add("Jerry memiliki gaji 9000");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("result = employeeSalaries.any((e) => e['salary'] >= 9000);");
    }

    return TestResult(
      exerciseName: "Exercise 21: Check Salary >= 9000",
      exerciseNumber: 21,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  static TestResult testExercise22() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise22();
      if (result) {
        passed++;
      } else {
        errors.add("Total gaji: 5000+6000+7000+8000+9000 = 35000");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("for(var e in employeeSalaries) { total += e['salary']; }");
    }

    return TestResult(
      exerciseName: "Exercise 22: Total Salary",
      exerciseNumber: 22,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  static TestResult testExercise23() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise23();
      if (result) {
        passed++;
      } else {
        errors.add("John memiliki gaji terendah (5000)");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("Loop dan bandingkan salary untuk cari yang terkecil");
    }

    return TestResult(
      exerciseName: "Exercise 23: Lowest Salary Name",
      exerciseNumber: 23,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  static TestResult testExercise24() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise24();
      if (result) {
        passed++;
      } else {
        errors.add("Jerry memiliki gaji tertinggi (9000)");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("Loop dan bandingkan salary untuk cari yang terbesar");
    }

    return TestResult(
      exerciseName: "Exercise 24: Highest Salary Name",
      exerciseNumber: 24,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  static TestResult testExercise25() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise25();
      if (result) {
        passed++;
      } else {
        errors.add("💥 Tidak ada gaji yang sama dalam list");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("💡 Gunakan Set untuk cek duplikat");
      hints.add(
          "💡 Set salaries = employeeSalaries.map((e) => e['salary']).toSet();");
    }

    return TestResult(
      exerciseName: "Exercise 25: Check Same Salary",
      exerciseNumber: 25,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 26: Check Salary 6000
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise26() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise26();
      if (result) {
        passed++;
      } else {
        errors.add("Ada karyawan dengan gaji 6000 (Jane dan Jack)");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("result = employeeSalaries.any((e) => e['salary'] == 6000);");
    }

    return TestResult(
      exerciseName: "Exercise 26: Check Salary 6000",
      exerciseNumber: 26,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 27: Total Salary
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise27() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise27();
      if (result) {
        passed++;
      } else {
        errors.add("Total gaji: 5000+6000+4500+6000+5500 = 27000");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add(
          "for(var e in employeeSalaries) { totalSalary += e['salary']; }");
    }

    return TestResult(
      exerciseName: "Exercise 27: Total Salary",
      exerciseNumber: 27,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 28: Highest Salary
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise28() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise28();
      if (result) {
        passed++;
      } else {
        errors.add("Gaji tertinggi adalah 6000");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("Loop dan bandingkan salary untuk cari yang terbesar");
    }

    return TestResult(
      exerciseName: "Exercise 28: Highest Salary",
      exerciseNumber: 28,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 29: Lowest Salary
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise29() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise29();
      if (result) {
        passed++;
      } else {
        errors.add("Gaji terendah adalah 4500");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("Loop dan bandingkan salary untuk cari yang terkecil");
    }

    return TestResult(
      exerciseName: "Exercise 29: Lowest Salary",
      exerciseNumber: 29,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 30: Salary Above 6000
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise30() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise30();
      if (result) {
        passed++;
      } else {
        errors.add("Jim memiliki gaji 7000 (di atas 6000)");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("result = employeeSalaries.any((e) => e['salary'] > 6000);");
    }

    return TestResult(
      exerciseName: "Exercise 30: Salary Above 6000",
      exerciseNumber: 30,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 31: Average Salary
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise31() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise31();
      if (result) {
        passed++;
      } else {
        errors.add("Rata-rata gaji: (5000+6000+7000)/3 = 6000");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add(
          "Hitung total terlebih dahulu, lalu bagi dengan jumlah karyawan");
      hints.add("average = totalSalary / employeeSalaries.length;");
    }

    return TestResult(
      exerciseName: "Exercise 31: Average Salary",
      exerciseNumber: 31,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 32: Highest Paid Employee Name
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise32() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise32();
      if (result) {
        passed++;
      } else {
        errors.add("Jim memiliki gaji tertinggi (7000)");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("Loop dan bandingkan salary untuk cari yang terbesar");
      hints.add("Simpan nama karyawan dengan gaji tertinggi");
    }

    return TestResult(
      exerciseName: "Exercise 32: Highest Paid Employee Name",
      exerciseNumber: 32,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 33: Lowest Paid Employee Name
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise33() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise33();
      if (result) {
        passed++;
      } else {
        errors.add("John memiliki gaji terendah (5000)");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("Loop dan bandingkan salary untuk cari yang terkecil");
      hints.add("Simpan nama karyawan dengan gaji terendah");
    }

    return TestResult(
      exerciseName: "Exercise 33: Lowest Paid Employee Name",
      exerciseNumber: 33,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 34: Add New Employee
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise34() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise34();
      if (result) {
        passed++;
      } else {
        errors.add("Tambahkan karyawan baru dengan nama 'Jack' dan gaji 8000");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("employeeSalaries.add({'name': 'Jack', 'salary': 8000});");
    }

    return TestResult(
      exerciseName: "Exercise 34: Add New Employee",
      exerciseNumber: 34,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 35: Total Salary with Position
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise35() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1600Exercises.exercise35();
      if (result) {
        passed++;
      } else {
        errors.add("Total gaji: 5000+4000+3500+3000+2500 = 18000");
      }
    } catch (e) {
      errors.add("Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add(
          "for(var e in employeeSalaries) { totalSalary += e['salary']; }");
    }

    return TestResult(
      exerciseName: "Exercise 35: Total Salary with Position",
      exerciseNumber: 35,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }
}
