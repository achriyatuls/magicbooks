import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/exercise_progress_model.dart';

class ExerciseProgressService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Save exercise progress
  Future<bool> saveExerciseProgress(ExerciseProgress progress) async {
    try {
      await _firestore
          .collection('exercise_progress')
          .doc(progress.id)
          .set(progress.toMap());

      // Update module progress
      await _updateModuleProgress(progress.userId, progress.moduleId);

      return true;
    } catch (e) {
      print('Error saving exercise progress: $e');
      return false;
    }
  }

  // Get exercise progress for specific exercise
  Future<ExerciseProgress?> getExerciseProgress(
      String userId, String exerciseId) async {
    try {
      final querySnapshot = await _firestore
          .collection('exercise_progress')
          .where('userId', isEqualTo: userId)
          .where('exerciseId', isEqualTo: exerciseId)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return ExerciseProgress.fromMap(querySnapshot.docs.first.data());
      }
      return null;
    } catch (e) {
      print('Error getting exercise progress: $e');
      return null;
    }
  }

  // Get all exercise progress for a module
  Future<List<ExerciseProgress>> getModuleProgress(
      String userId, String moduleId) async {
    try {
      final querySnapshot = await _firestore
          .collection('exercise_progress')
          .where('userId', isEqualTo: userId)
          .where('moduleId', isEqualTo: moduleId)
          .get();

      return querySnapshot.docs
          .map((doc) => ExerciseProgress.fromMap(doc.data()))
          .toList();
    } catch (e) {
      print('Error getting module progress: $e');
      return [];
    }
  }

  // Get all user progress
  Future<List<ExerciseProgress>> getAllUserProgress(String userId) async {
    try {
      final querySnapshot = await _firestore
          .collection('exercise_progress')
          .where('userId', isEqualTo: userId)
          .get();

      return querySnapshot.docs
          .map((doc) => ExerciseProgress.fromMap(doc.data()))
          .toList();
    } catch (e) {
      print('Error getting all user progress: $e');
      return [];
    }
  }

  // Update module progress summary
  Future<void> _updateModuleProgress(String userId, String moduleId) async {
    try {
      final moduleProgress = await getModuleProgress(userId, moduleId);

      final completedExercises =
          moduleProgress.where((p) => p.isCompleted).length;
      final totalExercises = moduleProgress.length;
      final completionPercentage = totalExercises > 0
          ? (completedExercises / totalExercises) * 100
          : 0.0;
      final totalScore = moduleProgress.fold(0, (sum, p) => sum + p.score);

      final moduleProgressDoc = ModuleProgress(
        moduleId: moduleId,
        userId: userId,
        totalExercises: totalExercises,
        completedExercises: completedExercises,
        completionPercentage: completionPercentage,
        totalScore: totalScore,
        lastAccessed: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _firestore
          .collection('module_progress')
          .doc('${userId}_$moduleId')
          .set(moduleProgressDoc.toMap());
    } catch (e) {
      print('Error updating module progress: $e');
    }
  }

  // Get module progress summary
  Future<ModuleProgress?> getModuleProgressSummary(
      String userId, String moduleId) async {
    try {
      final doc = await _firestore
          .collection('module_progress')
          .doc('${userId}_$moduleId')
          .get();

      if (doc.exists) {
        return ModuleProgress.fromMap(doc.data()!);
      }
      return null;
    } catch (e) {
      print('Error getting module progress summary: $e');
      return null;
    }
  }

  // Get all module progress summaries for user
  Future<List<ModuleProgress>> getAllModuleProgressSummaries(
      String userId) async {
    try {
      final querySnapshot = await _firestore
          .collection('module_progress')
          .where('userId', isEqualTo: userId)
          .get();

      return querySnapshot.docs
          .map((doc) => ModuleProgress.fromMap(doc.data()))
          .toList();
    } catch (e) {
      print('Error getting all module progress summaries: $e');
      return [];
    }
  }

  // Delete exercise progress
  Future<bool> deleteExerciseProgress(String progressId) async {
    try {
      await _firestore.collection('exercise_progress').doc(progressId).delete();
      return true;
    } catch (e) {
      print('Error deleting exercise progress: $e');
      return false;
    }
  }

  // Mark exercise as completed
  static Future<void> markExerciseCompleted(
      String userId, String exerciseId, int score) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('exercise_progress')
          .doc('${userId}_$exerciseId');

      // Cek apakah sudah ada data
      final doc = await docRef.get();

      if (doc.exists) {
        // Data sudah ada, tidak perlu save lagi
        print('Exercise $exerciseId sudah tersimpan sebelumnya');
        return;
      }

      // Data belum ada, save baru
      final progress = ExerciseProgress(
        id: '${userId}_$exerciseId',
        userId: userId,
        exerciseId: exerciseId,
        moduleId:
            exerciseId.split('_')[0], // Extract module ID from exercise ID
        isCompleted: true,
        score: score,
        completedAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await docRef.set(progress.toMap());
      print('Exercise $exerciseId berhasil tersimpan');
    } catch (e) {
      print('Error marking exercise completed: $e');
      rethrow;
    }
  }

  // Mark multiple exercises as completed (batch write)
  static Future<void> markMultipleExercisesCompleted(
      String userId, List<String> exerciseIds, int score) async {
    try {
      final batch = FirebaseFirestore.instance.batch();
      int newSaves = 0;

      for (String exerciseId in exerciseIds) {
        final docRef = FirebaseFirestore.instance
            .collection('exercise_progress')
            .doc('${userId}_$exerciseId');

        // Cek existing data
        final doc = await docRef.get();

        if (!doc.exists) {
          batch.set(docRef, {
            'id': '${userId}_$exerciseId',
            'userId': userId,
            'exerciseId': exerciseId,
            'moduleId': exerciseId.split('_')[0],
            'isCompleted': true,
            'score': score,
            'completedAt': FieldValue.serverTimestamp(),
            'updatedAt': FieldValue.serverTimestamp(),
          });
          newSaves++;
        }
      }

      if (newSaves > 0) {
        await batch.commit();
        print('$newSaves exercises baru tersimpan dalam batch');
      } else {
        print('Semua exercises sudah tersimpan sebelumnya');
      }
    } catch (e) {
      print('Error batch saving exercises: $e');
      rethrow;
    }
  }

  // Generate unique progress ID
  String generateProgressId(String userId, String exerciseId) {
    return '${userId}_$exerciseId';
  }
}
