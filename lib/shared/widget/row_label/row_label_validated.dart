import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../state_util.dart';
import '../../../module/efd1100_variable/validator/efd1100_validator.dart';
import '../../../module/efd1100_variable/tests/efd1100_tests.dart';

/// Widget untuk menampilkan exercise dengan validasi test
Widget rowLabelValidated(int exerciseNumber) {
  TestResult result = Efd1100Validator.runTest(exerciseNumber);

  return InkWell(
    onTap: () {
      showTestResultDialog(result);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result.exerciseName,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      "${result.passed}/${result.total} tests",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: result.isPerfect ? Colors.green : Colors.orange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: result.isPerfect
                            ? Colors.green.shade50
                            : (result.passed > 0
                                ? Colors.orange.shade50
                                : Colors.red.shade50),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: result.isPerfect
                              ? Colors.green
                              : (result.passed > 0
                                  ? Colors.orange
                                  : Colors.red),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "${result.percentage.toStringAsFixed(0)}%",
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: result.isPerfect
                              ? Colors.green.shade700
                              : (result.passed > 0
                                  ? Colors.orange.shade700
                                  : Colors.red.shade700),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.purple.shade50,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Colors.purple,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        result.grade,
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _buildStatusIcon(result),
        ],
      ),
    ),
  );
}

/// Build icon berdasarkan status test
Widget _buildStatusIcon(TestResult result) {
  if (result.isPerfect) {
    return const Icon(
      Icons.check_circle,
      color: Colors.green,
      size: 36.0,
    );
  } else if (result.passed > 0) {
    // Partial success
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.circle_outlined,
          color: Colors.orange,
          size: 36.0,
        ),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange.withOpacity(0.1),
          ),
          child: Center(
            child: Icon(
              MdiIcons.alert,
              color: Colors.orange,
              size: 20.0,
            ),
          ),
        ),
      ],
    );
  } else {
    // Failed
    return const Icon(
      Icons.cancel,
      color: Colors.red,
      size: 36.0,
    );
  }
}

/// Show dialog dengan detail test result
void showTestResultDialog(TestResult result) {
  showDialog(
    context: Get.currentContext,
    builder: (context) => AlertDialog(
      title: Row(
        children: [
          Icon(
            result.isPerfect
                ? Icons.celebration
                : (result.passed > 0 ? Icons.info : Icons.error),
            color: result.isPerfect
                ? Colors.green
                : (result.passed > 0 ? Colors.orange : Colors.red),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              result.exerciseName,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Summary Card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: result.isPerfect
                    ? Colors.green.shade50
                    : (result.passed > 0
                        ? Colors.orange.shade50
                        : Colors.red.shade50),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: result.isPerfect
                      ? Colors.green
                      : (result.passed > 0 ? Colors.orange : Colors.red),
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Test Results:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "${result.passed}/${result.total}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:
                              result.isPerfect ? Colors.green : Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Percentage:"),
                      Text(
                        "${result.percentage.toStringAsFixed(1)}%",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Grade:"),
                      Text(
                        result.grade,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Success Message atau Errors
            if (result.isPerfect) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.celebration, color: Colors.green),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "🎉 Sempurna! Semua test passed!",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              // Errors Section
              if (result.errors.isNotEmpty) ...[
                const Text(
                  "❌ Failed Tests:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: result.errors
                        .map((error) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                error,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 12),
              ],

              // Hints Section
              if (result.hints.isNotEmpty) ...[
                const Text(
                  "💡 Hints:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: result.hints
                        .map((hint) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                hint,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ],

            // XP Earned
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.stars, color: Colors.purple, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    "XP Earned: ${result.passed * 10} / ${result.total * 10}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        if (!result.isPerfect)
          TextButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.code),
            label: const Text("Fix Code"),
            style: TextButton.styleFrom(foregroundColor: Colors.orange),
          ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(result.isPerfect ? "Awesome!" : "OK"),
          style: TextButton.styleFrom(
            foregroundColor: result.isPerfect ? Colors.green : Colors.grey,
          ),
        ),
      ],
    ),
  );
}

/// Show overall stats dialog
void showOverallStatsDialog(OverallStats stats) {
  showDialog(
    context: Get.currentContext,
    builder: (context) => AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.analytics, color: Colors.purple),
          SizedBox(width: 8),
          Text("Overall Statistics"),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Overall Grade
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
                  const Text(
                    "Overall Grade",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    stats.overallGrade,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${stats.testPercentage.toStringAsFixed(1)}%",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Exercises Stats
            _buildStatRow(
                "Total Exercises", "${stats.totalExercises}", Icons.list_alt),
            _buildStatRow("Perfect Exercises", "${stats.perfectExercises}",
                Icons.check_circle, Colors.green),
            _buildStatRow("Partial Exercises", "${stats.partialExercises}",
                Icons.pending, Colors.orange),
            _buildStatRow("Failed Exercises", "${stats.failedExercises}",
                Icons.cancel, Colors.red),

            const Divider(height: 24),

            // Tests Stats
            _buildStatRow(
                "Total Tests", "${stats.totalTests}", Icons.assignment),
            _buildStatRow("Passed Tests", "${stats.passedTests}", Icons.check,
                Colors.green),

            const Divider(height: 24),

            // XP Stats
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.stars, color: Colors.amber),
                      SizedBox(width: 8),
                      Text(
                        "Total XP Earned",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    "${stats.xpEarned} / ${stats.totalXp}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            // Achievements
            if (stats.achievements.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text(
                "🏆 Achievements Earned:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              ...stats.achievements.map((achievement) => Container(
                    margin: const EdgeInsets.only(bottom: 4),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(achievement),
                  )),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Close"),
        ),
      ],
    ),
  );
}

Widget _buildStatRow(String label, String value, IconData icon,
    [Color? color]) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: color ?? Colors.grey),
            const SizedBox(width: 8),
            Text(label),
          ],
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    ),
  );
}
