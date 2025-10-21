import '../tests/efd1500_tests.dart';

class Efd1500Validator {
  static TestResult runTest(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        return Efd1500Tests.test1();
      default:
        return TestResult(
          exerciseName: "Exercise $exerciseNumber",
          exerciseNumber: exerciseNumber,
          passed: 0,
          total: 1,
          isPerfect: false,
          errors: ["Test untuk exercise ini belum diimplementasi"],
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

  static Efd1500OverallStats getOverallStats() {
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

    return Efd1500OverallStats(
      totalExercises: totalExercises,
      perfectExercises: perfect,
      partialExercises: partial,
      failedExercises: failed,
      totalTests: totalTests,
      passedTests: passedTests,
    );
  }
}

class Efd1500OverallStats {
  final int totalExercises;
  final int perfectExercises;
  final int partialExercises;
  final int failedExercises;
  final int totalTests;
  final int passedTests;

  Efd1500OverallStats({
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
