/// Base TestResult model untuk semua EFD modules
/// Menggantikan TestResult yang duplikat di setiap module
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

/// Base TestCase model untuk semua EFD modules
class TestCase<I, O> {
  final I input;
  final O expected;
  final String? description;

  TestCase({required this.input, required this.expected, this.description});
}

/// Overall Statistics model untuk semua EFD modules
class OverallStats {
  final int totalExercises;
  final int completedExercises;
  final int totalTests;
  final int passedTests;
  final double completionRate;
  final double successRate;
  final String grade;
  final List<TestResult> results;

  OverallStats({
    required this.totalExercises,
    required this.completedExercises,
    required this.totalTests,
    required this.passedTests,
    required this.completionRate,
    required this.successRate,
    required this.grade,
    required this.results,
  });

  /// Factory constructor untuk convert dari Map (backward compatibility)
  factory OverallStats.fromMap(Map<String, dynamic> map) {
    return OverallStats(
      totalExercises: map['totalExercises'] ?? 0,
      completedExercises: map['completedExercises'] ?? 0,
      totalTests: map['totalTests'] ?? 0,
      passedTests: map['passedTests'] ?? 0,
      completionRate: (map['completionRate'] ?? 0.0).toDouble(),
      successRate: (map['successRate'] ?? 0.0).toDouble(),
      grade: map['grade'] ?? 'F',
      results: (map['results'] as List<dynamic>?)?.cast<TestResult>() ?? [],
    );
  }
}
