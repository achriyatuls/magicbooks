import '../exercises/efb100_exercises.dart';

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

class Efb100Tests {
  static TestResult _singleCheck({
    required int number,
    required String name,
    required String expected,
    List<String> hints = const [],
  }) {
    final errors = <String>[];
    var passed = 0;

    String? result;
    try {
      switch (number) {
        case 1:
          result = Efb100Exercises.exercise1Solution();
          break;
        case 2:
          result = Efb100Exercises.exercise2Solution();
          break;
        case 3:
          result = Efb100Exercises.exercise3Solution();
          break;
        case 4:
          result = Efb100Exercises.exercise4Solution();
          break;
        case 5:
          result = Efb100Exercises.exercise5Solution();
          break;
        case 6:
          result = Efb100Exercises.exercise6Solution();
          break;
        case 7:
          result = Efb100Exercises.exercise7Solution();
          break;
        case 8:
          result = Efb100Exercises.exercise8Solution();
          break;
        case 9:
          result = Efb100Exercises.exercise9Solution();
          break;
        case 10:
          result = Efb100Exercises.exercise10Solution();
          break;
        case 11:
          result = Efb100Exercises.exercise11Solution();
          break;
        case 12:
          result = Efb100Exercises.exercise12Solution();
          break;
        case 13:
          result = Efb100Exercises.exercise13Solution();
          break;
        case 14:
          result = Efb100Exercises.exercise14Solution();
          break;
        case 15:
          result = Efb100Exercises.exercise15Solution();
          break;
        case 16:
          result = Efb100Exercises.exercise16Solution();
          break;
        case 17:
          result = Efb100Exercises.exercise17Solution();
          break;
        case 18:
          result = Efb100Exercises.exercise18Solution();
          break;
        case 19:
          result = Efb100Exercises.exercise19Solution();
          break;
        case 20:
          result = Efb100Exercises.exercise20Solution();
          break;
        case 21:
          result = Efb100Exercises.exercise21Solution();
          break;
        case 22:
          result = Efb100Exercises.exercise22Solution();
          break;
        case 23:
          result = Efb100Exercises.exercise23Solution();
          break;
        case 24:
          result = Efb100Exercises.exercise24Solution();
          break;
        case 25:
          result = Efb100Exercises.exercise25Solution();
          break;
        case 26:
          result = Efb100Exercises.exercise26Solution();
          break;
        case 27:
          result = Efb100Exercises.exercise27Solution();
          break;
        case 28:
          result = Efb100Exercises.exercise28Solution();
          break;
        default:
          errors.add("⚠️ Exercise $number belum diimplementasi");
      }
    } catch (e) {
      errors.add("💥 Error: $e");
    }

    if (result == expected) {
      passed = 1;
    } else {
      errors.add("❌ Expected: '$expected', Got: '$result'");
    }

    return TestResult(
      exerciseName: name,
      exerciseNumber: number,
      passed: passed,
      total: 1,
      isPerfect: passed == 1,
      errors: errors,
      hints: hints,
    );
  }

  static TestResult test1() => _singleCheck(
        number: 1,
        name: "EFB100 E1",
        expected: "null",
        hints: [
          "💡 name?.toUpperCase() menghasilkan null jika name null",
          "💡 Gunakan literal 'null' (string) sebagai output",
        ],
      );

  static TestResult test2() => _singleCheck(
        number: 2,
        name: "EFB100 E2",
        expected: "1",
      );

  static TestResult test3() => _singleCheck(
        number: 3,
        name: "EFB100 E3",
        expected: "null",
      );

  static TestResult test4() => _singleCheck(
        number: 4,
        name: "EFB100 E4",
        expected: "3",
      );

  static TestResult test5() => _singleCheck(
        number: 5,
        name: "EFB100 E5",
        expected: "null",
      );

  static TestResult test6() => _singleCheck(
        number: 6,
        name: "EFB100 E6",
        expected: "10",
      );

  static TestResult test7() => _singleCheck(
        number: 7,
        name: "EFB100 E7",
        expected: "Hello World!",
      );

  static TestResult test8() => _singleCheck(
        number: 8,
        name: "EFB100 E8",
        expected: "dony",
      );

  static TestResult test9() => _singleCheck(
        number: 9,
        name: "EFB100 E9",
        expected: "4",
      );

  static TestResult test10() => _singleCheck(
        number: 10,
        name: "EFB100 E10",
        expected: "90",
      );

  static TestResult test11() => _singleCheck(
        number: 11,
        name: "EFB100 E11",
        expected: "Hello John Doe!",
      );

  static TestResult test12() => _singleCheck(
        number: 12,
        name: "EFB100 E12",
        expected: "null",
      );

  static TestResult test13() => _singleCheck(
        number: 13,
        name: "EFB100 E13",
        expected: "5",
      );

  static TestResult test14() => _singleCheck(
        number: 14,
        name: "EFB100 E14",
        expected: "TEXT.SUBSTRING(0, 5)",
      );

  static TestResult test15() => _singleCheck(
        number: 15,
        name: "EFB100 E15",
        expected: "10",
      );

  static TestResult test16() => _singleCheck(
        number: 16,
        name: "EFB100 E16",
        expected: "0",
      );

  static TestResult test17() => _singleCheck(
        number: 17,
        name: "EFB100 E17",
        expected: "4",
      );

  static TestResult test18() => _singleCheck(
        number: 18,
        name: "EFB100 E18",
        expected: "false",
      );

  static TestResult test19() => _singleCheck(
        number: 19,
        name: "EFB100 E19",
        expected: "HELLO",
      );

  static TestResult test20() => _singleCheck(
        number: 20,
        name: "EFB100 E20",
        expected: "true",
      );

  static TestResult test21() => _singleCheck(
        number: 21,
        name: "EFB100 E21",
        expected: "9",
      );

  static TestResult test22() => _singleCheck(
        number: 22,
        name: "EFB100 E22",
        expected: "",
      );

  static TestResult test23() => _singleCheck(
        number: 23,
        name: "EFB100 E23",
        expected: "JOHN\nJANE\nNoName\nBOB",
      );

  static TestResult test24() => _singleCheck(
        number: 24,
        name: "EFB100 E24",
        expected: "Math: 90\nScience: null\nEnglish: 95",
      );

  static TestResult test25() => _singleCheck(
        number: 25,
        name: "EFB100 E25",
        expected: "20",
      );

  static TestResult test26() => _singleCheck(
        number: 26,
        name: "EFB100 E26",
        expected: "true",
      );

  static TestResult test27() => _singleCheck(
        number: 27,
        name: "Exercise 002",
        expected: "true",
        hints: [
          "💡 int? x; int y = x ?? 1; maka y = 1",
          "💡 Kembalikan string 'true' jika kondisinya benar",
        ],
      );

  static TestResult test28() => _singleCheck(
        number: 28,
        name: "Exercise 003",
        expected: "true",
        hints: [
          "💡 String? text; int? output = text?.length; → null",
          "💡 Bandingkan dengan null dan kembalikan 'true'",
        ],
      );
}
