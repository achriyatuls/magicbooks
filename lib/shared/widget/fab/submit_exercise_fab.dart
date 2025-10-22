// 📤 SUBMIT EXERCISE FAB
//
// ════════════════════════════════════════════════════════════════════════════
// Modified FAB untuk submit exercise results
// ════════════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../../util/exercise_data_collector.dart';
import '../dialog/submit_exercise_dialog.dart';

/// Modified FAB untuk submit exercise results
class SubmitExerciseFAB extends StatefulWidget {
  final String moduleCode;
  final String moduleName;
  final String studentId;
  final String studentName;
  final Map<int, dynamic> testResults; // Map<int, TestResult>
  final dynamic overallStats; // OverallStats
  final DateTime? startedAt;
  final String? authToken;

  const SubmitExerciseFAB({
    Key? key,
    required this.moduleCode,
    required this.moduleName,
    required this.studentId,
    required this.studentName,
    required this.testResults,
    required this.overallStats,
    this.startedAt,
    this.authToken,
  }) : super(key: key);

  @override
  State<SubmitExerciseFAB> createState() => _SubmitExerciseFABState();
}

class _SubmitExerciseFABState extends State<SubmitExerciseFAB> {
  DateTime? _sessionStartTime;

  @override
  void initState() {
    super.initState();
    _sessionStartTime = widget.startedAt ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: _showSubmitDialog,
      backgroundColor: Colors.blue,
      icon: const Icon(Icons.upload, color: Colors.white),
      label: const Text(
        'Submit Exercise',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  void _showSubmitDialog() {
    // Collect submission data
    final submissionData = ExerciseDataCollector.collectFromValidator(
      moduleCode: widget.moduleCode,
      moduleName: widget.moduleName,
      studentId: widget.studentId,
      studentName: widget.studentName,
      testResults: widget.testResults,
      overallStats: widget.overallStats,
      startedAt: _sessionStartTime!,
      completedAt: DateTime.now(),
    );

    // Show submit dialog
    showDialog(
      context: context,
      builder: (context) => SubmitExerciseDialog(
        submissionData: submissionData,
        authToken: widget.authToken,
      ),
    );
  }
}

/// Helper untuk membuat SubmitExerciseFAB dari EfdModuleConfig
class SubmitExerciseFABHelper {
  /// Buat FAB untuk EFD1100
  static Widget createForEfd1100({
    required String studentId,
    required String studentName,
    DateTime? startedAt,
    String? authToken,
  }) {
    // Import validator (akan di-inject dari luar)
    // final testResults = Efd1100Validator.runAllTests();
    // final overallStats = Efd1100Validator.getOverallStats();

    return SubmitExerciseFAB(
      moduleCode: "EFD1100",
      moduleName: "Variable",
      studentId: studentId,
      studentName: studentName,
      testResults: {}, // Akan diisi dari validator
      overallStats: {}, // Akan diisi dari validator
      startedAt: startedAt,
      authToken: authToken,
    );
  }

  /// Buat FAB untuk EFD1200
  static Widget createForEfd1200({
    required String studentId,
    required String studentName,
    DateTime? startedAt,
    String? authToken,
  }) {
    return SubmitExerciseFAB(
      moduleCode: "EFD1200",
      moduleName: "DateTime",
      studentId: studentId,
      studentName: studentName,
      testResults: {}, // Akan diisi dari validator
      overallStats: {}, // Akan diisi dari validator
      startedAt: startedAt,
      authToken: authToken,
    );
  }

  /// Buat FAB untuk EFD1300
  static Widget createForEfd1300({
    required String studentId,
    required String studentName,
    DateTime? startedAt,
    String? authToken,
  }) {
    return SubmitExerciseFAB(
      moduleCode: "EFD1300",
      moduleName: "String",
      studentId: studentId,
      studentName: studentName,
      testResults: {}, // Akan diisi dari validator
      overallStats: {}, // Akan diisi dari validator
      startedAt: startedAt,
      authToken: authToken,
    );
  }

  /// Buat FAB untuk EFD1400
  static Widget createForEfd1400({
    required String studentId,
    required String studentName,
    DateTime? startedAt,
    String? authToken,
  }) {
    return SubmitExerciseFAB(
      moduleCode: "EFD1400",
      moduleName: "Number",
      studentId: studentId,
      studentName: studentName,
      testResults: {}, // Akan diisi dari validator
      overallStats: {}, // Akan diisi dari validator
      startedAt: startedAt,
      authToken: authToken,
    );
  }

  /// Buat FAB untuk EFD1500
  static Widget createForEfd1500({
    required String studentId,
    required String studentName,
    DateTime? startedAt,
    String? authToken,
  }) {
    return SubmitExerciseFAB(
      moduleCode: "EFD1500",
      moduleName: "IF Statement",
      studentId: studentId,
      studentName: studentName,
      testResults: {}, // Akan diisi dari validator
      overallStats: {}, // Akan diisi dari validator
      startedAt: startedAt,
      authToken: authToken,
    );
  }

  /// Buat FAB untuk EFD1600
  static Widget createForEfd1600({
    required String studentId,
    required String studentName,
    DateTime? startedAt,
    String? authToken,
  }) {
    return SubmitExerciseFAB(
      moduleCode: "EFD1600",
      moduleName: "List & Map",
      studentId: studentId,
      studentName: studentName,
      testResults: {}, // Akan diisi dari validator
      overallStats: {}, // Akan diisi dari validator
      startedAt: startedAt,
      authToken: authToken,
    );
  }

  /// Buat FAB untuk EFD1700
  static Widget createForEfd1700({
    required String studentId,
    required String studentName,
    DateTime? startedAt,
    String? authToken,
  }) {
    return SubmitExerciseFAB(
      moduleCode: "EFD1700",
      moduleName: "Regex",
      studentId: studentId,
      studentName: studentName,
      testResults: {}, // Akan diisi dari validator
      overallStats: {}, // Akan diisi dari validator
      startedAt: startedAt,
      authToken: authToken,
    );
  }

  /// Buat FAB untuk EFD1800
  static Widget createForEfd1800({
    required String studentId,
    required String studentName,
    DateTime? startedAt,
    String? authToken,
  }) {
    return SubmitExerciseFAB(
      moduleCode: "EFD1800",
      moduleName: "Async Function",
      studentId: studentId,
      studentName: studentName,
      testResults: {}, // Akan diisi dari validator
      overallStats: {}, // Akan diisi dari validator
      startedAt: startedAt,
      authToken: authToken,
    );
  }
}
