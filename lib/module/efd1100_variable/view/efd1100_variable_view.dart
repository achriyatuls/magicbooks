import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../../../shared/widget/row_label/row_label_validated.dart';

/// 🎓 EFD1100 Variable View - DENGAN SISTEM VALIDASI
///
/// Sistem Baru:
/// - Anti-curang: Multiple test cases per exercise
/// - Feedback lebih baik: Siswa tahu error di mana
/// - Grading objektif: A-F berdasarkan test pass rate
/// - Gamifikasi: XP, achievements, progress tracking

class Efd1100VariableView extends StatefulWidget {
  const Efd1100VariableView({Key? key}) : super(key: key);

  Widget build(context, Efd1100VariableController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: const Color(0xFFE5D9F2),
      appBar: AppBar(
        title: const Text("FbkDartVariable"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          // Tombol untuk lihat overall stats
          IconButton(
            icon: const Icon(Icons.analytics),
            tooltip: "View Statistics",
            onPressed: () {
              OverallStats stats = Efd1100Validator.getOverallStats();
              showOverallStatsDialog(stats);
            },
          ),
          // Tombol untuk run all tests
          IconButton(
            icon: const Icon(Icons.play_arrow),
            tooltip: "Run All Tests",
            onPressed: () {
              _showRunAllTestsDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Info Banner
              _buildInfoBanner(),
              const SizedBox(height: 16),

              // Quick Stats Card
              _buildQuickStatsCard(),
              const SizedBox(height: 16),

              // Instructions (moved just below Quick Stats)
              _buildInstructionsCard(),
              const SizedBox(height: 16),

              // Exercise List
              _buildSectionTitle("📝 Exercise List (35 Exercises)"),
              const SizedBox(height: 8),
              _buildExerciseCard(rowLabelValidated(1)),
              _buildExerciseCard(rowLabelValidated(2)),
              _buildExerciseCard(rowLabelValidated(3)),
              _buildExerciseCard(rowLabelValidated(4)),
              _buildExerciseCard(rowLabelValidated(5)),
              _buildExerciseCard(rowLabelValidated(6)),
              _buildExerciseCard(rowLabelValidated(7)),
              _buildExerciseCard(rowLabelValidated(8)),
              _buildExerciseCard(rowLabelValidated(9)),
              _buildExerciseCard(rowLabelValidated(10)),
              _buildExerciseCard(rowLabelValidated(11)),
              _buildExerciseCard(rowLabelValidated(12)),
              _buildExerciseCard(rowLabelValidated(13)),
              _buildExerciseCard(rowLabelValidated(14)),
              _buildExerciseCard(rowLabelValidated(15)),
              _buildExerciseCard(rowLabelValidated(16)),
              _buildExerciseCard(rowLabelValidated(17)),
              _buildExerciseCard(rowLabelValidated(18)),
              _buildExerciseCard(rowLabelValidated(19)),
              _buildExerciseCard(rowLabelValidated(20)),
              _buildExerciseCard(rowLabelValidated(21)),
              _buildExerciseCard(rowLabelValidated(22)),
              _buildExerciseCard(rowLabelValidated(23)),
              _buildExerciseCard(rowLabelValidated(24)),
              _buildExerciseCard(rowLabelValidated(25)),
              _buildExerciseCard(rowLabelValidated(26)),
              _buildExerciseCard(rowLabelValidated(27)),
              _buildExerciseCard(rowLabelValidated(28)),
              _buildExerciseCard(rowLabelValidated(29)),
              _buildExerciseCard(rowLabelValidated(30)),
              _buildExerciseCard(rowLabelValidated(31)),
              _buildExerciseCard(rowLabelValidated(32)),
              _buildExerciseCard(rowLabelValidated(33)),
              _buildExerciseCard(rowLabelValidated(34)),
              _buildExerciseCard(rowLabelValidated(35)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          OverallStats stats = Efd1100Validator.getOverallStats();
          showOverallStatsDialog(stats);
        },
        icon: const Icon(Icons.assessment),
        label: const Text("View Stats"),
        backgroundColor: Colors.purple,
      ),
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade400, Colors.purple.shade400],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.info_outline, color: Colors.white),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "Sistem Validasi Aktif! Tap exercise untuk melihat detail test results.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStatsCard() {
    OverallStats stats = Efd1100Validator.getOverallStats();

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Quick Stats",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    stats.overallGrade,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    "Perfect",
                    "${stats.perfectExercises}",
                    Colors.green,
                    Icons.check_circle,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    "Partial",
                    "${stats.partialExercises}",
                    Colors.orange,
                    Icons.pending,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    "Failed",
                    "${stats.failedExercises}",
                    Colors.red,
                    Icons.cancel,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Progress Bar
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Overall Progress",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "${stats.testPercentage.toStringAsFixed(1)}%",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: stats.testPercentage / 100,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    stats.testPercentage >= 70 ? Colors.green : Colors.orange,
                  ),
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
      String label, String value, Color color, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildExerciseCard(Widget child) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: child,
      ),
    );
  }

  Widget _buildInstructionsCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.school, color: Colors.purple),
                SizedBox(width: 8),
                Text(
                  "How to Use",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildInstructionItem("1",
                "Open file: lib/module/efd1100_variable/exercises/efd1100_exercises.dart"),
            _buildInstructionItem(
                "2", "Write your code in the designated area"),
            _buildInstructionItem("3", "Save the file and come back here"),
            _buildInstructionItem("4", "Tap on exercise to see test results"),
            _buildInstructionItem("5", "Fix errors based on feedback"),
            _buildInstructionItem(
                "6", "Get green checkmark when all tests pass!"),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange),
              ),
              child: const Row(
                children: [
                  Icon(Icons.warning, color: Colors.orange, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Tip: You CANNOT cheat by just returning true. Multiple test cases validate your logic!",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionItem(String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  void _showRunAllTestsDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 16),
            Text("Running Tests..."),
          ],
        ),
        content: const Text("Please wait while we validate all exercises."),
      ),
    );

    // Simulate async test running
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context);
      OverallStats stats = Efd1100Validator.getOverallStats();
      showOverallStatsDialog(stats);
    });
  }

  @override
  State<Efd1100VariableView> createState() => Efd1100VariableController();
}
