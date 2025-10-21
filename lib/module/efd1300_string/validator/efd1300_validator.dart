import '../tests/efd1300_tests.dart';

class Efd1300Validator {
  static TestResult runTest(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        return Efd1300Tests.test1();
      case 2:
        return Efd1300Tests.test2();
      case 3:
        return Efd1300Tests.test3();
      case 4:
        return Efd1300Tests.test4();
      case 5:
        return Efd1300Tests.test5();
      case 6:
        return Efd1300Tests.test6();
      case 7:
        return Efd1300Tests.test7();
      case 8:
        return Efd1300Tests.test8();
      case 9:
        return Efd1300Tests.test9();
      case 10:
        return Efd1300Tests.test10();
      case 11:
        return Efd1300Tests.test11();
      case 12:
        return Efd1300Tests.test12();
      case 13:
        return Efd1300Tests.test13();
      case 14:
        return Efd1300Tests.test14();
      case 15:
        return Efd1300Tests.test15();
      case 16:
        return Efd1300Tests.test16();
      case 17:
        return Efd1300Tests.test17();
      case 18:
        return Efd1300Tests.test18();
      case 19:
        return Efd1300Tests.test19();
      case 20:
        return Efd1300Tests.test20();
      case 21:
        return Efd1300Tests.test21();
      case 22:
        return Efd1300Tests.test22();
      case 23:
        return Efd1300Tests.test23();
      case 24:
        return Efd1300Tests.test24();
      case 25:
        return Efd1300Tests.test25();
      case 26:
        return Efd1300Tests.test26();
      case 27:
        return Efd1300Tests.test27();
      case 28:
        return Efd1300Tests.test28();
      case 29:
        return Efd1300Tests.test29();
      case 30:
        return Efd1300Tests.test30();
      case 31:
        return Efd1300Tests.test31();
      case 32:
        return Efd1300Tests.test32();
      case 33:
        return Efd1300Tests.test33();
      case 34:
        return Efd1300Tests.test34();
      case 35:
        return Efd1300Tests.test35();
      default:
        return TestResult(
          exerciseName: "Exercise $exerciseNumber",
          exerciseNumber: exerciseNumber,
          passed: 0,
          total: 1,
          isPerfect: false,
          errors: ["⚠️ Test untuk exercise ini belum diimplementasi"],
        );
    }
  }

  static Map<int, TestResult> runAllTests() {
    final results = <int, TestResult>{};
    final implemented = List<int>.generate(35, (i) => i + 1);
    for (final n in implemented) {
      results[n] = runTest(n);
    }
    return results;
  }

  static Efd1300OverallStats getOverallStats() {
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

    return Efd1300OverallStats(
      totalExercises: totalExercises,
      perfectExercises: perfect,
      partialExercises: partial,
      failedExercises: failed,
      totalTests: totalTests,
      passedTests: passedTests,
    );
  }
}

class Efd1300OverallStats {
  final int totalExercises;
  final int perfectExercises;
  final int partialExercises;
  final int failedExercises;
  final int totalTests;
  final int passedTests;

  Efd1300OverallStats({
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
