import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

class Efd1100VariableView extends StatelessWidget {
  const Efd1100VariableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EfdGenericView(
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
          // Convert Map<int, TestResult> to List<TestResult>
          final resultsList = results.values.toList();
          return EfdAdapter.convertTestResults(resultsList);
        },
        getOverallStats: () {
          final stats = Efd1100Validator.getOverallStats();
          // Convert OverallStats to Map<String, dynamic>
          return EfdAdapter.convertOverallStats({
            'totalExercises': stats.totalExercises,
            'completedExercises': stats.perfectExercises,
            'totalTests': stats.totalTests,
            'passedTests': stats.passedTests,
            'completionRate': stats.exercisePercentage,
            'successRate': stats.testPercentage,
            'grade': stats.overallGrade,
            'results':
                [], // Empty list since OverallStats doesn't have results property
          });
        },

        // Module-specific Row Widget
        buildExerciseRow: rowLabelValidated,

        // Optional Customization
        customIcon: Icons.code,
        customBannerTitle: "Variable Exercises",
        customBannerSubtitle: "Master Dart variables with validated exercises",
        exerciseFileHint: "efd1100_exercises.dart",
      ),
    );
  }
}
