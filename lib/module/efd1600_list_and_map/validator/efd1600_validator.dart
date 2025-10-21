import '../tests/efd1600_tests.dart';

class Efd1600Validator {
  static TestResult runTest(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        return Efd1600Tests.testExercise1();
      case 2:
        return Efd1600Tests.testExercise2();
      case 3:
        return Efd1600Tests.testExercise3();
      case 4:
        return Efd1600Tests.testExercise4();
      case 5:
        return Efd1600Tests.testExercise5();
      case 6:
        return Efd1600Tests.testExercise6();
      case 7:
        return Efd1600Tests.testExercise7();
      case 8:
        return Efd1600Tests.testExercise8();
      case 9:
        return Efd1600Tests.testExercise9();
      case 10:
        return Efd1600Tests.testExercise10();
      case 11:
        return Efd1600Tests.testExercise11();
      case 12:
        return Efd1600Tests.testExercise12();
      case 13:
        return Efd1600Tests.testExercise13();
      case 14:
        return Efd1600Tests.testExercise14();
      case 15:
        return Efd1600Tests.testExercise15();
      case 16:
        return Efd1600Tests.testExercise16();
      case 17:
        return Efd1600Tests.testExercise17();
      case 18:
        return Efd1600Tests.testExercise18();
      case 19:
        return Efd1600Tests.testExercise19();
      case 20:
        return Efd1600Tests.testExercise20();
      case 21:
        return Efd1600Tests.testExercise21();
      case 22:
        return Efd1600Tests.testExercise22();
      case 23:
        return Efd1600Tests.testExercise23();
      case 24:
        return Efd1600Tests.testExercise24();
      case 25:
        return Efd1600Tests.testExercise25();
      case 26:
        return Efd1600Tests.testExercise26();
      case 27:
        return Efd1600Tests.testExercise27();
      case 28:
        return Efd1600Tests.testExercise28();
      case 29:
        return Efd1600Tests.testExercise29();
      case 30:
        return Efd1600Tests.testExercise30();
      case 31:
        return Efd1600Tests.testExercise31();
      case 32:
        return Efd1600Tests.testExercise32();
      case 33:
        return Efd1600Tests.testExercise33();
      case 34:
        return Efd1600Tests.testExercise34();
      case 35:
        return Efd1600Tests.testExercise35();
      default:
        return TestResult(
          exerciseName: "Exercise $exerciseNumber",
          exerciseNumber: exerciseNumber,
          passed: 0,
          total: 1,
          isPerfect: false,
          errors: ["Test untuk exercise ini belum diimplementasi"],
          hints: ["Silakan hubungi guru untuk menambahkan test cases"],
        );
    }
  }

  static Map<int, TestResult> runAllTests() {
    final results = <int, TestResult>{};
    for (int i = 1; i <= 35; i++) {
      results[i] = runTest(i);
    }
    return results;
  }

  static Efd1600OverallStats getOverallStats() {
    final all = runAllTests();
    final totalExercises = all.length;
    final perfect = all.values.where((r) => r.isPerfect).length;
    final partial =
        all.values.where((r) => r.passed > 0 && !r.isPerfect).length;
    final failed = all.values.where((r) => r.passed == 0).length;

    int totalTests = 0;
    int passedTests = 0;
    for (final r in all.values) {
      totalTests += r.total;
      passedTests += r.passed;
    }

    return Efd1600OverallStats(
      totalExercises: totalExercises,
      perfectExercises: perfect,
      partialExercises: partial,
      failedExercises: failed,
      totalTests: totalTests,
      passedTests: passedTests,
    );
  }
}

class Efd1600OverallStats {
  final int totalExercises;
  final int perfectExercises;
  final int partialExercises;
  final int failedExercises;
  final int totalTests;
  final int passedTests;

  Efd1600OverallStats({
    required this.totalExercises,
    required this.perfectExercises,
    required this.partialExercises,
    required this.failedExercises,
    required this.totalTests,
    required this.passedTests,
  });

  double get testPercentage =>
      totalTests > 0 ? (passedTests / totalTests) * 100 : 0.0;

  double get exercisePercentage =>
      totalExercises > 0 ? (perfectExercises / totalExercises) * 100 : 0.0;

  String get overallGrade {
    final p = testPercentage;
    if (p == 100) return "A+ (Perfect!)";
    if (p >= 90) return "A";
    if (p >= 80) return "B";
    if (p >= 70) return "C";
    if (p >= 60) return "D";
    return "F";
  }
}
