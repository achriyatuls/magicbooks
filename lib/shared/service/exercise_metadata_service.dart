import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/exercise_metadata_model.dart';

/// Service untuk mengelola metadata exercise dari Firestore
/// Metadata berisi: title, description, instructions, hint, example, difficulty, isValidated
/// Kode exercise tetap di local file Dart
class ExerciseMetadataService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Load metadata untuk semua exercise dalam sebuah module
  /// Collection: exercise_metadata
  /// Document: {moduleId}
  /// Field: exercises (array of ExerciseMetadata)
  Future<List<ExerciseMetadata>> getModuleExerciseMetadata(
      String moduleId) async {
    try {
      final doc = await _firestore
          .collection('exercise_metadata')
          .doc(moduleId)
          .get();

      if (!doc.exists) {
        print('⚠️ No metadata found in Firestore for module: $moduleId');
        return [];
      }

      final data = doc.data();
      if (data == null || !data.containsKey('exercises')) {
        print('⚠️ No exercises array found in metadata for module: $moduleId');
        return [];
      }

      final exercisesList = data['exercises'] as List;
      final exercises = exercisesList
          .map((e) => ExerciseMetadata.fromMap(e as Map<String, dynamic>))
          .toList();

      print('✅ Loaded ${exercises.length} exercise metadata from Firestore for $moduleId');
      return exercises;
    } catch (e) {
      print('❌ Error loading exercise metadata from Firestore: $e');
      return [];
    }
  }

  /// Load metadata untuk satu exercise
  /// Menggunakan subcollection untuk performa lebih baik
  Future<ExerciseMetadata?> getExerciseMetadata(
      String moduleId, String exerciseId) async {
    try {
      final doc = await _firestore
          .collection('exercise_metadata')
          .doc(moduleId)
          .collection('exercises')
          .doc(exerciseId)
          .get();

      if (!doc.exists) {
        return null;
      }

      return ExerciseMetadata.fromMap(doc.data()!);
    } catch (e) {
      print('❌ Error loading exercise metadata: $e');
      return null;
    }
  }

  /// Save metadata untuk semua exercise dalam sebuah module
  /// Digunakan oleh admin untuk update metadata
  Future<bool> saveModuleExerciseMetadata(
      String moduleId, List<ExerciseMetadata> exercises) async {
    try {
      final exercisesMap = exercises.map((e) => e.toMap()).toList();

      await _firestore.collection('exercise_metadata').doc(moduleId).set({
        'moduleId': moduleId,
        'exercises': exercisesMap,
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      print('✅ Saved ${exercises.length} exercise metadata to Firestore for $moduleId');
      return true;
    } catch (e) {
      print('❌ Error saving exercise metadata to Firestore: $e');
      return false;
    }
  }

  /// Save metadata untuk satu exercise (menggunakan subcollection)
  Future<bool> saveExerciseMetadata(ExerciseMetadata metadata) async {
    try {
      await _firestore
          .collection('exercise_metadata')
          .doc(metadata.moduleId)
          .collection('exercises')
          .doc(metadata.id)
          .set(metadata.toMap());

      print('✅ Saved exercise metadata: ${metadata.id}');
      return true;
    } catch (e) {
      print('❌ Error saving exercise metadata: $e');
      return false;
    }
  }

  /// Check if metadata exists for a module
  Future<bool> hasModuleMetadata(String moduleId) async {
    try {
      final doc = await _firestore
          .collection('exercise_metadata')
          .doc(moduleId)
          .get();
      return doc.exists;
    } catch (e) {
      print('❌ Error checking module metadata: $e');
      return false;
    }
  }

  /// Stream untuk listen perubahan metadata (real-time updates)
  Stream<List<ExerciseMetadata>> watchModuleExerciseMetadata(
      String moduleId) {
    return _firestore
        .collection('exercise_metadata')
        .doc(moduleId)
        .snapshots()
        .map((snapshot) {
      if (!snapshot.exists) {
        return [];
      }

      final data = snapshot.data();
      if (data == null || !data.containsKey('exercises')) {
        return [];
      }

      final exercisesList = data['exercises'] as List;
      return exercisesList
          .map((e) => ExerciseMetadata.fromMap(e as Map<String, dynamic>))
          .toList();
    });
  }
}

