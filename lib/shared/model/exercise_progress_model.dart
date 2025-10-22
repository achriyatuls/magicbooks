import 'package:cloud_firestore/cloud_firestore.dart';

class ExerciseProgress {
  final String id;
  final String userId;
  final String moduleId;
  final String exerciseId;
  final bool isCompleted;
  final int score;
  final String? userCode;
  final String? uiPreview; // Untuk menyimpan preview UI (Row/Col)
  final Map<String, dynamic>? metadata;
  final DateTime completedAt;
  final DateTime updatedAt;

  ExerciseProgress({
    required this.id,
    required this.userId,
    required this.moduleId,
    required this.exerciseId,
    required this.isCompleted,
    required this.score,
    this.userCode,
    this.uiPreview,
    this.metadata,
    required this.completedAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'moduleId': moduleId,
      'exerciseId': exerciseId,
      'isCompleted': isCompleted,
      'score': score,
      'userCode': userCode,
      'uiPreview': uiPreview,
      'metadata': metadata,
      'completedAt': Timestamp.fromDate(completedAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  factory ExerciseProgress.fromMap(Map<String, dynamic> map) {
    return ExerciseProgress(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      moduleId: map['moduleId'] ?? '',
      exerciseId: map['exerciseId'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
      score: map['score'] ?? 0,
      userCode: map['userCode'],
      uiPreview: map['uiPreview'],
      metadata: map['metadata'],
      completedAt: (map['completedAt'] as Timestamp).toDate(),
      updatedAt: (map['updatedAt'] as Timestamp).toDate(),
    );
  }

  ExerciseProgress copyWith({
    String? id,
    String? userId,
    String? moduleId,
    String? exerciseId,
    bool? isCompleted,
    int? score,
    String? userCode,
    String? uiPreview,
    Map<String, dynamic>? metadata,
    DateTime? completedAt,
    DateTime? updatedAt,
  }) {
    return ExerciseProgress(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      moduleId: moduleId ?? this.moduleId,
      exerciseId: exerciseId ?? this.exerciseId,
      isCompleted: isCompleted ?? this.isCompleted,
      score: score ?? this.score,
      userCode: userCode ?? this.userCode,
      uiPreview: uiPreview ?? this.uiPreview,
      metadata: metadata ?? this.metadata,
      completedAt: completedAt ?? this.completedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ModuleProgress {
  final String moduleId;
  final String userId;
  final int totalExercises;
  final int completedExercises;
  final double completionPercentage;
  final int totalScore;
  final DateTime lastAccessed;
  final DateTime updatedAt;

  ModuleProgress({
    required this.moduleId,
    required this.userId,
    required this.totalExercises,
    required this.completedExercises,
    required this.completionPercentage,
    required this.totalScore,
    required this.lastAccessed,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'moduleId': moduleId,
      'userId': userId,
      'totalExercises': totalExercises,
      'completedExercises': completedExercises,
      'completionPercentage': completionPercentage,
      'totalScore': totalScore,
      'lastAccessed': Timestamp.fromDate(lastAccessed),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  factory ModuleProgress.fromMap(Map<String, dynamic> map) {
    return ModuleProgress(
      moduleId: map['moduleId'] ?? '',
      userId: map['userId'] ?? '',
      totalExercises: map['totalExercises'] ?? 0,
      completedExercises: map['completedExercises'] ?? 0,
      completionPercentage: (map['completionPercentage'] ?? 0.0).toDouble(),
      totalScore: map['totalScore'] ?? 0,
      lastAccessed: (map['lastAccessed'] as Timestamp).toDate(),
      updatedAt: (map['updatedAt'] as Timestamp).toDate(),
    );
  }
}
