import 'package:flutter/material.dart';
import '../../model/efd_config.dart';
import 'efd_widgets.dart';

/// Reusable dialogs untuk semua EFD modules
/// Menggantikan duplicated dialog methods di setiap module
class EfdDialogs {
  /// Run All Tests Dialog - Shows progress and results
  static Future<void> showRunAllTests(
    BuildContext context,
    EfdModuleConfig config,
  ) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Running All Tests'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Please wait...'),
          ],
        ),
      ),
    );

    // Run tests
    final results = await config.runAllTests();

    if (context.mounted) {
      // Close loading dialog
      Navigator.pop(context);

      final completed = results.where((r) => r.isPerfect).length;
      final total = results.length;

      // Show results dialog
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
                value: total > 0 ? completed / total : 0,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(
                  completed == total ? Colors.green : Colors.orange,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Success Rate: ${total > 0 ? (completed / total * 100).toStringAsFixed(1) : 0}%',
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
                showOverallStats(context, config);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: config.primaryColor,
                foregroundColor: Colors.white,
              ),
              child: const Text('View Details'),
            ),
          ],
        ),
      );
    }
  }

  /// Overall Statistics Dialog - Detailed stats view
  static void showOverallStats(
    BuildContext context,
    EfdModuleConfig config,
  ) {
    final stats = config.getOverallStats();

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
              // Summary Card with gradient
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      config.primaryColor.withValues(alpha: 0.8),
                      config.primaryColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      stats.grade,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${stats.completionRate.toStringAsFixed(1)}% Complete',
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
                    child: EfdWidgets.buildStatCard(
                      'Exercises',
                      '${stats.completedExercises}/${stats.totalExercises}',
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: EfdWidgets.buildStatCard(
                      'Test Cases',
                      '${stats.passedTests}/${stats.totalTests}',
                      Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Exercise Details List
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Exercise Details:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),

              // Exercise List
              Flexible(
                child: SizedBox(
                  height: 200, // Fixed height untuk scrollable list
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: stats.results.length,
                    itemBuilder: (context, index) {
                      final result = stats.results[index];
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

  /// Simple Success Dialog - For quick feedback
  static void showSuccess(
    BuildContext context,
    String title,
    String message, {
    Color? color,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: color ?? Colors.green,
            ),
            const SizedBox(width: 8),
            Text(title),
          ],
        ),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: color ?? Colors.green,
              foregroundColor: Colors.white,
            ),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Simple Error Dialog - For error feedback
  static void showError(
    BuildContext context,
    String title,
    String message, {
    Color? color,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              Icons.error,
              color: color ?? Colors.red,
            ),
            const SizedBox(width: 8),
            Text(title),
          ],
        ),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: color ?? Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
