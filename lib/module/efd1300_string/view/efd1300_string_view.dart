import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import 'package:magicbook/shared/widget/row_label/row_label_validated_efd1300.dart';

class Efd1300StringView extends StatelessWidget {
  const Efd1300StringView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EfdGenericView(
      config: EfdModuleConfig(
        moduleCode: "EFD1300",
        moduleName: "String",
        moduleDescription: "Master String operations with validated exercises",
        totalExercises: 35,
        backgroundColor: const Color(0xFFE8DCFF),
        primaryColor: Colors.purple,
        runTest: EfdAdapter.wrapRunTest(Efd1300Validator.runTest),
        runAllTests: () async {
          final results = Efd1300Validator.runAllTests();
          // Convert Map<int, TestResult> to List<TestResult>
          final resultsList = results.values.toList();
          return EfdAdapter.convertTestResults(resultsList);
        },
        getOverallStats: () {
          final stats = Efd1300Validator.getOverallStats();
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
        buildExerciseRow: rowLabelValidatedEfd1300,
        customIcon: Icons.text_fields,
        customBannerTitle: "String Exercises",
        customBannerSubtitle:
            "Master String operations with validated exercises",
        exerciseFileHint: "efd1300_exercises.dart",
      ),
    );
  }
}
