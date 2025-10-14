import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

/// CONTOH MIGRATION: EFD1700 Regex menggunakan Generic System
///
/// SEBELUM: 380+ lines dengan banyak duplicated code
/// SESUDAH: ~50 lines dengan reusable components
///
/// Cara Migration:
/// 1. Ganti extends StatefulWidget → StatelessWidget
/// 2. Ganti build method → return EfdGenericView dengan config
/// 3. Hapus semua duplicated methods (_buildInfoBanner, dll)
/// 4. Rename file lama → efd1700_regex_view_old.dart
/// 5. Rename file ini → efd1700_regex_view.dart

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
        runAllTests: EfdAdapter.wrapRunAllTests(Efd1700Validator.runAllTests),
        getOverallStats:
            EfdAdapter.wrapGetOverallStats(Efd1700Validator.getOverallStats),

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

/// MIGRATION STEPS untuk modules lainnya:
/// 
/// 1. EFD1100 Variable:
/// ```dart
/// class Efd1100VariableView extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return EfdGenericView(
///       config: EfdModuleConfig(
///         moduleCode: "EFD1100",
///         moduleName: "Variable", 
///         moduleDescription: "Master Dart variables with validated exercises",
///         totalExercises: 35,
///         backgroundColor: const Color(0xFFE5D9F2),
///         primaryColor: Colors.purple,
///         runTest: Efd1100Validator.runTest,
///         runAllTests: Efd1100Validator.runAllTests,
///         getOverallStats: () => OverallStats.fromMap(Efd1100Validator.getOverallStats()),
///         buildExerciseRow: rowLabelValidated,
///         customIcon: Icons.code,
///       ),
///     );
///   }
/// }
/// ```
/// 
/// 2. EFD1200 DateTime:
/// ```dart
/// class Efd1200DatetimeView extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return EfdGenericView(
///       config: EfdModuleConfig(
///         moduleCode: "EFD1200",
///         moduleName: "DateTime",
///         moduleDescription: "Master DateTime operations with validated exercises", 
///         totalExercises: 35,
///         backgroundColor: const Color(0xFFE8DCFF),
///         primaryColor: Colors.purple,
///         runTest: Efd1200Validator.runTest,
///         runAllTests: Efd1200Validator.runAllTests,
///         getOverallStats: () => OverallStats.fromMap(Efd1200Validator.getOverallStats()),
///         buildExerciseRow: rowLabelValidatedEfd1200,
///         customIcon: Icons.access_time,
///       ),
///     );
///   }
/// }
/// ```
/// 
/// Dan seterusnya untuk EFD1300, EFD1400, EFD1500...
/// 
/// BENEFITS:
/// ✅ Code reduction: 380 lines → 50 lines (87% reduction)
/// ✅ Consistency: All modules guaranteed same layout
/// ✅ Maintainability: Update once, all modules updated
/// ✅ Scalability: Easy to add new modules
