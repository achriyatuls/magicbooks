// 🔒 SISTEM VALIDASI - EFD1100 VARIABLE
//
// ════════════════════════════════════════════════════════════════════════════
// ⚠️  PERINGATAN: FILE INI TIDAK BOLEH DIUBAH OLEH SISWA!
// ════════════════════════════════════════════════════════════════════════════
//
// File ini berisi test cases untuk memvalidasi jawaban siswa.
// Hanya guru/admin yang boleh mengubah file ini.
//
// ════════════════════════════════════════════════════════════════════════════

import '../exercises/efd1100_exercises.dart';

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
class Efd1100Tests {
  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 2: Konversi String ke Double
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise2() {
    List<TestCase<String, double>> testCases = [
      TestCase(input: "100.24", expected: 100.24, description: "Normal case"),
      TestCase(input: "50.5", expected: 50.5, description: "One decimal"),
      TestCase(input: "0.99", expected: 0.99, description: "Less than 1"),
      TestCase(input: "1000.0", expected: 1000.0, description: "Large number"),
      TestCase(input: "99.99", expected: 99.99, description: "Two decimals"),
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
              "${testCase.description}: Input '${testCase.input}' → Expected: ${testCase.expected}, Got: $result");
        }
      } catch (e) {
        errors.add("💥 Error dengan input '${testCase.input}': $e");
      }
    }

    List<String> hints = [];
    if (!errors.isEmpty) {
      hints
          .add("💡 Gunakan double.parse(text) untuk konversi String ke double");
      hints.add("💡 Pastikan variable price diisi dengan hasil konversi");
    }

    return TestResult(
      exerciseName: "Exercise 2: String to Double",
      exerciseNumber: 2,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 3: Konversi String ke Double (dengan validasi)
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise3() {
    List<TestCase<String, double>> testCases = [
      TestCase(
          input: "300.24a", expected: 300.24, description: "Letter at end"),
      TestCase(
          input: "abc100.5", expected: 100.5, description: "Letters at start"),
      TestCase(
          input: "50x.99y", expected: 50.99, description: "Letters in middle"),
      TestCase(input: "999", expected: 999.0, description: "No decimals"),
      TestCase(
          input: "invalid", expected: 0.0, description: "Completely invalid"),
    ];

    int passed = 0;
    int total = testCases.length;
    List<String> errors = [];

    for (var testCase in testCases) {
      try {
        double? result = Efd1100Exercises.exercise3Solution(testCase.input);

        if (result == testCase.expected) {
          passed++;
        } else {
          errors.add(
              "${testCase.description}: Input '${testCase.input}' → Expected: ${testCase.expected}, Got: $result");
        }
      } catch (e) {
        errors.add("💥 Error dengan input '${testCase.input}': $e");
      }
    }

    List<String> hints = [];
    if (!errors.isEmpty) {
      hints.add(
          "💡 Gunakan .replaceAll(RegExp(r'[^\\d.]'), '') untuk hilangkan karakter non-numeric");
      hints.add("💡 Gunakan double.tryParse() ?? 0.0 untuk safety");
    }

    return TestResult(
      exerciseName: "Exercise 3: Safe String to Double",
      exerciseNumber: 3,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 4: Cek Bilangan Ganjil
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise4() {
    List<TestCase<int, bool>> testCases = [
      TestCase(input: 12, expected: false, description: "Even number"),
      TestCase(input: 13, expected: true, description: "Odd number"),
      TestCase(input: 100, expected: false, description: "Large even"),
      TestCase(input: 99, expected: true, description: "Large odd"),
      TestCase(input: 1, expected: true, description: "Smallest odd"),
      TestCase(input: 0, expected: false, description: "Zero is even"),
      TestCase(input: -5, expected: true, description: "Negative odd"),
      TestCase(input: -4, expected: false, description: "Negative even"),
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
          String expectedText = testCase.expected ? "GANJIL" : "GENAP";
          String gotText =
              result == true ? "GANJIL" : (result == false ? "GENAP" : "NULL");
          errors.add(
              "❌ ${testCase.description}: Input ${testCase.input} → Expected: $expectedText, Got: $gotText");
        }
      } catch (e) {
        errors.add("💥 Error dengan input ${testCase.input}: $e");
      }
    }

    List<String> hints = [];
    if (!errors.isEmpty) {
      hints.add("💡 Bilangan ganjil: input % 2 != 0");
      hints.add("💡 Bilangan genap: input % 2 == 0");
      hints.add("💡 Pastikan output diisi dengan hasil pengecekan");
    }

    return TestResult(
      exerciseName: "Exercise 4: Check Odd Number",
      exerciseNumber: 4,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 5: Parse dengan Try-Catch Safety
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise5() {
    List<TestCase<String, double>> testCases = [
      TestCase(input: "300aa", expected: 0.0, description: "Invalid input"),
      TestCase(input: "abc", expected: 0.0, description: "Completely invalid"),
      TestCase(input: "100.5", expected: 100.5, description: "Valid input"),
      TestCase(input: "", expected: 0.0, description: "Empty string"),
    ];

    int passed = 0;
    int total = testCases.length;
    List<String> errors = [];

    for (var testCase in testCases) {
      try {
        double? result = Efd1100Exercises.exercise5Solution(testCase.input);

        if (result == testCase.expected) {
          passed++;
        } else {
          errors.add(
              "❌ ${testCase.description}: Input '${testCase.input}' → Expected: ${testCase.expected}, Got: $result");
        }
      } catch (e) {
        errors.add("💥 Error dengan input '${testCase.input}': $e");
      }
    }

    List<String> hints = [];
    if (!errors.isEmpty) {
      hints.add("💡 Gunakan double.tryParse(text) ?? 0.0");
      hints.add(
          "💡 tryParse() return null jika gagal, gunakan ?? untuk default value");
    }

    return TestResult(
      exerciseName: "Exercise 5: Safe Parse",
      exerciseNumber: 5,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 8: Extract Text Between Quotes
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise8() {
    List<TestCase<String, String>> testCases = [
      TestCase(
          input: "hello 'Deny', apa kabar?",
          expected: "Deny",
          description: "Normal case"),
      TestCase(
          input: "name is 'John'", expected: "John", description: "At end"),
      TestCase(
          input: "'Alice' said hello",
          expected: "Alice",
          description: "At start"),
      TestCase(
          input: "the word 'test' appears",
          expected: "test",
          description: "Single word"),
    ];

    int passed = 0;
    int total = testCases.length;
    List<String> errors = [];

    for (var testCase in testCases) {
      try {
        String? result = Efd1100Exercises.exercise8Solution(testCase.input);

        if (result == testCase.expected) {
          passed++;
        } else {
          errors.add(
              "❌ ${testCase.description}: Input '${testCase.input}' → Expected: '${testCase.expected}', Got: '$result'");
        }
      } catch (e) {
        errors.add("💥 Error dengan input '${testCase.input}': $e");
      }
    }

    List<String> hints = [];
    if (!errors.isEmpty) {
      hints.add("💡 int startIndex = text.indexOf(\"'\") + 1;");
      hints.add("💡 int endIndex = text.lastIndexOf(\"'\");");
      hints.add("💡 name = text.substring(startIndex, endIndex);");
    }

    return TestResult(
      exerciseName: "Exercise 8: Extract Quoted Text",
      exerciseNumber: 8,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 11: Penjumlahan
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise11() {
    List<TestCase<int, int>> testCases = [
      TestCase(input: 10, expected: 15, description: "10 + 5"),
      TestCase(input: 0, expected: 5, description: "0 + 5"),
      TestCase(input: 100, expected: 105, description: "100 + 5"),
      TestCase(input: -5, expected: 0, description: "-5 + 5"),
    ];

    int passed = 0;
    int total = testCases.length;
    List<String> errors = [];

    for (var testCase in testCases) {
      try {
        int? result = Efd1100Exercises.exercise11Solution(testCase.input);

        if (result == testCase.expected) {
          passed++;
        } else {
          errors.add(
              "❌ ${testCase.description}: Expected: ${testCase.expected}, Got: $result");
        }
      } catch (e) {
        errors.add("💥 Error dengan input ${testCase.input}: $e");
      }
    }

    List<String> hints = [];
    if (!errors.isEmpty) {
      hints.add("💡 output = input + 5;");
    }

    return TestResult(
      exerciseName: "Exercise 11: Addition",
      exerciseNumber: 11,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 18: String Concatenation
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise18() {
    List<TestCase<String, String>> testCases = [
      TestCase(
          input: "Hello", expected: "Hello World!", description: "Normal case"),
      TestCase(input: "Hi", expected: "Hi World!", description: "Short input"),
      TestCase(input: "", expected: " World!", description: "Empty input"),
    ];

    int passed = 0;
    int total = testCases.length;
    List<String> errors = [];

    for (var testCase in testCases) {
      try {
        String? result = Efd1100Exercises.exercise18Solution(testCase.input);

        if (result == testCase.expected) {
          passed++;
        } else {
          errors.add(
              "❌ ${testCase.description}: Input '${testCase.input}' → Expected: '${testCase.expected}', Got: '$result'");
        }
      } catch (e) {
        errors.add("💥 Error dengan input '${testCase.input}': $e");
      }
    }

    List<String> hints = [];
    if (!errors.isEmpty) {
      hints.add("💡 output = input + \" World!\";");
    }

    return TestResult(
      exerciseName: "Exercise 18: String Concatenation",
      exerciseNumber: 18,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 35: Check if String Contains Word
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise35() {
    List<TestCase<String, bool>> testCases = [
      TestCase(
          input:
              "Dart is a client-optimized programming language for fast apps on multiple platforms.",
          expected: true,
          description: "Contains 'Dart'"),
      TestCase(
          input: "Flutter is awesome",
          expected: false,
          description: "Does not contain 'Dart'"),
      TestCase(
          input: "I love Dart programming",
          expected: true,
          description: "Contains 'Dart' in middle"),
      TestCase(
          input: "dart is lowercase",
          expected: false,
          description: "Case sensitive - lowercase 'dart'"),
    ];

    int passed = 0;
    int total = testCases.length;
    List<String> errors = [];

    for (var testCase in testCases) {
      try {
        bool? result = Efd1100Exercises.exercise35Solution(testCase.input);

        if (result == testCase.expected) {
          passed++;
        } else {
          errors.add(
              "❌ ${testCase.description}: Expected: ${testCase.expected}, Got: $result");
        }
      } catch (e) {
        errors.add("💥 Error: $e");
      }
    }

    List<String> hints = [];
    if (!errors.isEmpty) {
      hints.add("💡 output = input.contains(\"Dart\");");
      hints.add("💡 contains() is case-sensitive");
    }

    return TestResult(
      exerciseName: "Exercise 35: String Contains",
      exerciseNumber: 35,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 1: Type Check
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise1() {
    // Exercise 1 menggunakan format lama, test simple saja
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool? result = Efd1100Exercises.exercise1();
      if (result == true) {
        passed++;
      } else {
        errors.add("❌ Variable price harus bertipe String, bukan int");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("💡 Ubah int menjadi String dengan menambahkan quotes");
      hints.add("💡 Contoh: String price = \"100\";");
    }

    return TestResult(
      exerciseName: "Exercise 1: Type Check",
      exerciseNumber: 1,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 6: Safe Int Parse
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise6() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool? result = Efd1100Exercises.exercise6();
      if (result == true) {
        passed++;
      } else {
        errors.add("❌ Variable age harus diisi dengan tryParse");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add(
          "💡 Uncomment kode dan perbaiki dengan int.tryParse(\"39ads\") ?? 0");
      hints.add(
          "💡 tryParse return null jika gagal, gunakan ?? 0 untuk default");
    }

    return TestResult(
      exerciseName: "Exercise 6: Safe Int Parse",
      exerciseNumber: 6,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 7: Type Conversion Int
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise7() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool? result = Efd1100Exercises.exercise7();
      if (result == true) {
        passed++;
      } else {
        errors.add("❌ Variable price harus diisi dari value (String ke int)");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("💡 Gunakan int.parse(value) untuk konversi String ke int");
      hints.add("💡 price = int.parse(value);");
    }

    return TestResult(
      exerciseName: "Exercise 7: Type Conversion Int",
      exerciseNumber: 7,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 9: Calculate Average
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise9() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool? result = Efd1100Exercises.exercise9();
      if (result == true) {
        passed++;
      } else {
        errors.add("❌ Average tidak benar. Expected: 57.43");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add(
          "💡 Gunakan for loop: for(var num in numbers) { total += num; }");
      hints.add("💡 average = total / numbers.length;");
      hints.add("💡 List: [70, 23, 44, 33, 100, 23, 109] → avg: 57.43");
    }

    return TestResult(
      exerciseName: "Exercise 9: Calculate Average",
      exerciseNumber: 9,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 10: Find Min and Max
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise10() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool? result = Efd1100Exercises.exercise10();
      if (result == true) {
        passed++;
      } else {
        errors.add("❌ Min/Max tidak benar. Expected min:23, max:109");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("💡 numbers.sort(); // Sort list terlebih dahulu");
      hints.add("💡 minValue = numbers.first; // Nilai terkecil");
      hints.add("💡 maxValue = numbers.last; // Nilai terbesar");
    }

    return TestResult(
      exerciseName: "Exercise 10: Find Min and Max",
      exerciseNumber: 10,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 12: Subtraction
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise12() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise12();
      if (result == true) {
        passed++;
      } else {
        errors.add("❌ Hasil tidak benar. 10 - 5 = 5");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    List<String> hints = [];
    if (errors.isNotEmpty) {
      hints.add("💡 output = input - 5;");
    }

    return TestResult(
      exerciseName: "Exercise 12: Subtraction",
      exerciseNumber: 12,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: hints,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 13-17: Arithmetic Operations (Batch)
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise13() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise13();
      if (result) {
        passed++;
      } else {
        errors.add("❌ 10 + 20 = 30");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 13: Addition Two Numbers",
      exerciseNumber: 13,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty ? [] : ["💡 output = input1 + input2;"],
    );
  }

  static TestResult testExercise14() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise14();
      if (result) {
        passed++;
      } else {
        errors.add("❌ 20 - 10 = 10");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 14: Subtraction Two Numbers",
      exerciseNumber: 14,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty ? [] : ["💡 output = input2 - input1;"],
    );
  }

  static TestResult testExercise15() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise15();
      if (result) {
        passed++;
      } else {
        errors.add("❌ 20 / 10 = 2.0");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 15: Division",
      exerciseNumber: 15,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty ? [] : ["💡 output = input2 / input1;"],
    );
  }

  static TestResult testExercise16() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise16();
      if (result) {
        passed++;
      } else {
        errors.add("❌ 10 * 20 = 200");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 16: Multiplication",
      exerciseNumber: 16,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty ? [] : ["💡 output = input1 * input2;"],
    );
  }

  static TestResult testExercise17() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise17();
      if (result) {
        passed++;
      } else {
        errors.add("❌ 20 % 10 = 0");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 17: Modulo",
      exerciseNumber: 17,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty ? [] : ["💡 output = input2 % input1;"],
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 19-20: String Operations
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise19() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise19();
      if (result) {
        passed++;
      } else {
        errors.add("❌ Kata pertama dari 'Hello World!' adalah 'Hello'");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 19: Get First Word",
      exerciseNumber: 19,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty
          ? []
          : [
              "💡 output = input.split(' ').first;",
              "💡 Atau: output = input.split(' ')[0];"
            ],
    );
  }

  static TestResult testExercise20() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise20();
      if (result) {
        passed++;
      } else {
        errors.add("❌ Kata kedua dari 'Hello World!' adalah 'World!'");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 20: Get Second Word",
      exerciseNumber: 20,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty
          ? []
          : [
              "💡 output = input.split(' ').last;",
              "💡 Atau: output = input.split(' ')[1];"
            ],
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 21-22: Number Check
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise21() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise21();
      if (result) {
        passed++;
      } else {
        errors.add("❌ 12345 adalah ganjil (odd), bukan genap (even)");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 21: Check Even Number",
      exerciseNumber: 21,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty
          ? []
          : ["💡 output = input % 2 == 0; // true jika genap"],
    );
  }

  static TestResult testExercise22() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise22();
      if (result) {
        passed++;
      } else {
        errors.add("❌ 12345 adalah ganjil (odd)");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 22: Check Odd Number",
      exerciseNumber: 22,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty
          ? []
          : ["💡 output = input % 2 != 0; // true jika ganjil"],
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 23-26: String Validation
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise23() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise23();
      if (result) {
        passed++;
      } else {
        errors.add("❌ 'Dart' memiliki 4 karakter (> 3)");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 23: String Length Greater Than 3",
      exerciseNumber: 23,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty ? [] : ["💡 output = input.length > 3;"],
    );
  }

  static TestResult testExercise24() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise24();
      if (result) {
        passed++;
      } else {
        errors.add("❌ 'Dart' memiliki 4 karakter, bukan 3");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 24: String Length Equal 3",
      exerciseNumber: 24,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty ? [] : ["💡 output = input.length == 3;"],
    );
  }

  static TestResult testExercise25() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise25();
      if (result) {
        passed++;
      } else {
        errors.add("❌ 'Dart' dimulai dengan 'D'");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 25: String Starts With",
      exerciseNumber: 25,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty
          ? []
          : [
              "💡 output = input[0] == 'D';",
              "💡 Atau: output = input.startsWith('D');"
            ],
    );
  }

  static TestResult testExercise26() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise26();
      if (result) {
        passed++;
      } else {
        errors.add("❌ 'Dart' diakhiri dengan 't'");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 26: String Ends With",
      exerciseNumber: 26,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty
          ? []
          : [
              "💡 output = input[input.length - 1] == 't';",
              "💡 Atau: output = input.endsWith('t');"
            ],
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 27-30: Number Validation
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise27() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise27();
      if (result) {
        passed++;
      } else {
        errors.add("❌ 12345 memiliki 5 digit");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 27: Check 5 Digits",
      exerciseNumber: 27,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints:
          errors.isEmpty ? [] : ["💡 output = input.toString().length == 5;"],
    );
  }

  static TestResult testExercise28() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise28();
      if (result) {
        passed++;
      } else {
        errors.add("❌ 12345 memiliki 5 digit, bukan 4");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 28: Check 4 Digits",
      exerciseNumber: 28,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints:
          errors.isEmpty ? [] : ["💡 output = input.toString().length == 4;"],
    );
  }

  static TestResult testExercise29() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise29();
      if (result) {
        passed++;
      } else {
        errors.add("❌ 123.45 memiliki 2 digit desimal");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 29: Check 2 Decimals",
      exerciseNumber: 29,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty
          ? []
          : [
              "💡 String str = input.toString();",
              "💡 output = str.split('.')[1].length == 2;"
            ],
    );
  }

  static TestResult testExercise30() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise30();
      if (result) {
        passed++;
      } else {
        errors.add("❌ 123.45 memiliki 2 digit desimal, bukan 3");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 30: Check 3 Decimals",
      exerciseNumber: 30,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty
          ? []
          : [
              "💡 String str = input.toString();",
              "💡 output = str.split('.')[1].length == 3;"
            ],
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // TEST EXERCISE 31-34: Advanced String Operations
  // ═══════════════════════════════════════════════════════════════════════════

  static TestResult testExercise31() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise31();
      if (result) {
        passed++;
      } else {
        errors.add("❌ 'Hello World' bukan palindrome");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 31: Check Palindrome",
      exerciseNumber: 31,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty
          ? []
          : [
              "💡 String reversed = input.split('').reversed.join('');",
              "💡 output = input == reversed;"
            ],
    );
  }

  static TestResult testExercise32() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise32();
      if (result) {
        passed++;
      } else {
        errors.add("❌ 'Dart is Awesome' → 'dart_is_awesome'");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 32: Convert to Snake Case",
      exerciseNumber: 32,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty
          ? []
          : [
              "💡 output = input.toLowerCase().replaceAll(' ', '_');",
            ],
    );
  }

  static TestResult testExercise33() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise33();
      if (result) {
        passed++;
      } else {
        errors.add("❌ '1234' adalah angka");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 33: Check if String is Number",
      exerciseNumber: 33,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty
          ? []
          : [
              "💡 output = int.tryParse(input) != null;",
              "💡 Atau: output = double.tryParse(input) != null;"
            ],
    );
  }

  static TestResult testExercise34() {
    int passed = 0;
    int total = 1;
    List<String> errors = [];

    try {
      bool result = Efd1100Exercises.exercise34();
      if (result) {
        passed++;
      } else {
        errors.add("❌ String harus dibatasi menjadi 50 karakter");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    return TestResult(
      exerciseName: "Exercise 34: Limit String Length",
      exerciseNumber: 34,
      passed: passed,
      total: total,
      isPerfect: passed == total,
      errors: errors,
      hints: errors.isEmpty
          ? []
          : [
              "💡 output = input.substring(0, 50);",
              "💡 Perhatikan: substring(0, 50) ambil 50 karakter, bukan 30"
            ],
    );
  }
}
