// 📤 EXERCISE SUBMISSION MODEL
//
// ════════════════════════════════════════════════════════════════════════════
// Model untuk mengirim hasil pengerjaan exercise ke server
// ════════════════════════════════════════════════════════════════════════════

/// Model untuk data submission per exercise
class ExerciseSubmissionData {
  final String moduleCode; // "EFD1100", "EFD1200", etc.
  final String moduleName; // "Variable", "DateTime", etc.
  final String studentId; // ID siswa (dari auth system)
  final String studentName; // Nama siswa
  final DateTime submissionTime; // Waktu submit
  final List<ExerciseResult> exerciseResults; // Detail per exercise
  final ModuleSummary moduleSummary; // Ringkasan module

  ExerciseSubmissionData({
    required this.moduleCode,
    required this.moduleName,
    required this.studentId,
    required this.studentName,
    required this.submissionTime,
    required this.exerciseResults,
    required this.moduleSummary,
  });

  Map<String, dynamic> toJson() {
    return {
      'moduleCode': moduleCode,
      'moduleName': moduleName,
      'studentId': studentId,
      'studentName': studentName,
      'submissionTime': submissionTime.toIso8601String(),
      'exerciseResults': exerciseResults.map((e) => e.toJson()).toList(),
      'moduleSummary': moduleSummary.toJson(),
    };
  }

  factory ExerciseSubmissionData.fromJson(Map<String, dynamic> json) {
    return ExerciseSubmissionData(
      moduleCode: json['moduleCode'],
      moduleName: json['moduleName'],
      studentId: json['studentId'],
      studentName: json['studentName'],
      submissionTime: DateTime.parse(json['submissionTime']),
      exerciseResults: (json['exerciseResults'] as List)
          .map((e) => ExerciseResult.fromJson(e))
          .toList(),
      moduleSummary: ModuleSummary.fromJson(json['moduleSummary']),
    );
  }
}

/// Model untuk hasil per exercise
class ExerciseResult {
  final int exerciseNumber; // 1, 2, 3, ...
  final String exerciseName; // "Exercise 1: String to Double"
  final int passedTests; // Jumlah test yang passed
  final int totalTests; // Total test cases
  final bool isPerfect; // Apakah semua test passed
  final double percentage; // Persentase keberhasilan
  final String grade; // A+, A, B, C, D, F
  final List<String> errors; // Error messages
  final List<String> hints; // Hints yang diberikan
  final DateTime completedAt; // Waktu exercise selesai

  ExerciseResult({
    required this.exerciseNumber,
    required this.exerciseName,
    required this.passedTests,
    required this.totalTests,
    required this.isPerfect,
    required this.percentage,
    required this.grade,
    required this.errors,
    required this.hints,
    required this.completedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'exerciseNumber': exerciseNumber,
      'exerciseName': exerciseName,
      'passedTests': passedTests,
      'totalTests': totalTests,
      'isPerfect': isPerfect,
      'percentage': percentage,
      'grade': grade,
      'errors': errors,
      'hints': hints,
      'completedAt': completedAt.toIso8601String(),
    };
  }

  factory ExerciseResult.fromJson(Map<String, dynamic> json) {
    return ExerciseResult(
      exerciseNumber: json['exerciseNumber'],
      exerciseName: json['exerciseName'],
      passedTests: json['passedTests'],
      totalTests: json['totalTests'],
      isPerfect: json['isPerfect'],
      percentage: json['percentage'].toDouble(),
      grade: json['grade'],
      errors: List<String>.from(json['errors']),
      hints: List<String>.from(json['hints']),
      completedAt: DateTime.parse(json['completedAt']),
    );
  }
}

/// Model untuk ringkasan module
class ModuleSummary {
  final int totalExercises; // Total exercises dalam module
  final int perfectExercises; // Exercises yang perfect
  final int partialExercises; // Exercises yang partial
  final int failedExercises; // Exercises yang failed
  final int totalTests; // Total test cases
  final int passedTests; // Test cases yang passed
  final double exercisePercentage; // % exercises perfect
  final double testPercentage; // % tests passed
  final String overallGrade; // Grade keseluruhan
  final int timeSpentMinutes; // Waktu yang dihabiskan (dalam menit)
  final DateTime startedAt; // Waktu mulai mengerjakan
  final DateTime completedAt; // Waktu selesai mengerjakan

  ModuleSummary({
    required this.totalExercises,
    required this.perfectExercises,
    required this.partialExercises,
    required this.failedExercises,
    required this.totalTests,
    required this.passedTests,
    required this.exercisePercentage,
    required this.testPercentage,
    required this.overallGrade,
    required this.timeSpentMinutes,
    required this.startedAt,
    required this.completedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'totalExercises': totalExercises,
      'perfectExercises': perfectExercises,
      'partialExercises': partialExercises,
      'failedExercises': failedExercises,
      'totalTests': totalTests,
      'passedTests': passedTests,
      'exercisePercentage': exercisePercentage,
      'testPercentage': testPercentage,
      'overallGrade': overallGrade,
      'timeSpentMinutes': timeSpentMinutes,
      'startedAt': startedAt.toIso8601String(),
      'completedAt': completedAt.toIso8601String(),
    };
  }

  factory ModuleSummary.fromJson(Map<String, dynamic> json) {
    return ModuleSummary(
      totalExercises: json['totalExercises'],
      perfectExercises: json['perfectExercises'],
      partialExercises: json['partialExercises'],
      failedExercises: json['failedExercises'],
      totalTests: json['totalTests'],
      passedTests: json['passedTests'],
      exercisePercentage: json['exercisePercentage'].toDouble(),
      testPercentage: json['testPercentage'].toDouble(),
      overallGrade: json['overallGrade'],
      timeSpentMinutes: json['timeSpentMinutes'],
      startedAt: DateTime.parse(json['startedAt']),
      completedAt: DateTime.parse(json['completedAt']),
    );
  }
}

/// Response dari server setelah submit
class SubmissionResponse {
  final bool success; // Apakah submit berhasil
  final String message; // Pesan dari server
  final String submissionId; // ID submission untuk tracking
  final DateTime processedAt; // Waktu server memproses
  final Map<String, dynamic>? additionalData; // Data tambahan dari server

  SubmissionResponse({
    required this.success,
    required this.message,
    required this.submissionId,
    required this.processedAt,
    this.additionalData,
  });

  factory SubmissionResponse.fromJson(Map<String, dynamic> json) {
    return SubmissionResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      submissionId: json['submissionId'] ?? '',
      processedAt: DateTime.parse(
          json['processedAt'] ?? DateTime.now().toIso8601String()),
      additionalData: json['additionalData'],
    );
  }
}
