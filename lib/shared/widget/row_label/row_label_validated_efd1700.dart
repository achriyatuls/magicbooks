import 'package:flutter/material.dart';
import 'package:magicbook/module/efd1700_regex/validator/efd1700_validator.dart';
import 'package:magicbook/module/efd1700_regex/tests/efd1700_tests.dart';

Widget rowLabelValidatedEfd1700(int exerciseNumber) {
  return _Efd1700ExerciseRow(exerciseNumber: exerciseNumber);
}

class _Efd1700ExerciseRow extends StatefulWidget {
  final int exerciseNumber;

  const _Efd1700ExerciseRow({
    required this.exerciseNumber,
  });

  @override
  State<_Efd1700ExerciseRow> createState() => _Efd1700ExerciseRowState();
}

class _Efd1700ExerciseRowState extends State<_Efd1700ExerciseRow> {
  TestResult? _testResult;
  bool _isLoading = false;

  void _runTest() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 100));

    try {
      final result = Efd1700Validator.runTest(widget.exerciseNumber);
      setState(() {
        _testResult = result;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  void _showDetailedResults() {
    if (_testResult == null) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          _testResult!.exerciseName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Score Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _testResult!.isPerfect
                      ? Colors.green.shade50
                      : Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color:
                        _testResult!.isPerfect ? Colors.green : Colors.orange,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Score:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          '${_testResult!.passed}/${_testResult!.total}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: _testResult!.isPerfect
                                ? Colors.green
                                : Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: _testResult!.percentage / 100,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _testResult!.isPerfect ? Colors.green : Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${_testResult!.percentage.toStringAsFixed(1)}%',
                          style: const TextStyle(fontSize: 12),
                        ),
                        Text(
                          _testResult!.grade,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Errors
              if (_testResult!.errors.isNotEmpty) ...[
                const Text(
                  'Errors:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 8),
                ..._testResult!.errors.map(
                  (error) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      error,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],

              // Hints
              if (_testResult!.hints.isNotEmpty) ...[
                const Text(
                  '💡 Hints:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 8),
                ..._testResult!.hints.map(
                  (hint) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      hint,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],

              // Perfect message
              if (_testResult!.isPerfect) ...[
                const SizedBox(height: 12),
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
                          'Perfect! All test cases passed! 🎉',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          if (!_testResult!.isPerfect)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _runTest();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              child: const Text('Retry'),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Status Icon
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _testResult?.isPerfect == true
                ? Colors.green.shade100
                : Colors.grey.shade200,
          ),
          child: _isLoading
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Icon(
                  _testResult?.isPerfect == true
                      ? Icons.check_circle
                      : Icons.circle_outlined,
                  color: _testResult?.isPerfect == true
                      ? Colors.green
                      : Colors.grey,
                  size: 24,
                ),
        ),
        const SizedBox(width: 12),

        // Exercise Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Exercise ${widget.exerciseNumber}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              if (_testResult != null) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      _testResult!.isPerfect
                          ? Icons.check_circle
                          : Icons.warning,
                      size: 14,
                      color:
                          _testResult!.isPerfect ? Colors.green : Colors.orange,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${_testResult!.passed}/${_testResult!.total} passed',
                      style: TextStyle(
                        fontSize: 12,
                        color: _testResult!.isPerfect
                            ? Colors.green
                            : Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),

        // Action Buttons
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_testResult != null)
              IconButton(
                onPressed: _showDetailedResults,
                icon: const Icon(Icons.info_outline),
                tooltip: 'View Details',
                iconSize: 20,
                color: Colors.blue,
              ),
            ElevatedButton(
              onPressed: _isLoading ? null : _runTest,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade300,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: Text(_testResult == null ? 'Test' : 'Retest'),
            ),
          ],
        ),
      ],
    );
  }
}
