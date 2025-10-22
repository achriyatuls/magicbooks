// 📊 EXERCISE DATA COLLECTOR
//
// ════════════════════════════════════════════════════════════════════════════
// Helper untuk mengumpulkan data dari validator dan mengkonversi ke format submission
// ════════════════════════════════════════════════════════════════════════════

import '../model/exercise_submission.dart';

/// Helper untuk mengumpulkan data exercise dari validator
class ExerciseDataCollector {
  /// Mengumpulkan data dari validator dan mengkonversi ke ExerciseSubmissionData
  static ExerciseSubmissionData collectSubmissionData({
    required String moduleCode,
    required String moduleName,
    required String studentId,
    required String studentName,
    required Map<int, dynamic> testResults, // Map<int, TestResult>
    required dynamic overallStats, // OverallStats dari validator
    required DateTime startedAt,
    required DateTime completedAt,
  }) {
    // Konversi test results ke ExerciseResult
    final List<ExerciseResult> exerciseResults = [];

    testResults.forEach((exerciseNumber, testResult) {
      // TestResult memiliki struktur: exerciseName, exerciseNumber, passed, total, isPerfect, errors, hints
      final result = ExerciseResult(
        exerciseNumber: testResult.exerciseNumber,
        exerciseName: testResult.exerciseName,
        passedTests: testResult.passed,
        totalTests: testResult.total,
        isPerfect: testResult.isPerfect,
        percentage: testResult.percentage, // Dari TestResult
        grade: testResult.grade, // Dari TestResult
        errors: List<String>.from(testResult.errors),
        hints: List<String>.from(testResult.hints),
        completedAt: completedAt,
      );
      exerciseResults.add(result);
    });

    // Konversi overall stats ke ModuleSummary
    final moduleSummary = ModuleSummary(
      totalExercises: overallStats.totalExercises,
      perfectExercises: overallStats.perfectExercises,
      partialExercises: overallStats.partialExercises,
      failedExercises: overallStats.failedExercises,
      totalTests: overallStats.totalTests,
      passedTests: overallStats.passedTests,
      exercisePercentage: overallStats.exercisePercentage,
      testPercentage: overallStats.testPercentage,
      overallGrade: overallStats.overallGrade,
      timeSpentMinutes: completedAt.difference(startedAt).inMinutes,
      startedAt: startedAt,
      completedAt: completedAt,
    );

    return ExerciseSubmissionData(
      moduleCode: moduleCode,
      moduleName: moduleName,
      studentId: studentId,
      studentName: studentName,
      submissionTime: completedAt,
      exerciseResults: exerciseResults,
      moduleSummary: moduleSummary,
    );
  }

  /// Mengumpulkan data dari EFD1100 Validator
  static ExerciseSubmissionData collectFromEfd1100({
    required String studentId,
    required String studentName,
    required DateTime startedAt,
    required DateTime completedAt,
  }) {
    // Import validator (akan di-inject dari luar)
    // final testResults = Efd1100Validator.runAllTests();
    // final overallStats = Efd1100Validator.getOverallStats();

    return collectSubmissionData(
      moduleCode: "EFD1100",
      moduleName: "Variable",
      studentId: studentId,
      studentName: studentName,
      testResults: {}, // Akan diisi dari validator
      overallStats: {}, // Akan diisi dari validator
      startedAt: startedAt,
      completedAt: completedAt,
    );
  }

  /// Mengumpulkan data dari EFD1200 Validator
  static ExerciseSubmissionData collectFromEfd1200({
    required String studentId,
    required String studentName,
    required DateTime startedAt,
    required DateTime completedAt,
  }) {
    return collectSubmissionData(
      moduleCode: "EFD1200",
      moduleName: "DateTime",
      studentId: studentId,
      studentName: studentName,
      testResults: {}, // Akan diisi dari validator
      overallStats: {}, // Akan diisi dari validator
      startedAt: startedAt,
      completedAt: completedAt,
    );
  }

  /// Mengumpulkan data dari EFD1300 Validator
  static ExerciseSubmissionData collectFromEfd1300({
    required String studentId,
    required String studentName,
    required DateTime startedAt,
    required DateTime completedAt,
  }) {
    return collectSubmissionData(
      moduleCode: "EFD1300",
      moduleName: "String",
      studentId: studentId,
      studentName: studentName,
      testResults: {}, // Akan diisi dari validator
      overallStats: {}, // Akan diisi dari validator
      startedAt: startedAt,
      completedAt: completedAt,
    );
  }

  /// Mengumpulkan data dari EFD1400 Validator
  static ExerciseSubmissionData collectFromEfd1400({
    required String studentId,
    required String studentName,
    required DateTime startedAt,
    required DateTime completedAt,
  }) {
    return collectSubmissionData(
      moduleCode: "EFD1400",
      moduleName: "Number",
      studentId: studentId,
      studentName: studentName,
      testResults: {}, // Akan diisi dari validator
      overallStats: {}, // Akan diisi dari validator
      startedAt: startedAt,
      completedAt: completedAt,
    );
  }

  /// Mengumpulkan data dari EFD1500 Validator
  static ExerciseSubmissionData collectFromEfd1500({
    required String studentId,
    required String studentName,
    required DateTime startedAt,
    required DateTime completedAt,
  }) {
    return collectSubmissionData(
      moduleCode: "EFD1500",
      moduleName: "IF Statement",
      studentId: studentId,
      studentName: studentName,
      testResults: {}, // Akan diisi dari validator
      overallStats: {}, // Akan diisi dari validator
      startedAt: startedAt,
      completedAt: completedAt,
    );
  }

  /// Mengumpulkan data dari EFD1600 Validator
  static ExerciseSubmissionData collectFromEfd1600({
    required String studentId,
    required String studentName,
    required DateTime startedAt,
    required DateTime completedAt,
  }) {
    return collectSubmissionData(
      moduleCode: "EFD1600",
      moduleName: "List & Map",
      studentId: studentId,
      studentName: studentName,
      testResults: {}, // Akan diisi dari validator
      overallStats: {}, // Akan diisi dari validator
      startedAt: startedAt,
      completedAt: completedAt,
    );
  }

  /// Mengumpulkan data dari EFD1700 Validator
  static ExerciseSubmissionData collectFromEfd1700({
    required String studentId,
    required String studentName,
    required DateTime startedAt,
    required DateTime completedAt,
  }) {
    return collectSubmissionData(
      moduleCode: "EFD1700",
      moduleName: "Regex",
      studentId: studentId,
      studentName: studentName,
      testResults: {}, // Akan diisi dari validator
      overallStats: {}, // Akan diisi dari validator
      startedAt: startedAt,
      completedAt: completedAt,
    );
  }

  /// Mengumpulkan data dari EFD1800 Validator
  static ExerciseSubmissionData collectFromEfd1800({
    required String studentId,
    required String studentName,
    required DateTime startedAt,
    required DateTime completedAt,
  }) {
    return collectSubmissionData(
      moduleCode: "EFD1800",
      moduleName: "Async Function",
      studentId: studentId,
      studentName: studentName,
      testResults: {}, // Akan diisi dari validator
      overallStats: {}, // Akan diisi dari validator
      startedAt: startedAt,
      completedAt: completedAt,
    );
  }

  /// Generic method untuk mengumpulkan data dari validator apapun
  static ExerciseSubmissionData collectFromValidator({
    required String moduleCode,
    required String moduleName,
    required String studentId,
    required String studentName,
    required Map<int, dynamic> testResults,
    required dynamic overallStats,
    required DateTime startedAt,
    required DateTime completedAt,
  }) {
    return collectSubmissionData(
      moduleCode: moduleCode,
      moduleName: moduleName,
      studentId: studentId,
      studentName: studentName,
      testResults: testResults,
      overallStats: overallStats,
      startedAt: startedAt,
      completedAt: completedAt,
    );
  }
}
