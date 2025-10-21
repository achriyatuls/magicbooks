import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

class Efd1700RegexViewGeneric extends StatelessWidget {
  const Efd1700RegexViewGeneric({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EfdGenericView(
      config: EfdModuleConfig(
        // Basic Module Info
        moduleCode: "EFD1700",
        moduleName: "Regex",
        moduleDescription: "Master regex patterns with validated exercises",
        totalExercises: 34,

        // Visual Styling
        backgroundColor: const Color(0xFFE5D4FF),
        primaryColor: Colors.purple,

        // Validator Functions (wrapped untuk type compatibility)
        runTest: EfdAdapter.wrapRunTest(Efd1700Validator.runTest),
        runAllTests: () async {
          final results = await Efd1700Validator.runAllTests();
          return EfdAdapter.convertTestResults(results);
        },
        getOverallStats: () {
          final stats = Efd1700Validator.getOverallStats();
          return EfdAdapter.convertOverallStats(stats);
        },

        // Module-specific Row Widget
        buildExerciseRow: rowLabelValidatedEfd1700,

        // Optional Customization
        customIcon: Icons.code,
        customBannerTitle: "Regular Expression Exercises",
        customBannerSubtitle: "Master regex patterns with validated exercises",
        exerciseFileHint: "efd1700_exercises.dart",
      ),
    );
  }
}
