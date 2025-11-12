import 'package:cloud_firestore/cloud_firestore.dart';

/// Model untuk metadata exercise yang disimpan di Firestore
class ExerciseMetadata {
  final String id;
  final String moduleId;
  final int number;
  final String title;
  final String description;
  final String instructions;
  final String difficulty;
  final bool isValidated;
  final String? hint;
  final String? example;
  final DateTime? updatedAt;

  ExerciseMetadata({
    required this.id,
    required this.moduleId,
    required this.number,
    required this.title,
    required this.description,
    required this.instructions,
    required this.difficulty,
    required this.isValidated,
    this.hint,
    this.example,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'moduleId': moduleId,
      'number': number,
      'title': title,
      'description': description,
      'instructions': instructions,
      'difficulty': difficulty,
      'isValidated': isValidated,
      'hint': hint,
      'example': example,
      'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
    };
  }

  factory ExerciseMetadata.fromMap(Map<String, dynamic> map) {
    return ExerciseMetadata(
      id: map['id'] ?? '',
      moduleId: map['moduleId'] ?? '',
      number: map['number'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      instructions: map['instructions'] ?? '',
      difficulty: map['difficulty'] ?? 'Easy',
      isValidated: map['isValidated'] ?? false,
      hint: map['hint'],
      example: map['example'],
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
    );
  }

  ExerciseMetadata copyWith({
    String? id,
    String? moduleId,
    int? number,
    String? title,
    String? description,
    String? instructions,
    String? difficulty,
    bool? isValidated,
    String? hint,
    String? example,
    DateTime? updatedAt,
  }) {
    return ExerciseMetadata(
      id: id ?? this.id,
      moduleId: moduleId ?? this.moduleId,
      number: number ?? this.number,
      title: title ?? this.title,
      description: description ?? this.description,
      instructions: instructions ?? this.instructions,
      difficulty: difficulty ?? this.difficulty,
      isValidated: isValidated ?? this.isValidated,
      hint: hint ?? this.hint,
      example: example ?? this.example,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

