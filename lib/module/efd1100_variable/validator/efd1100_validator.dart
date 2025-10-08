// 🔄 TEST RUNNER - EFD1100 VARIABLE
//
// ════════════════════════════════════════════════════════════════════════════
// File ini menjalankan tests dan mengumpulkan hasil
// ════════════════════════════════════════════════════════════════════════════

import '../tests/efd1100_tests.dart';

/// Class untuk menjalankan dan manage test results
class Efd1100Validator {
  /// Run test untuk specific exercise
  static TestResult runTest(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        return Efd1100Tests.testExercise1();
      case 2:
        return Efd1100Tests.testExercise2();
      case 3:
        return Efd1100Tests.testExercise3();
      case 4:
        return Efd1100Tests.testExercise4();
      case 5:
        return Efd1100Tests.testExercise5();
      case 6:
        return Efd1100Tests.testExercise6();
      case 7:
        return Efd1100Tests.testExercise7();
      case 8:
        return Efd1100Tests.testExercise8();
      case 9:
        return Efd1100Tests.testExercise9();
      case 10:
        return Efd1100Tests.testExercise10();
      case 11:
        return Efd1100Tests.testExercise11();
      case 12:
        return Efd1100Tests.testExercise12();
      case 13:
        return Efd1100Tests.testExercise13();
      case 14:
        return Efd1100Tests.testExercise14();
      case 15:
        return Efd1100Tests.testExercise15();
      case 16:
        return Efd1100Tests.testExercise16();
      case 17:
        return Efd1100Tests.testExercise17();
      case 18:
        return Efd1100Tests.testExercise18();
      case 19:
        return Efd1100Tests.testExercise19();
      case 20:
        return Efd1100Tests.testExercise20();
      case 21:
        return Efd1100Tests.testExercise21();
      case 22:
        return Efd1100Tests.testExercise22();
      case 23:
        return Efd1100Tests.testExercise23();
      case 24:
        return Efd1100Tests.testExercise24();
      case 25:
        return Efd1100Tests.testExercise25();
      case 26:
        return Efd1100Tests.testExercise26();
      case 27:
        return Efd1100Tests.testExercise27();
      case 28:
        return Efd1100Tests.testExercise28();
      case 29:
        return Efd1100Tests.testExercise29();
      case 30:
        return Efd1100Tests.testExercise30();
      case 31:
        return Efd1100Tests.testExercise31();
      case 32:
        return Efd1100Tests.testExercise32();
      case 33:
        return Efd1100Tests.testExercise33();
      case 34:
        return Efd1100Tests.testExercise34();
      case 35:
        return Efd1100Tests.testExercise35();
      default:
        // Return dummy result untuk exercise yang belum diimplementasi
        return TestResult(
          exerciseName: "Exercise $exerciseNumber",
          exerciseNumber: exerciseNumber,
          passed: 0,
          total: 1,
          isPerfect: false,
          errors: ["⚠️ Test untuk exercise ini belum diimplementasi"],
          hints: ["💡 Silakan hubungi guru untuk menambahkan test cases"],
        );
    }
  }

  /// Run semua tests yang sudah diimplementasi
  static Map<int, TestResult> runAllTests() {
    Map<int, TestResult> results = {};

    // List exercise yang sudah punya test (SEMUA 35 EXERCISES!)
    List<int> implementedExercises = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
      25,
      26,
      27,
      28,
      29,
      30,
      31,
      32,
      33,
      34,
      35
    ];

    for (int exerciseNum in implementedExercises) {
      try {
        results[exerciseNum] = runTest(exerciseNum);
      } catch (e) {
        // Jika ada error, buat result dengan error message
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

  /// Get overall statistics dari semua tests
  static OverallStats getOverallStats() {
    var allResults = runAllTests();

    int totalExercises = allResults.length;
    int perfectExercises = allResults.values.where((r) => r.isPerfect).length;
    int partialExercises =
        allResults.values.where((r) => r.passed > 0 && !r.isPerfect).length;
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

  /// Get list of exercises sorted by performance
  static List<ExercisePerformance> getPerformanceList() {
    var allResults = runAllTests();
    List<ExercisePerformance> performances = [];

    for (var entry in allResults.entries) {
      performances.add(ExercisePerformance(
        exerciseNumber: entry.key,
        exerciseName: entry.value.exerciseName,
        passed: entry.value.passed,
        total: entry.value.total,
        percentage: entry.value.percentage,
        grade: entry.value.grade,
      ));
    }

    // Sort by percentage (descending)
    performances.sort((a, b) => b.percentage.compareTo(a.percentage));

    return performances;
  }
}

/// Model untuk overall statistics
class OverallStats {
  final int totalExercises;
  final int perfectExercises;
  final int partialExercises;
  final int failedExercises;
  final int totalTests;
  final int passedTests;

  OverallStats({
    required this.totalExercises,
    required this.perfectExercises,
    required this.partialExercises,
    required this.failedExercises,
    required this.totalTests,
    required this.passedTests,
  });

  double get exercisePercentage =>
      totalExercises > 0 ? (perfectExercises / totalExercises) * 100 : 0;

  double get testPercentage =>
      totalTests > 0 ? (passedTests / totalTests) * 100 : 0;

  String get overallGrade {
    if (testPercentage == 100) return "A+ (Perfect!)";
    if (testPercentage >= 90) return "A";
    if (testPercentage >= 80) return "B";
    if (testPercentage >= 70) return "C";
    if (testPercentage >= 60) return "D";
    return "F";
  }

  /// Get completion level untuk gamification
  int get xpEarned => passedTests * 10; // 10 XP per test passed
  int get totalXp => totalTests * 10;

  /// Check if user dapat achievement
  List<String> get achievements {
    List<String> earned = [];

    if (perfectExercises >= 1) earned.add("🌟 First Perfect!");
    if (perfectExercises >= 5) earned.add("🔥 On Fire!");
    if (perfectExercises == totalExercises) earned.add("💯 Perfect Score!");

    if (testPercentage >= 50) earned.add("📈 Half Way There");
    if (testPercentage >= 75) earned.add("🎯 Expert Level");
    if (testPercentage == 100) earned.add("🏆 Master of Variables");

    return earned;
  }
}

/// Model untuk individual exercise performance
class ExercisePerformance {
  final int exerciseNumber;
  final String exerciseName;
  final int passed;
  final int total;
  final double percentage;
  final String grade;

  ExercisePerformance({
    required this.exerciseNumber,
    required this.exerciseName,
    required this.passed,
    required this.total,
    required this.percentage,
    required this.grade,
  });
}
