import 'package:flutter/material.dart';
import 'test_result.dart' as shared;

/// Configuration model untuk EFD modules
/// Berisi semua informasi yang dibutuhkan untuk render generic layout
class EfdModuleConfig {
  // Basic Module Info
  final String moduleCode; // e.g., "EFD1100"
  final String moduleName; // e.g., "Variable"
  final String moduleDescription; // e.g., "Master Dart variables..."
  final int totalExercises; // e.g., 35

  // Visual Styling
  final Color backgroundColor; // e.g., Color(0xFFE5D9F2)
  final Color primaryColor; // e.g., Colors.purple

  // Validator Functions (Generic Signatures)
  final shared.TestResult Function(int) runTest;
  final Future<List<shared.TestResult>> Function() runAllTests;
  final shared.OverallStats Function() getOverallStats;

  // Row Widget Builder (Module-specific)
  final Widget Function(int) buildExerciseRow;

  // Optional Customization
  final String? customBannerTitle;
  final String? customBannerSubtitle;
  final IconData? customIcon;
  final String? exerciseFileHint; // e.g., "efd1100_exercises.dart"

  const EfdModuleConfig({
    required this.moduleCode,
    required this.moduleName,
    required this.moduleDescription,
    required this.totalExercises,
    required this.backgroundColor,
    required this.primaryColor,
    required this.runTest,
    required this.runAllTests,
    required this.getOverallStats,
    required this.buildExerciseRow,
    this.customBannerTitle,
    this.customBannerSubtitle,
    this.customIcon,
    this.exerciseFileHint,
  });

  /// Helper untuk generate exercise file hint
  String get defaultExerciseFileHint =>
      exerciseFileHint ?? "${moduleCode.toLowerCase()}_exercises.dart";

  /// Helper untuk generate banner title
  String get defaultBannerTitle => customBannerTitle ?? "$moduleName Exercises";

  /// Helper untuk generate banner subtitle
  String get defaultBannerSubtitle => customBannerSubtitle ?? moduleDescription;
}
