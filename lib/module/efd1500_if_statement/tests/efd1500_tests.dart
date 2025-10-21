import '../exercises/efd1500_exercises.dart';

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

class Efd1500Tests {
  static TestResult test1() {
    final cases = <TestCase<int, String?>>[
      TestCase(input: 5, expected: "Ganjil"),
      TestCase(input: 4, expected: "Genap"),
    ];
    int passed = 0;
    final errors = <String>[];
    for (final c in cases) {
      final res = Efd1500Exercises.exercise1Solution(c.input);
      if (res == c.expected)
        passed++;
      else
        errors.add(" ${c.input}");
    }
    return TestResult(
        exerciseName: "EFD1500 E1: Genap/Ganjil",
        exerciseNumber: 1,
        passed: passed,
        total: cases.length,
        isPerfect: passed == cases.length,
        errors: errors,
        hints: ["number % 2 == 0 ? 'Genap' : 'Ganjil'"]);
  }

  static TestResult test2() {
    final res = Efd1500Exercises.exercise2Solution(10);
    final ok = (res == "Positif");
    return TestResult(
        exerciseName: "EFD1500 E2: Positif/Negatif/Nol",
        exerciseNumber: 2,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected 'Positif', Got: '$res'"],
        hints: [
          "if (num > 0) 'Positif' else if (num < 0) 'Negatif' else 'Nol'"
        ]);
  }

  static TestResult test3() {
    final res = Efd1500Exercises.exercise3Solution(5, 10);
    final ok = (res == "Lebih kecil");
    return TestResult(
        exerciseName: "EFD1500 E3: Bandingkan Dua Angka",
        exerciseNumber: 3,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected 'Lebih kecil', Got: '$res'"],
        hints: ["if (num1 > num2) ... else if (num1 < num2) ... else ..."]);
  }

  static TestResult test4() {
    final res = Efd1500Exercises.exercise4Solution(80);
    final ok = (res == "Baik");
    return TestResult(
        exerciseName: "EFD1500 E4: Kategori Nilai (Baik)",
        exerciseNumber: 4,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected 'Baik', Got: '$res'"],
        hints: ["score >= 75 → 'Baik'"]);
  }

  static TestResult test5() {
    final res = Efd1500Exercises.exercise5Solution(60);
    final ok = (res == "Sedang");
    return TestResult(
        exerciseName: "EFD1500 E5: Kategori Nilai (Sedang)",
        exerciseNumber: 5,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected 'Sedang', Got: '$res'"],
        hints: ["50..74 → 'Sedang'"]);
  }

  static TestResult test6() {
    final res = Efd1500Exercises.exercise6Solution(40);
    final ok = (res == "Buruk");
    return TestResult(
        exerciseName: "EFD1500 E6: Kategori Nilai (Buruk)",
        exerciseNumber: 6,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected 'Buruk', Got: '$res'"],
        hints: ["score < 50 → 'Buruk'"]);
  }

  static TestResult test7() {
    final res = Efd1500Exercises.exercise7Solution(10);
    final ok = (res == "Bilangan Bulat");
    return TestResult(
        exerciseName: "EFD1500 E7: Bilangan Bulat?",
        exerciseNumber: 7,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected 'Bilangan Bulat', Got: '$res'"],
        hints: ["value is int"]);
  }

  static TestResult test8() {
    final res = Efd1500Exercises.exercise8Solution(10);
    final ok = (res == "Bilangan Positif");
    return TestResult(
        exerciseName: "EFD1500 E8: Negatif/Positif/Nol",
        exerciseNumber: 8,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected 'Bilangan Positif', Got: '$res'"],
        hints: ["if (number < 0) ..., else if (number > 0) ... else ..."]);
  }

  static TestResult test9() {
    final res = Efd1500Exercises.exercise9Solution(10, 5);
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E9: > Perbandingan",
        exerciseNumber: 9,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true"],
        hints: ["number1 > number2"]);
  }

  static TestResult test10() {
    final res = Efd1500Exercises.exercise10Solution(10, 5);
    final ok = (res == false);
    return TestResult(
        exerciseName: "EFD1500 E10: < Perbandingan",
        exerciseNumber: 10,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected false"],
        hints: ["number1 < number2"]);
  }

  static TestResult test11() {
    final sunday = DateTime(2023, 12, 31);
    final res = Efd1500Exercises.exercise11Solution(sunday);
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E11: Is Sunday",
        exerciseNumber: 11,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true for Sunday"],
        hints: ["date.weekday == DateTime.sunday"]);
  }

  static TestResult test12() {
    final birthday = DateTime(1995, 8, 17);
    final today = DateTime(2022, 8, 17);
    final res = Efd1500Exercises.exercise12Solution(birthday, today);
    final ok = (res == 27);
    return TestResult(
        exerciseName: "EFD1500 E12: Hitung Usia",
        exerciseNumber: 12,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected 27"],
        hints: ["today.year - birthday.year (+adjust if belum ulang tahun)"]);
  }

  static TestResult test13() {
    final res = Efd1500Exercises.exercise13Solution(DateTime(2022, 1, 1));
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E13: 1 Jan 2022?",
        exerciseNumber: 13,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true"],
        hints: ["Bandingkan year, month, day"]);
  }

  static TestResult test14() {
    final res = Efd1500Exercises.exercise14Solution(DateTime(2022, 1, 2));
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E14: Sunday?",
        exerciseNumber: 14,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true for Sunday"],
        hints: ["date.weekday == DateTime.sunday"]);
  }

  static TestResult test15() {
    final res = Efd1500Exercises.exercise15Solution(DateTime(2022, 1, 1));
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E15: Saturday?",
        exerciseNumber: 15,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true for Saturday"],
        hints: ["date.weekday == DateTime.saturday"]);
  }

  static TestResult test16() {
    final res = Efd1500Exercises.exercise16Solution(DateTime(2022, 1, 7));
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E16: Friday?",
        exerciseNumber: 16,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true for Friday"],
        hints: ["date.weekday == DateTime.friday"]);
  }

  static TestResult test17() {
    final res = Efd1500Exercises.exercise17Solution(DateTime(2022, 1, 6));
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E17: Thursday?",
        exerciseNumber: 17,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true for Thursday"],
        hints: ["date.weekday == DateTime.thursday"]);
  }

  static TestResult test18() {
    final res = Efd1500Exercises.exercise18Solution(DateTime(2022, 1, 5));
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E18: Wednesday?",
        exerciseNumber: 18,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true for Wednesday"],
        hints: ["date.weekday == DateTime.wednesday"]);
  }

  static TestResult test19() {
    final res = Efd1500Exercises.exercise19Solution(DateTime(2022, 1, 4));
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E19: Tuesday?",
        exerciseNumber: 19,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true for Tuesday"],
        hints: ["date.weekday == DateTime.tuesday"]);
  }

  static TestResult test20() {
    final res = Efd1500Exercises.exercise20Solution(DateTime(2022, 1, 3));
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E20: Monday?",
        exerciseNumber: 20,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true for Monday"],
        hints: ["date.weekday == DateTime.monday"]);
  }

  static TestResult test21() {
    final res = Efd1500Exercises.exercise21Solution([1, 2, 3, 4, 5]);
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E21: Contains 3",
        exerciseNumber: 21,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true"],
        hints: ["numbers.contains(3)"]);
  }

  static TestResult test22() {
    final res = Efd1500Exercises.exercise22Solution([2, 4, 6]);
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E22: All Even",
        exerciseNumber: 22,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : [" Expected true"],
        hints: ["numbers.every((n) => n % 2 == 0)"]);
  }

  static TestResult test23() {
    final res = Efd1500Exercises.exercise23Solution([1, 2, 6]);
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E23: Any > 5",
        exerciseNumber: 23,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true"],
        hints: ["numbers.any((n) => n > 5)"]);
  }

  static TestResult test24() {
    final res = Efd1500Exercises.exercise24Solution([1, -1]);
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E24: Any < 0",
        exerciseNumber: 24,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true"],
        hints: ["numbers.any((n) => n < 0)"]);
  }

  static TestResult test25() {
    final res = Efd1500Exercises.exercise25Solution([1, 2, 3, 4]);
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E25: Odd Count == Even Count",
        exerciseNumber: 25,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true"],
        hints: ["Hitung ganjil dan genap, bandingkan"]);
  }

  static TestResult test26() {
    final res = Efd1500Exercises.exercise26Solution([1, 2, 3, 4, 5]);
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E26: Largest is 5",
        exerciseNumber: 26,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true"],
        hints: ["numbers.reduce(max) == 5"]);
  }

  static TestResult test27() {
    final res = Efd1500Exercises.exercise27Solution([1, 2, 3]);
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E27: Smallest is 1",
        exerciseNumber: 27,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true"],
        hints: ["numbers.reduce(min) == 1"]);
  }

  static TestResult test28() {
    final res = Efd1500Exercises.exercise28Solution([1, 2, 3, 4, 5]);
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E28: Count is 5",
        exerciseNumber: 28,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true"],
        hints: ["numbers.length == 5"]);
  }

  static TestResult test29() {
    final res = Efd1500Exercises.exercise29Solution([1, 2, 2, 3]);
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E29: Has Duplicate",
        exerciseNumber: 29,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true"],
        hints: ["Gunakan Set untuk cek duplikat"]);
  }

  static TestResult test30() {
    final res = Efd1500Exercises.exercise30Solution(5);
    final ok = (res == "Positif");
    return TestResult(
        exerciseName: "EFD1500 E30: Negatif/Positif/Nol",
        exerciseNumber: 30,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : [" Expected 'Positif'"]);
  }

  static TestResult test31() {
    final res = Efd1500Exercises.exercise31Solution(5, 10);
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E31: AND Check",
        exerciseNumber: 31,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true"],
        hints: ["num1 > 0 && num2 > 5"]);
  }

  static TestResult test32() {
    final res = Efd1500Exercises.exercise32Solution(5, 10);
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E32: OR Check",
        exerciseNumber: 32,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true"],
        hints: ["num1 > 0 || num2 > 15"]);
  }

  static TestResult test33() {
    final res = Efd1500Exercises.exercise33Solution(5, 10);
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E33: OR Check 2",
        exerciseNumber: 33,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true"],
        hints: ["num1 > 0 || num2 < 5"]);
  }

  static TestResult test34() {
    final res = Efd1500Exercises.exercise34Solution(5, 10);
    final ok = (res == false);
    return TestResult(
        exerciseName: "EFD1500 E34: AND Check 2",
        exerciseNumber: 34,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected false"],
        hints: [" num1 > 0 && num2 < 5"]);
  }

  static TestResult test35() {
    final res = Efd1500Exercises.exercise35Solution(5, 10);
    final ok = (res == true);
    return TestResult(
        exerciseName: "EFD1500 E35: OR Negative/Greater",
        exerciseNumber: 35,
        passed: ok ? 1 : 0,
        total: 1,
        isPerfect: ok,
        errors: ok ? [] : ["Expected true"],
        hints: ["num1 < 0 || num2 > 5"]);
  }
}
