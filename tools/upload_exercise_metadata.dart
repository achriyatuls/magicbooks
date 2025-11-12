/// Script untuk upload exercise metadata ke Firestore
/// 
/// Usage:
/// ```bash
/// dart run tools/upload_exercise_metadata.dart --module EFD1100 --file assets/exercises/efd1100_exercises.json
/// ```
/// 
/// Atau untuk upload dari hardcoded data:
/// ```bash
/// dart run tools/upload_exercise_metadata.dart --module EFD1100 --from-hardcoded
/// ```

import 'dart:io';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

// Import firebase options
import '../lib/firebase_options.dart';

void main(List<String> args) async {
  // Parse arguments
  String? moduleId;
  String? filePath;
  bool fromHardcoded = false;

  for (int i = 0; i < args.length; i++) {
    if (args[i] == '--module' && i + 1 < args.length) {
      moduleId = args[i + 1];
    } else if (args[i] == '--file' && i + 1 < args.length) {
      filePath = args[i + 1];
    } else if (args[i] == '--from-hardcoded') {
      fromHardcoded = true;
    }
  }

  if (moduleId == null) {
    print('❌ Error: --module is required');
    print('Usage: dart run tools/upload_exercise_metadata.dart --module EFD1100 --file path/to/file.json');
    exit(1);
  }

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final firestore = FirebaseFirestore.instance;

  try {
    List<Map<String, dynamic>> exercises = [];

    if (fromHardcoded) {
      // Load from hardcoded data (untuk development)
      print('ℹ️ Loading from hardcoded data...');
      exercises = _getHardcodedExercises(moduleId);
    } else if (filePath != null) {
      // Load from JSON file
      print('ℹ️ Loading from file: $filePath');
      final file = File(filePath);
      if (!await file.exists()) {
        print('❌ Error: File not found: $filePath');
        exit(1);
      }

      final jsonString = await file.readAsString();
      final jsonData = json.decode(jsonString) as Map<String, dynamic>;
      exercises = List<Map<String, dynamic>>.from(jsonData['exercises'] ?? []);
    } else {
      print('❌ Error: Either --file or --from-hardcoded is required');
      exit(1);
    }

    if (exercises.isEmpty) {
      print('❌ Error: No exercises found');
      exit(1);
    }

    // Convert to ExerciseMetadata format
    final metadataList = exercises.map((e) {
      return {
        'id': e['id'] ?? '${moduleId}_ex${e['number']}',
        'moduleId': moduleId,
        'number': e['number'] ?? 0,
        'title': e['title'] ?? '',
        'description': e['description'] ?? '',
        'instructions': e['instructions'] ?? '',
        'difficulty': e['difficulty'] ?? 'Easy',
        'isValidated': e['isValidated'] ?? false,
        'hint': e['hint'],
        'example': e['example'],
        'updatedAt': FieldValue.serverTimestamp(),
      };
    }).toList();

    // Upload to Firestore
    print('📤 Uploading ${metadataList.length} exercises to Firestore...');
    await firestore.collection('exercise_metadata').doc(moduleId).set({
      'moduleId': moduleId,
      'exercises': metadataList,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    print('✅ Successfully uploaded ${metadataList.length} exercises to Firestore!');
    print('   Collection: exercise_metadata');
    print('   Document: $moduleId');
  } catch (e) {
    print('❌ Error: $e');
    exit(1);
  }
}

/// Get hardcoded exercises (untuk development/testing)
List<Map<String, dynamic>> _getHardcodedExercises(String moduleId) {
  // Contoh untuk EFD1100
  if (moduleId == 'EFD1100') {
    return [
      {
        'id': 'EFD1100_ex1',
        'number': 1,
        'title': 'Type Check',
        'description': 'Buat variabel price bertipe String dan isi nilainya',
        'instructions': 'Buat variabel price bertipe String dan isi nilainya. Pastikan TIDAK menggunakan tipe int tanpa quotes (contoh: 100). Contoh benar: "100" (String)',
        'difficulty': 'Easy',
        'isValidated': false,
        'hint': 'Gunakan String? price = "100";',
      },
      {
        'id': 'EFD1100_ex2',
        'number': 2,
        'title': 'Konversi String ke Double',
        'description': 'Ubah parameter text (String) menjadi double, dan return hasilnya',
        'instructions': 'Ubah parameter text (String) menjadi double, dan return hasilnya. Gunakan double.parse()',
        'difficulty': 'Easy',
        'isValidated': true,
        'hint': 'Gunakan double.parse(text)',
        'example': 'Input: "100.24" Output: 100.24 (double)',
      },
      // Add more exercises...
    ];
  }

  return [];
}

