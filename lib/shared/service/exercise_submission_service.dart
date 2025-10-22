// 📤 EXERCISE SUBMISSION SERVICE
//
// ════════════════════════════════════════════════════════════════════════════
// Service untuk mengirim hasil pengerjaan exercise ke server
// ════════════════════════════════════════════════════════════════════════════

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/exercise_submission.dart';

/// Service untuk submit exercise results
class ExerciseSubmissionService {
  static const String _baseUrl =
      'https://api.magicbook.com'; // Ganti dengan URL server Anda
  static const String _submitEndpoint = '/api/exercises/submit';

  /// Submit hasil pengerjaan exercise ke server
  static Future<SubmissionResponse> submitExerciseResults({
    required ExerciseSubmissionData submissionData,
    String? authToken,
  }) async {
    try {
      // Prepare headers
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      if (authToken != null) {
        headers['Authorization'] = 'Bearer $authToken';
      }

      // Convert data to JSON
      final jsonData = submissionData.toJson();
      final jsonString = jsonEncode(jsonData);

      // Make HTTP POST request
      final response = await http.post(
        Uri.parse('$_baseUrl$_submitEndpoint'),
        headers: headers,
        body: jsonString,
      );

      // Handle response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        return SubmissionResponse.fromJson(responseData);
      } else {
        // Handle error response
        final errorData = jsonDecode(response.body);
        return SubmissionResponse(
          success: false,
          message:
              errorData['message'] ?? 'Submit failed: ${response.statusCode}',
          submissionId: '',
          processedAt: DateTime.now(),
        );
      }
    } catch (e) {
      // Handle network or parsing errors
      return SubmissionResponse(
        success: false,
        message: 'Network error: $e',
        submissionId: '',
        processedAt: DateTime.now(),
      );
    }
  }

  /// Submit dengan retry mechanism
  static Future<SubmissionResponse> submitWithRetry({
    required ExerciseSubmissionData submissionData,
    String? authToken,
    int maxRetries = 3,
    Duration retryDelay = const Duration(seconds: 2),
  }) async {
    for (int attempt = 1; attempt <= maxRetries; attempt++) {
      try {
        final response = await submitExerciseResults(
          submissionData: submissionData,
          authToken: authToken,
        );

        if (response.success) {
          return response;
        }

        // If not successful and not last attempt, wait and retry
        if (attempt < maxRetries) {
          await Future.delayed(retryDelay);
        }
      } catch (e) {
        if (attempt == maxRetries) {
          return SubmissionResponse(
            success: false,
            message: 'Failed after $maxRetries attempts: $e',
            submissionId: '',
            processedAt: DateTime.now(),
          );
        }
        await Future.delayed(retryDelay);
      }
    }

    return SubmissionResponse(
      success: false,
      message: 'Failed after $maxRetries attempts',
      submissionId: '',
      processedAt: DateTime.now(),
    );
  }

  /// Get submission history untuk student
  static Future<List<ExerciseSubmissionData>> getSubmissionHistory({
    required String studentId,
    String? moduleCode,
    String? authToken,
  }) async {
    try {
      final headers = {
        'Accept': 'application/json',
      };

      if (authToken != null) {
        headers['Authorization'] = 'Bearer $authToken';
      }

      String endpoint = '/api/exercises/history/$studentId';
      if (moduleCode != null) {
        endpoint += '?module=$moduleCode';
      }

      final response = await http.get(
        Uri.parse('$_baseUrl$endpoint'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data
            .map((json) => ExerciseSubmissionData.fromJson(json))
            .toList();
      } else {
        throw Exception(
            'Failed to fetch submission history: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching submission history: $e');
    }
  }
}
