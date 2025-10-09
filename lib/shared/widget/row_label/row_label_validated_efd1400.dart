import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../state_util.dart';
import '../../../module/efd1400_number/validator/efd1400_validator.dart';
import '../../../module/efd1400_number/tests/efd1400_tests.dart';

Widget rowLabelValidatedEfd1400(int exerciseNumber) {
  TestResult result = Efd1400Validator.runTest(exerciseNumber);

  return InkWell(
    onTap: () => showTestResultDialogEfd1400(result),
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
                      fontSize: 14.0, fontWeight: FontWeight.bold),
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
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _buildStatusIconEfd1400(result),
        ],
      ),
    ),
  );
}

Widget _buildStatusIconEfd1400(TestResult result) {
  if (result.isPerfect) {
    return const Icon(Icons.check_circle, color: Colors.green, size: 36.0);
  } else if (result.passed > 0) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.circle_outlined, color: Colors.orange, size: 36.0),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.orange.withOpacity(0.1)),
          child: Center(
              child: Icon(MdiIcons.alert, color: Colors.orange, size: 20.0)),
        ),
      ],
    );
  } else {
    return const Icon(Icons.cancel, color: Colors.red, size: 36.0);
  }
}

void showTestResultDialogEfd1400(TestResult result) {
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
              child: Text(result.exerciseName,
                  style: const TextStyle(fontSize: 18))),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Test Result:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(
                    "${result.passed}/${result.total} (${result.percentage.toStringAsFixed(0)}%)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: result.isPerfect ? Colors.green : Colors.orange,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            if (result.errors.isNotEmpty) ...[
              const Text("❌ Errors:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
              const SizedBox(height: 6),
              ...result.errors.map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(e, style: const TextStyle(fontSize: 12)),
                  )),
            ],
            if (result.hints.isNotEmpty) ...[
              const SizedBox(height: 12),
              const Text("💡 Hints:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue)),
              const SizedBox(height: 6),
              ...result.hints.map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(e, style: const TextStyle(fontSize: 12)),
                  )),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text("OK")),
      ],
    ),
  );
}
