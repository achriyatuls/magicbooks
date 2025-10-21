import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

class Efd1200DatetimeView extends StatelessWidget {
  const Efd1200DatetimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EfdGenericView(
      config: EfdModuleConfig(
        moduleCode: "EFD1200",
        moduleName: "DateTime",
        moduleDescription:
            "Master DateTime operations with validated exercises",
        totalExercises: 35,
        backgroundColor: const Color(0xFFE8DCFF),
        primaryColor: Colors.purple,

        // Validator Functions (wrapped untuk type compatibility)
        runTest: EfdAdapter.wrapRunTest(Efd1200Validator.runTest),
        runAllTests: () async {
          final results = Efd1200Validator.runAllTests();
          // Convert Map<int, TestResult> to List<TestResult>
          final resultsList = results.values.toList();
          return EfdAdapter.convertTestResults(resultsList);
        },

        getOverallStats: () {
          final stats = Efd1200Validator.getOverallStats();
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
        buildExerciseRow: rowLabelValidatedEfd1200,
        customIcon: Icons.access_time,
        customBannerTitle: "DateTime Exercises",
        customBannerSubtitle:
            "Master DateTime operations with validated exercises",
        exerciseFileHint: "efd1200_exercises.dart",
      ),
    );
  }
}
