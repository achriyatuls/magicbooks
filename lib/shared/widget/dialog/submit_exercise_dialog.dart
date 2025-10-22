// 📤 SUBMIT EXERCISE DIALOG
//
// ════════════════════════════════════════════════════════════════════════════
// Dialog untuk konfirmasi submit exercise results
// ════════════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../../model/exercise_submission.dart';
import '../../service/exercise_submission_service.dart';

/// Dialog untuk konfirmasi submit exercise
class SubmitExerciseDialog extends StatefulWidget {
  final ExerciseSubmissionData submissionData;
  final String? authToken;

  const SubmitExerciseDialog({
    Key? key,
    required this.submissionData,
    this.authToken,
  }) : super(key: key);

  @override
  State<SubmitExerciseDialog> createState() => _SubmitExerciseDialogState();
}

class _SubmitExerciseDialogState extends State<SubmitExerciseDialog> {
  bool _isSubmitting = false;
  SubmissionResponse? _response;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(
            Icons.upload,
            color: Colors.blue,
            size: 28,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Submit Exercise Results',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Module Info
            _buildModuleInfo(),
            SizedBox(height: 16),

            // Summary Stats
            _buildSummaryStats(),
            SizedBox(height: 16),

            // Exercise Results Preview
            _buildExerciseResultsPreview(),
            SizedBox(height: 16),

            // Response (if submitted)
            if (_response != null) _buildResponse(),
          ],
        ),
      ),
      actions: [
        if (!_isSubmitting && _response == null) ...[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: _submitResults,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: Text('Submit'),
          ),
        ],
        if (_response != null)
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
      ],
    );
  }

  Widget _buildModuleInfo() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Module Information',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text('Code: ', style: TextStyle(fontWeight: FontWeight.w500)),
              Text(widget.submissionData.moduleCode),
            ],
          ),
          Row(
            children: [
              Text('Name: ', style: TextStyle(fontWeight: FontWeight.w500)),
              Text(widget.submissionData.moduleName),
            ],
          ),
          Row(
            children: [
              Text('Student: ', style: TextStyle(fontWeight: FontWeight.w500)),
              Text(widget.submissionData.studentName),
            ],
          ),
          Row(
            children: [
              Text('Submitted: ',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              Text(widget.submissionData.submissionTime
                  .toString()
                  .substring(0, 19)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryStats() {
    final summary = widget.submissionData.moduleSummary;
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Summary Statistics',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Perfect Exercises:'),
              Text('${summary.perfectExercises}/${summary.totalExercises}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Passed Tests:'),
              Text('${summary.passedTests}/${summary.totalTests}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Exercise Percentage:'),
              Text('${summary.exercisePercentage.toStringAsFixed(1)}%'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Test Percentage:'),
              Text('${summary.testPercentage.toStringAsFixed(1)}%'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Overall Grade:'),
              Text(
                summary.overallGrade,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _getGradeColor(summary.overallGrade),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Time Spent:'),
              Text('${summary.timeSpentMinutes} minutes'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseResultsPreview() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Exercise Results Preview',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
              'Total Exercises: ${widget.submissionData.exerciseResults.length}'),
          SizedBox(height: 4),
          Text(
              'Perfect: ${widget.submissionData.moduleSummary.perfectExercises}'),
          SizedBox(height: 4),
          Text(
              'Partial: ${widget.submissionData.moduleSummary.partialExercises}'),
          SizedBox(height: 4),
          Text(
              'Failed: ${widget.submissionData.moduleSummary.failedExercises}'),
        ],
      ),
    );
  }

  Widget _buildResponse() {
    final isSuccess = _response!.success;
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSuccess ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSuccess ? Colors.green.shade200 : Colors.red.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isSuccess ? Icons.check_circle : Icons.error,
                color: isSuccess ? Colors.green : Colors.red,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                isSuccess ? 'Submission Successful!' : 'Submission Failed',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: isSuccess ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(_response!.message),
          if (_response!.submissionId.isNotEmpty) ...[
            SizedBox(height: 4),
            Text('Submission ID: ${_response!.submissionId}'),
          ],
        ],
      ),
    );
  }

  Color _getGradeColor(String grade) {
    if (grade.contains('A+') || grade.contains('A')) return Colors.green;
    if (grade.contains('B')) return Colors.blue;
    if (grade.contains('C')) return Colors.orange;
    if (grade.contains('D')) return Colors.deepOrange;
    return Colors.red;
  }

  Future<void> _submitResults() async {
    setState(() {
      _isSubmitting = true;
    });

    try {
      final response = await ExerciseSubmissionService.submitWithRetry(
        submissionData: widget.submissionData,
        authToken: widget.authToken,
        maxRetries: 3,
      );

      setState(() {
        _response = response;
        _isSubmitting = false;
      });
    } catch (e) {
      setState(() {
        _response = SubmissionResponse(
          success: false,
          message: 'Error: $e',
          submissionId: '',
          processedAt: DateTime.now(),
        );
        _isSubmitting = false;
      });
    }
  }
}
