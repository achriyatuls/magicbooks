// 📤 CONTOH PENGGUNAAN SUBMIT EXERCISE FAB
//
// ════════════════════════════════════════════════════════════════════════════
// Contoh bagaimana menggunakan SubmitExerciseFAB dalam EfdGenericView
// ════════════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

/// Contoh penggunaan SubmitExerciseFAB dalam EfdGenericView
class ExampleEfdViewWithSubmit extends StatelessWidget {
  final String studentId;
  final String studentName;
  final String? authToken;

  const ExampleEfdViewWithSubmit({
    Key? key,
    required this.studentId,
    required this.studentName,
    this.authToken,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EfdGenericView(
        config: EfdModuleConfig(
          // Basic Module Info
          moduleCode: "EFD1100",
          moduleName: "Variable",
          moduleDescription: "Master Dart variables with validated exercises",
          totalExercises: 35,

          // Visual Styling
          backgroundColor: const Color(0xFFE5D9F2),
          primaryColor: Colors.purple,

          // Validator Functions (wrapped untuk type compatibility)
          runTest: EfdAdapter.wrapRunTest(Efd1100Validator.runTest),
          runAllTests: () async {
            final results = Efd1100Validator.runAllTests();
            final resultsList = results.values.toList();
            return EfdAdapter.convertTestResults(resultsList);
          },
          getOverallStats: () {
            final stats = Efd1100Validator.getOverallStats();
            return EfdAdapter.convertOverallStats({
              'totalExercises': stats.totalExercises,
              'completedExercises': stats.perfectExercises,
              'totalTests': stats.totalTests,
              'passedTests': stats.passedTests,
              'completionRate': stats.exercisePercentage,
              'successRate': stats.testPercentage,
              'grade': stats.overallGrade,
              'results': [],
            });
          },

          // Module-specific Row Widget
          buildExerciseRow: (exerciseNumber) => Container(), // Placeholder

          // Optional Customization
          customIcon: Icons.code,
          customBannerTitle: "Variable Exercises",
          customBannerSubtitle:
              "Master Dart variables with validated exercises",
          exerciseFileHint: "efd1100_exercises.dart",
        ),
      ),
      // ✅ SUBMIT EXERCISE FAB - Mengganti FAB yang lama
      floatingActionButton: SubmitExerciseFAB(
        moduleCode: "EFD1100",
        moduleName: "Variable",
        studentId: studentId,
        studentName: studentName,
        testResults: Efd1100Validator.runAllTests(), // Data dari validator
        overallStats:
            Efd1100Validator.getOverallStats(), // Stats dari validator
        startedAt: DateTime.now(), // Waktu mulai session
        authToken: authToken,
      ),
    );
  }
}

/// Contoh penggunaan dengan helper method
class ExampleEfdViewWithHelper extends StatelessWidget {
  final String studentId;
  final String studentName;
  final String? authToken;

  const ExampleEfdViewWithHelper({
    Key? key,
    required this.studentId,
    required this.studentName,
    this.authToken,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EfdGenericView(
        config: EfdModuleConfig(
          moduleCode: "EFD1600",
          moduleName: "List & Map",
          moduleDescription: "Master collections with validated exercises",
          totalExercises: 35,
          backgroundColor: const Color(0xFFF3E5F5),
          primaryColor: Colors.deepPurple,
          runTest: EfdAdapter.wrapRunTest(Efd1600Validator.runTest),
          runAllTests: () async {
            final results = Efd1600Validator.runAllTests();
            final resultsList = results.values.toList();
            return EfdAdapter.convertTestResults(resultsList);
          },
          getOverallStats: () {
            final stats = Efd1600Validator.getOverallStats();
            return EfdAdapter.convertOverallStats({
              'totalExercises': stats.totalExercises,
              'completedExercises': stats.perfectExercises,
              'totalTests': stats.totalTests,
              'passedTests': stats.passedTests,
              'completionRate': stats.exercisePercentage,
              'successRate': stats.testPercentage,
              'grade': stats.overallGrade,
              'results': [],
            });
          },
          buildExerciseRow: (exerciseNumber) => Container(), // Placeholder
          customIcon: Icons.list,
          customBannerTitle: "List & Map Exercises",
          customBannerSubtitle: "Master collections with validated exercises",
          exerciseFileHint: "efd1600_exercises.dart",
        ),
      ),
      // ✅ SUBMIT EXERCISE FAB dengan helper
      floatingActionButton: SubmitExerciseFABHelper.createForEfd1600(
        studentId: studentId,
        studentName: studentName,
        startedAt: DateTime.now(),
        authToken: authToken,
      ),
    );
  }
}

/// Contoh penggunaan dengan session tracking
class ExampleEfdViewWithSessionTracking extends StatefulWidget {
  final String studentId;
  final String studentName;
  final String? authToken;

  const ExampleEfdViewWithSessionTracking({
    Key? key,
    required this.studentId,
    required this.studentName,
    this.authToken,
  }) : super(key: key);

  @override
  State<ExampleEfdViewWithSessionTracking> createState() =>
      _ExampleEfdViewWithSessionTrackingState();
}

class _ExampleEfdViewWithSessionTrackingState
    extends State<ExampleEfdViewWithSessionTracking> {
  late DateTime _sessionStartTime;

  @override
  void initState() {
    super.initState();
    _sessionStartTime = DateTime.now(); // Track session start time
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EfdGenericView(
        config: EfdModuleConfig(
          moduleCode: "EFD1700",
          moduleName: "Regex",
          moduleDescription: "Master regex patterns with validated exercises",
          totalExercises: 34,
          backgroundColor: const Color(0xFFE5D4FF),
          primaryColor: Colors.purple,
          runTest: EfdAdapter.wrapRunTest(Efd1700Validator.runTest),
          runAllTests: () async {
            final results = await Efd1700Validator.runAllTests();
            return EfdAdapter.convertTestResults(results);
          },
          getOverallStats: () {
            final stats = Efd1700Validator.getOverallStats();
            return EfdAdapter.convertOverallStats(stats);
          },
          buildExerciseRow: rowLabelValidatedEfd1700,
          customIcon: Icons.code,
          customBannerTitle: "Regular Expression Exercises",
          customBannerSubtitle:
              "Master regex patterns with validated exercises",
          exerciseFileHint: "efd1700_exercises.dart",
        ),
      ),
      // ✅ SUBMIT EXERCISE FAB dengan session tracking
      floatingActionButton: SubmitExerciseFAB(
        moduleCode: "EFD1700",
        moduleName: "Regex",
        studentId: widget.studentId,
        studentName: widget.studentName,
        testResults: {}, // Akan diisi dari validator
        overallStats: {}, // Akan diisi dari validator
        startedAt: _sessionStartTime, // Session start time
        authToken: widget.authToken,
      ),
    );
  }
}
