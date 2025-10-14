import '../model/test_result.dart' as shared;

/// Adapter utilities untuk convert module-specific TestResult ke shared TestResult
/// Mengatasi konflik type antara module TestResult dan shared TestResult
class EfdAdapter {
  /// Convert module TestResult ke shared TestResult
  static shared.TestResult convertTestResult(dynamic moduleTestResult) {
    return shared.TestResult(
      exerciseName: moduleTestResult.exerciseName,
      exerciseNumber: moduleTestResult.exerciseNumber,
      passed: moduleTestResult.passed,
      total: moduleTestResult.total,
      isPerfect: moduleTestResult.isPerfect,
      errors: moduleTestResult.errors,
      hints: moduleTestResult.hints,
    );
  }

  /// Convert List<module TestResult> ke List<shared TestResult>
  static List<shared.TestResult> convertTestResults(
      List<dynamic> moduleResults) {
    return moduleResults.map((result) => convertTestResult(result)).toList();
  }

  /// Convert Map dari validator ke shared OverallStats
  static shared.OverallStats convertOverallStats(Map<String, dynamic> stats) {
    return shared.OverallStats(
      totalExercises: stats['totalExercises'] ?? 0,
      completedExercises: stats['completedExercises'] ?? 0,
      totalTests: stats['totalTests'] ?? 0,
      passedTests: stats['passedTests'] ?? 0,
      completionRate: (stats['completionRate'] ?? 0.0).toDouble(),
      successRate: (stats['successRate'] ?? 0.0).toDouble(),
      grade: stats['grade'] ?? 'F',
      results: convertTestResults(stats['results'] ?? []),
    );
  }

  /// Wrapper untuk runTest function
  static shared.TestResult Function(int) wrapRunTest(
      dynamic Function(int) moduleRunTest) {
    return (int exerciseNumber) {
      final moduleResult = moduleRunTest(exerciseNumber);
      return convertTestResult(moduleResult);
    };
  }

  /// Wrapper untuk runAllTests function
  static Future<List<shared.TestResult>> Function() wrapRunAllTests(
      Future<List<dynamic>> Function() moduleRunAllTests) {
    return () async {
      final moduleResults = await moduleRunAllTests();
      return convertTestResults(moduleResults);
    };
  }

  /// Wrapper untuk getOverallStats function
  static shared.OverallStats Function() wrapGetOverallStats(
      Map<String, dynamic> Function() moduleGetOverallStats) {
    return () {
      final moduleStats = moduleGetOverallStats();
      return convertOverallStats(moduleStats);
    };
  }
}
