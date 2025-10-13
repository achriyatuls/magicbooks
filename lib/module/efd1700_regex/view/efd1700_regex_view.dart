import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../tests/efd1700_tests.dart';

class Efd1700RegexView extends StatefulWidget {
  const Efd1700RegexView({Key? key}) : super(key: key);

  @override
  State<Efd1700RegexView> createState() => Efd1700RegexController();

  Widget build(context, Efd1700RegexController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: const Color(0xFFE5D4FF),
      appBar: AppBar(
        title: const Text("EFD1700 - Regex"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics_outlined),
            tooltip: 'View Statistics',
            onPressed: () => _showOverallStatsDialogEfd1700(context),
          ),
          IconButton(
            icon: const Icon(Icons.play_arrow),
            tooltip: 'Run All Tests',
            onPressed: () => _showRunAllTestsDialog(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Info Banner
              _buildInfoBanner(),
              const SizedBox(height: 16),

              // Quick Stats
              _buildQuickStatsCard(),
              const SizedBox(height: 16),

              // How to Use
              _buildInstructionsCard(),
              const SizedBox(height: 16),

              // Section Title
              _buildSectionTitle("📝 Exercises"),
              const SizedBox(height: 12),

              // All Exercises
              ...List.generate(
                34,
                (index) => _buildExerciseCard(
                  rowLabelValidatedEfd1700(index + 1),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showOverallStatsDialogEfd1700(context),
        backgroundColor: Colors.purple,
        icon: const Icon(Icons.analytics),
        label: const Text('View Stats'),
      ),
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade400, Colors.purple.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.lightbulb_outline, color: Colors.white, size: 28),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Regular Expression Exercises',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Master regex patterns with validated exercises',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStatsCard() {
    final stats = Efd1700Validator.getOverallStats();
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.speed, color: Colors.purple),
                SizedBox(width: 8),
                Text(
                  'Quick Stats',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  Icons.assignment_outlined,
                  'Total',
                  '${stats['totalExercises']}',
                  Colors.blue,
                ),
                _buildStatItem(
                  Icons.check_circle_outline,
                  'Completed',
                  '${stats['completedExercises']}',
                  Colors.green,
                ),
                _buildStatItem(
                  Icons.grade_outlined,
                  'Grade',
                  stats['grade'].toString().split(' ')[0],
                  Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
      IconData icon, String label, String value, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
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
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildInstructionsCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: const Icon(Icons.help_outline, color: Colors.purple),
        title: const Text(
          'How to Use',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _numberedItem(1, 'Edit code di file efd1700_exercises.dart'),
                _numberedItem(2, 'Tap tombol "Test" untuk validasi jawaban'),
                _numberedItem(3, 'Lihat detail hasil dengan tap icon ℹ️'),
                _numberedItem(4, 'Centang hijau = semua test cases passed ✅'),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.tips_and_updates,
                          color: Colors.purple, size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Tip: Gunakan "Run All Tests" untuk cek semua exercise sekaligus!',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _numberedItem(int number, String text) {
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
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$number',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: child,
      ),
    );
  }

  void _showRunAllTestsDialog(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Running All Tests'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Please wait...'),
          ],
        ),
      ),
    );

    final results = await Efd1700Validator.runAllTests();

    if (context.mounted) {
      Navigator.pop(context);

      final completed = results.where((r) => r.isPerfect).length;
      final total = results.length;

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('All Tests Complete'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Completed: $completed/$total exercises',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(
                value: completed / total,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(
                  completed == total ? Colors.green : Colors.orange,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Success Rate: ${(completed / total * 100).toStringAsFixed(1)}%',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showOverallStatsDialogEfd1700(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              child: const Text('View Details'),
            ),
          ],
        ),
      );
    }
  }

  void _showOverallStatsDialogEfd1700(BuildContext context) {
    final stats = Efd1700Validator.getOverallStats();
    final results = stats['results'] as List<TestResult>;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Overall Statistics',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Summary Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade400, Colors.purple.shade600],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      stats['grade'],
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${stats['completionRate'].toStringAsFixed(1)}% Complete',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Stats Grid
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Exercises',
                      '${stats['completedExercises']}/${stats['totalExercises']}',
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      'Test Cases',
                      '${stats['passedTests']}/${stats['totalTests']}',
                      Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Exercise List
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Exercise Details:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final result = results[index];
                    return ListTile(
                      dense: true,
                      leading: Icon(
                        result.isPerfect ? Icons.check_circle : Icons.cancel,
                        color: result.isPerfect ? Colors.green : Colors.grey,
                        size: 20,
                      ),
                      title: Text(
                        'Exercise ${result.exerciseNumber}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      trailing: Text(
                        '${result.passed}/${result.total}',
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              result.isPerfect ? Colors.green : Colors.orange,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
