import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import 'package:magicbook/shared/widget/row_label/row_label_validated_efd1600.dart';

class Efd1600ListAndMapView extends StatelessWidget {
  const Efd1600ListAndMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EfdGenericView(
      config: EfdModuleConfig(
        moduleCode: "EFD1600",
        moduleName: "List & Map",
        moduleDescription: "Master collections with validated exercises",
        totalExercises: 35,
        backgroundColor: const Color(0xFFE8DCFF),
        primaryColor: Colors.purple,
        runTest: EfdAdapter.wrapRunTest(Efd1600Validator.runTest),
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
            //'completionRate': stats.exercisePercentage,
            'successRate': stats.testPercentage,
            'grade': stats.overallGrade,
            'results':
                [], // Empty list since OverallStats doesn't have results property
          });
        },
        buildExerciseRow: rowLabelValidatedEfd1600,
        customIcon: Icons.list,
        customBannerTitle: "List & Map Exercises",
        customBannerSubtitle: "Master collections with validated exercises",
        exerciseFileHint: "efd1600_exercises.dart",
      ),
    );
  }
}
