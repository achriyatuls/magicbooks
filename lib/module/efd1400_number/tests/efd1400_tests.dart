import '../exercises/efd1400_exercises.dart';

class TestCase<I, O> {
  final I input;
  final O expected;
  final String? description;
  TestCase({required this.input, required this.expected, this.description});
}

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

class Efd1400Tests {
  static TestResult test1() {
    final cases = <TestCase<String, int?>>[
      TestCase(input: "23a", expected: 0, description: "Invalid string -> 0"),
      TestCase(
          input: "123", expected: 123, description: "Valid string -> parsed"),
    ];
    int passed = 0;
    final errors = <String>[];
    for (final c in cases) {
      final res = Efd1400Exercises.exercise1Solution(c.input);
      if (res == c.expected)
        passed++;
      else
        errors.add("❌ ${c.description}: '${c.input}'");
    }
    return TestResult(
      exerciseName: "EFD1400 E1",
      exerciseNumber: 1,
      passed: passed,
      total: cases.length,
      isPerfect: passed == cases.length,
      errors: errors,
      hints: ["💡 int.tryParse(input) ?? 0"],
    );
  }

  static TestResult test2() {
    final cases = <TestCase<String, int?>>[
      TestCase(input: "23a", expected: 23, description: "Remove non-numeric"),
      TestCase(
          input: "abc123def",
          expected: 123,
          description: "Extract numbers only"),
    ];
    int passed = 0;
    final errors = <String>[];
    for (final c in cases) {
      final res = Efd1400Exercises.exercise2Solution(c.input);
      if (res == c.expected)
        passed++;
      else
        errors.add("❌ ${c.description}: '${c.input}'");
    }
    return TestResult(
      exerciseName: "EFD1400 E2",
      exerciseNumber: 2,
      passed: passed,
      total: cases.length,
      isPerfect: passed == cases.length,
      errors: errors,
      hints: ["💡 input.replaceAll(RegExp(r'[^0-9]+'), '') lalu int.parse"],
    );
  }

  static TestResult test3() {
    final res = Efd1400Exercises.exercise3Solution(29.23);
    final ok = (res == 29.23);
    return TestResult(
      exerciseName: "EFD1400 E3",
      exerciseNumber: 3,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 29.23, Got: $res"],
      hints: ["💡 Input sudah double, langsung assign"],
    );
  }

  static TestResult test4() {
    final res = Efd1400Exercises.exercise4Solution("29.23a");
    final ok = (res == 0);
    return TestResult(
      exerciseName: "EFD1400 E4",
      exerciseNumber: 4,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 0, Got: $res"],
      hints: ["💡 double.tryParse(input) ?? 0"],
    );
  }

  static TestResult test5() {
    final res = Efd1400Exercises.exercise5Solution();
    final ok = (res == 200.0);
    return TestResult(
      exerciseName: "EFD1400 E5",
      exerciseNumber: 5,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 200.0, Got: $res"],
      hints: ["💡 total = qty * price"],
    );
  }

  static TestResult test6() {
    final res = Efd1400Exercises.exercise6Solution();
    final ok = (res == 11.5);
    return TestResult(
      exerciseName: "EFD1400 E6",
      exerciseNumber: 6,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 11.5, Got: $res"],
      hints: ["💡 total = 23 / 2 (division gives double)"],
    );
  }

  static TestResult test7() {
    final res = Efd1400Exercises.exercise7Solution(2500.2521);
    final ok = (res == "2500.25");
    return TestResult(
      exerciseName: "EFD1400 E7",
      exerciseNumber: 7,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected '2500.25', Got: '$res'"],
      hints: ["💡 price.toStringAsFixed(2)"],
    );
  }

  static TestResult test8() {
    final res = Efd1400Exercises.exercise8Solution(1001);
    final ok = (res == "00001001");
    return TestResult(
      exerciseName: "EFD1400 E8",
      exerciseNumber: 8,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected '00001001', Got: '$res'"],
      hints: ["💡 id.toString().padLeft(8, '0')"],
    );
  }

  static TestResult test9() {
    final res = Efd1400Exercises.exercise9Solution(25000);
    final ok = (res == "Rp25.000");
    return TestResult(
      exerciseName: "EFD1400 E9",
      exerciseNumber: 9,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 'Rp25.000', Got: '$res'"],
      hints: ["💡 Regex untuk titik ribuan + 'Rp' prefix"],
    );
  }

  static TestResult test10() {
    final res = Efd1400Exercises.exercise10Solution(2250);
    final ok = (res == "\$2.250");
    return TestResult(
      exerciseName: "EFD1400 E10",
      exerciseNumber: 10,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected '\$2.250', Got: '$res'"],
      hints: ["💡 Regex untuk titik ribuan + '\$' prefix"],
    );
  }

  static TestResult test11() {
    final res = Efd1400Exercises.exercise11Solution(23.89);
    final ok = (res == 24);
    return TestResult(
      exerciseName: "EFD1400 E11",
      exerciseNumber: 11,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 24, Got: $res"],
      hints: ["💡 number.ceil()"],
    );
  }

  static TestResult test12() {
    final res = Efd1400Exercises.exercise12Solution(23.39);
    final ok = (res == 23);
    return TestResult(
      exerciseName: "EFD1400 E12",
      exerciseNumber: 12,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 23, Got: $res"],
      hints: ["💡 number.floor()"],
    );
  }

  static TestResult test13() {
    final res = Efd1400Exercises.exercise13Solution(12345);
    final ok = (res == false);
    return TestResult(
      exerciseName: "EFD1400 E13",
      exerciseNumber: 13,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected false"],
      hints: ["💡 input % 2 == 0"],
    );
  }

  static TestResult test14() {
    final res = Efd1400Exercises.exercise14Solution(12345.6789);
    final ok = (res == 12345.68);
    return TestResult(
      exerciseName: "EFD1400 E14",
      exerciseNumber: 14,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 12345.68, Got: $res"],
      hints: ["💡 double.parse(input.toStringAsFixed(2))"],
    );
  }

  static TestResult test15() {
    final res = Efd1400Exercises.exercise15Solution(123456);
    final ok = (res == true);
    return TestResult(
      exerciseName: "EFD1400 E15",
      exerciseNumber: 15,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected true"],
      hints: ["💡 input % 3 == 0"],
    );
  }

  static TestResult test16() {
    final res = Efd1400Exercises.exercise16Solution(123456);
    final ok = (res == true);
    return TestResult(
      exerciseName: "EFD1400 E16",
      exerciseNumber: 16,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected true"],
      hints: ["💡 input % 6 == 0"],
    );
  }

  static TestResult test17() {
    final res = Efd1400Exercises.exercise17Solution(10, 20);
    final ok = (res != null && res["c"] == 20 && res["d"] == 10);
    return TestResult(
      exerciseName: "EFD1400 E17",
      exerciseNumber: 17,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected c=20, d=10"],
      hints: ["💡 Tukar nilai dengan variabel sementara"],
    );
  }

  static TestResult test18() {
    final res = Efd1400Exercises.exercise18Solution(12345);
    final ok = (res == false);
    return TestResult(
      exerciseName: "EFD1400 E18",
      exerciseNumber: 18,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected false"],
      hints: ["💡 Cek apakah input habis dibagi angka 2 sampai sqrt(input)"],
    );
  }

  static TestResult test19() {
    final res = Efd1400Exercises.exercise19Solution(12345.6789);
    final ok = (res == 12345.7);
    return TestResult(
      exerciseName: "EFD1400 E19",
      exerciseNumber: 19,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 12345.7, Got: $res"],
      hints: ["💡 double.parse(input.toStringAsFixed(1))"],
    );
  }

  static TestResult test20() {
    final res = Efd1400Exercises.exercise20Solution(123456);
    final ok = (res == true);
    return TestResult(
      exerciseName: "EFD1400 E20",
      exerciseNumber: 20,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected true"],
      hints: ["💡 input % 9 == 0"],
    );
  }

  static TestResult test21() {
    final res = Efd1400Exercises.exercise21Solution("12345");
    final ok = (res == 12345);
    return TestResult(
      exerciseName: "EFD1400 E21",
      exerciseNumber: 21,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 12345, Got: $res"],
      hints: ["💡 int.parse(input)"],
    );
  }

  static TestResult test22() {
    final res = Efd1400Exercises.exercise22Solution("12.345");
    final ok = (res == 12.345);
    return TestResult(
      exerciseName: "EFD1400 E22",
      exerciseNumber: 22,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 12.345, Got: $res"],
      hints: ["💡 double.parse(input)"],
    );
  }

  static TestResult test23() {
    final res = Efd1400Exercises.exercise23Solution(12345);
    final ok = (res == "12345");
    return TestResult(
      exerciseName: "EFD1400 E23",
      exerciseNumber: 23,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected '12345', Got: '$res'"],
      hints: ["💡 input.toString()"],
    );
  }

  static TestResult test24() {
    final res = Efd1400Exercises.exercise24Solution(12345.678);
    final ok = (res == "12345.678");
    return TestResult(
      exerciseName: "EFD1400 E24",
      exerciseNumber: 24,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected '12345.678', Got: '$res'"],
      hints: ["💡 input.toString()"],
    );
  }

  static TestResult test25() {
    final res = Efd1400Exercises.exercise25Solution("12345");
    final ok = (res == true);
    return TestResult(
      exerciseName: "EFD1400 E25",
      exerciseNumber: 25,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected true"],
      hints: ["💡 int.tryParse(input) != null"],
    );
  }

  static TestResult test26() {
    final res = Efd1400Exercises.exercise26Solution("12345.678");
    final ok = (res == true);
    return TestResult(
      exerciseName: "EFD1400 E26",
      exerciseNumber: 26,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected true"],
      hints: ["💡 double.tryParse(input) != null"],
    );
  }

  static TestResult test27() {
    final res = Efd1400Exercises.exercise27Solution("abcde");
    final ok = (res == false);
    return TestResult(
      exerciseName: "EFD1400 E27",
      exerciseNumber: 27,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected false"],
      hints: ["💡 int.tryParse(input) == null"],
    );
  }

  static TestResult test28() {
    final res = Efd1400Exercises.exercise28Solution("abcde");
    final ok = (res == false);
    return TestResult(
      exerciseName: "EFD1400 E28",
      exerciseNumber: 28,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected false"],
      hints: ["💡 double.tryParse(input) == null"],
    );
  }

  static TestResult test29() {
    final res = Efd1400Exercises.exercise29Solution(12345);
    final ok = (res == false);
    return TestResult(
      exerciseName: "EFD1400 E29",
      exerciseNumber: 29,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected false"],
      hints: ["💡 input < 0"],
    );
  }

  static TestResult test30() {
    final res = Efd1400Exercises.exercise30Solution(-12345);
    final ok = (res == true);
    return TestResult(
      exerciseName: "EFD1400 E30",
      exerciseNumber: 30,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected true"],
      hints: ["💡 input < 0"],
    );
  }

  static TestResult test31() {
    final res = Efd1400Exercises.exercise31Solution(12345);
    final ok = (res == true);
    return TestResult(
      exerciseName: "EFD1400 E31",
      exerciseNumber: 31,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected true"],
      hints: ["💡 input > 0"],
    );
  }

  static TestResult test32() {
    final res = Efd1400Exercises.exercise32Solution(-12345);
    final ok = (res == false);
    return TestResult(
      exerciseName: "EFD1400 E32",
      exerciseNumber: 32,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected false"],
      hints: ["💡 input > 0"],
    );
  }

  static TestResult test33() {
    final res = Efd1400Exercises.exercise33Solution("1,000.50");
    final ok = (res == 1000.5);
    return TestResult(
      exerciseName: "EFD1400 E33",
      exerciseNumber: 33,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 1000.5, Got: $res"],
      hints: ["💡 Hapus koma, lalu double.parse"],
    );
  }

  static TestResult test34() {
    final res = Efd1400Exercises.exercise34Solution("100,000");
    final ok = (res == 100000);
    return TestResult(
      exerciseName: "EFD1400 E34",
      exerciseNumber: 34,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 100000, Got: $res"],
      hints: ["💡 Hapus koma, lalu int.parse"],
    );
  }

  static TestResult test35() {
    final res = Efd1400Exercises.exercise35Solution("100.5");
    final ok = (res == true);
    return TestResult(
      exerciseName: "EFD1400 E35",
      exerciseNumber: 35,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected true"],
      hints: ["💡 double.tryParse(input) != null"],
    );
  }
}
