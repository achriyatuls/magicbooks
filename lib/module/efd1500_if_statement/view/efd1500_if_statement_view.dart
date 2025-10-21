import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

class Efd1500IfStatementView extends StatelessWidget {
  const Efd1500IfStatementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EfdGenericView(
      config: EfdModuleConfig(
        moduleCode: "EFD1500",
        moduleName: "IF Statement",
        moduleDescription:
            "Master conditional statements with validated exercises",
        totalExercises: 35,
        backgroundColor: const Color(0xFFE8DCFF),
        primaryColor: Colors.purple,
        runTest: EfdAdapter.wrapRunTest(Efd1500Validator.runTest),
        runAllTests: () async {
          final results = Efd1500Validator.runAllTests();
          // Convert Map<int, TestResult> to List<TestResult>
          final resultsList = results.values.toList();
          return EfdAdapter.convertTestResults(resultsList);
        },
        getOverallStats: () {
          final stats = Efd1500Validator.getOverallStats();
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
        buildExerciseRow: rowLabelValidatedEfd1500,
        customIcon: Icons.code,
        customBannerTitle: "IF Statement Exercises",
        customBannerSubtitle:
            "Master conditional statements with validated exercises",
        exerciseFileHint: "efd1500_exercises.dart",
      ),
    );
  }
}
