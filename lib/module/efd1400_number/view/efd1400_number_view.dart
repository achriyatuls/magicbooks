import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

class Efd1400NumberView extends StatelessWidget {
  const Efd1400NumberView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EfdGenericView(
      config: EfdModuleConfig(
        moduleCode: "EFD1400",
        moduleName: "Number",
        moduleDescription: "Master Number operations with validated exercises",
        totalExercises: 35,
        backgroundColor: const Color(0xFFE8DCFF),
        primaryColor: Colors.purple,
        runTest: EfdAdapter.wrapRunTest(Efd1400Validator.runTest),
        runAllTests: () async {
          final results = Efd1400Validator.runAllTests();
          // Convert Map<int, TestResult> to List<TestResult>
          final resultsList = results.values.toList();
          return EfdAdapter.convertTestResults(resultsList);
        },
        getOverallStats: () {
          final stats = Efd1400Validator.getOverallStats();
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
        buildExerciseRow: rowLabelValidatedEfd1400,
        customIcon: Icons.calculate,
        customBannerTitle: "Number Exercises",
        customBannerSubtitle:
            "Master Number operations with validated exercises",
        exerciseFileHint: "efd1400_exercises.dart",
      ),
    );
  }
}
