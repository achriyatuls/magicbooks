// Achievement System untuk Magic Book
// 
// ════════════════════════════════════════════════════════════════════════════
// Model untuk achievement system dengan unlock conditions
// ════════════════════════════════════════════════════════════════════════════

class Achievement {
  final String id;
  final String title;
  final String description;
  final String icon;
  final AchievementType type;
  final int requiredValue;
  final String? moduleId; // Untuk module-specific achievements
  final List<String> requirements; // Deskripsi requirements
  final int xpReward;
  final String rarity; // Common, Rare, Epic, Legendary

  Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.type,
    required this.requiredValue,
    this.moduleId,
    required this.requirements,
    required this.xpReward,
    required this.rarity,
  });

  // Check if achievement is unlocked based on user progress
  bool isUnlocked(Map<String, dynamic> userProgress) {
    switch (type) {
      case AchievementType.exercisesCompleted:
        return (userProgress['totalCompletedExercises'] ?? 0) >= requiredValue;
      case AchievementType.perfectExercises:
        return (userProgress['perfectExercises'] ?? 0) >= requiredValue;
      case AchievementType.moduleCompleted:
        if (moduleId != null) {
          final percentage = userProgress['moduleProgress']?[moduleId]?['completionPercentage'] ?? 0.0;
          return percentage >= requiredValue;
        }
        return false;
      case AchievementType.streakDays:
        return (userProgress['streakDays'] ?? 0) >= requiredValue;
      case AchievementType.totalXP:
        return (userProgress['totalXP'] ?? 0) >= requiredValue;
      case AchievementType.perfectModule:
        if (moduleId != null) {
          return userProgress['moduleProgress']?[moduleId]?['perfectExercises'] == 
                 userProgress['moduleProgress']?[moduleId]?['totalExercises'];
        }
        return false;
    }
  }

  // Get progress percentage towards unlocking
  double getProgressPercentage(Map<String, dynamic> userProgress) {
    switch (type) {
      case AchievementType.exercisesCompleted:
        return ((userProgress['totalCompletedExercises'] ?? 0) / requiredValue * 100).clamp(0.0, 100.0);
      case AchievementType.perfectExercises:
        return ((userProgress['perfectExercises'] ?? 0) / requiredValue * 100).clamp(0.0, 100.0);
      case AchievementType.moduleCompleted:
        if (moduleId != null) {
          final current = userProgress['moduleProgress']?[moduleId]?['completionPercentage'] ?? 0.0;
          return (current / requiredValue * 100).clamp(0.0, 100.0);
        }
        return 0.0;
      case AchievementType.streakDays:
        return ((userProgress['streakDays'] ?? 0) / requiredValue * 100).clamp(0.0, 100.0);
      case AchievementType.totalXP:
        return ((userProgress['totalXP'] ?? 0) / requiredValue * 100).clamp(0.0, 100.0);
      case AchievementType.perfectModule:
        if (moduleId != null) {
          final perfect = userProgress['moduleProgress']?[moduleId]?['perfectExercises'] ?? 0;
          final total = userProgress['moduleProgress']?[moduleId]?['totalExercises'] ?? 1;
          return (perfect / total * 100).clamp(0.0, 100.0);
        }
        return 0.0;
    }
  }

  // Get current progress text
  String getProgressText(Map<String, dynamic> userProgress) {
    switch (type) {
      case AchievementType.exercisesCompleted:
        return '${userProgress['totalCompletedExercises'] ?? 0}/$requiredValue exercises';
      case AchievementType.perfectExercises:
        return '${userProgress['perfectExercises'] ?? 0}/$requiredValue perfect';
      case AchievementType.moduleCompleted:
        if (moduleId != null) {
          final current = userProgress['moduleProgress']?[moduleId]?['completionPercentage'] ?? 0.0;
          return '${current.toStringAsFixed(1)}%/$requiredValue%';
        }
        return '0%/$requiredValue%';
      case AchievementType.streakDays:
        return '${userProgress['streakDays'] ?? 0}/$requiredValue days';
      case AchievementType.totalXP:
        return '${userProgress['totalXP'] ?? 0}/$requiredValue XP';
      case AchievementType.perfectModule:
        if (moduleId != null) {
          final perfect = userProgress['moduleProgress']?[moduleId]?['perfectExercises'] ?? 0;
          final total = userProgress['moduleProgress']?[moduleId]?['totalExercises'] ?? 1;
          return '$perfect/$total exercises';
        }
        return '0/0 exercises';
    }
  }
}

enum AchievementType {
  exercisesCompleted,
  perfectExercises,
  moduleCompleted,
  streakDays,
  totalXP,
  perfectModule,
}

class AchievementService {
  static List<Achievement> getAllAchievements() {
    return [
      // First Steps Achievements
      Achievement(
        id: 'first_exercise',
        title: 'First Steps',
        description: 'Complete your first exercise',
        icon: '🎯',
        type: AchievementType.exercisesCompleted,
        requiredValue: 1,
        requirements: ['Complete 1 exercise'],
        xpReward: 50,
        rarity: 'Common',
      ),
      
      Achievement(
        id: 'first_perfect',
        title: 'Perfect Start',
        description: 'Get your first perfect score',
        icon: '⭐',
        type: AchievementType.perfectExercises,
        requiredValue: 1,
        requirements: ['Get 1 perfect score'],
        xpReward: 100,
        rarity: 'Common',
      ),

      // Progress Achievements
      Achievement(
        id: 'five_exercises',
        title: 'Getting Started',
        description: 'Complete 5 exercises',
        icon: '🚀',
        type: AchievementType.exercisesCompleted,
        requiredValue: 5,
        requirements: ['Complete 5 exercises'],
        xpReward: 150,
        rarity: 'Common',
      ),

      Achievement(
        id: 'ten_exercises',
        title: 'On Fire',
        description: 'Complete 10 exercises',
        icon: '🔥',
        type: AchievementType.exercisesCompleted,
        requiredValue: 10,
        requirements: ['Complete 10 exercises'],
        xpReward: 300,
        rarity: 'Rare',
      ),

      Achievement(
        id: 'twenty_exercises',
        title: 'Half Way There',
        description: 'Complete 20 exercises',
        icon: '📈',
        type: AchievementType.exercisesCompleted,
        requiredValue: 20,
        requirements: ['Complete 20 exercises'],
        xpReward: 500,
        rarity: 'Rare',
      ),

      Achievement(
        id: 'thirty_exercises',
        title: 'Almost There',
        description: 'Complete 30 exercises',
        icon: '🎖️',
        type: AchievementType.exercisesCompleted,
        requiredValue: 30,
        requirements: ['Complete 30 exercises'],
        xpReward: 750,
        rarity: 'Epic',
      ),

      Achievement(
        id: 'all_exercises',
        title: 'Master of All',
        description: 'Complete all exercises',
        icon: '👑',
        type: AchievementType.exercisesCompleted,
        requiredValue: 35,
        requirements: ['Complete all 35 exercises'],
        xpReward: 1000,
        rarity: 'Legendary',
      ),

      // Perfect Score Achievements
      Achievement(
        id: 'five_perfect',
        title: 'Perfectionist',
        description: 'Get 5 perfect scores',
        icon: '💎',
        type: AchievementType.perfectExercises,
        requiredValue: 5,
        requirements: ['Get 5 perfect scores'],
        xpReward: 200,
        rarity: 'Rare',
      ),

      Achievement(
        id: 'ten_perfect',
        title: 'Flawless',
        description: 'Get 10 perfect scores',
        icon: '💫',
        type: AchievementType.perfectExercises,
        requiredValue: 10,
        requirements: ['Get 10 perfect scores'],
        xpReward: 400,
        rarity: 'Epic',
      ),

      Achievement(
        id: 'all_perfect',
        title: 'Perfect Master',
        description: 'Get perfect scores on all exercises',
        icon: '🏆',
        type: AchievementType.perfectExercises,
        requiredValue: 35,
        requirements: ['Get perfect scores on all 35 exercises'],
        xpReward: 1500,
        rarity: 'Legendary',
      ),

      // Module Specific Achievements
      Achievement(
        id: 'variable_master',
        title: 'Variable Master',
        description: 'Complete Variable module',
        icon: '📊',
        type: AchievementType.moduleCompleted,
        requiredValue: 100,
        moduleId: 'EFD1100',
        requirements: ['Complete Variable module (EFD1100)', 'Get 100% completion'],
        xpReward: 300,
        rarity: 'Rare',
      ),

      Achievement(
        id: 'variable_perfect',
        title: 'Variable Perfectionist',
        description: 'Perfect score on Variable module',
        icon: '🎯',
        type: AchievementType.perfectModule,
        requiredValue: 1,
        moduleId: 'EFD1100',
        requirements: ['Get perfect scores on all Variable exercises'],
        xpReward: 500,
        rarity: 'Epic',
      ),

      // XP Achievements
      Achievement(
        id: 'xp_500',
        title: 'XP Collector',
        description: 'Earn 500 XP',
        icon: '💰',
        type: AchievementType.totalXP,
        requiredValue: 500,
        requirements: ['Earn 500 XP'],
        xpReward: 100,
        rarity: 'Common',
      ),

      Achievement(
        id: 'xp_1000',
        title: 'XP Hunter',
        description: 'Earn 1000 XP',
        icon: '💎',
        type: AchievementType.totalXP,
        requiredValue: 1000,
        requirements: ['Earn 1000 XP'],
        xpReward: 200,
        rarity: 'Rare',
      ),

      Achievement(
        id: 'xp_2000',
        title: 'XP Master',
        description: 'Earn 2000 XP',
        icon: '👑',
        type: AchievementType.totalXP,
        requiredValue: 2000,
        requirements: ['Earn 2000 XP'],
        xpReward: 500,
        rarity: 'Epic',
      ),
    ];
  }

  static List<Achievement> getUnlockedAchievements(Map<String, dynamic> userProgress) {
    return getAllAchievements().where((achievement) => achievement.isUnlocked(userProgress)).toList();
  }

  static List<Achievement> getLockedAchievements(Map<String, dynamic> userProgress) {
    return getAllAchievements().where((achievement) => !achievement.isUnlocked(userProgress)).toList();
  }

  static int getTotalXPFromAchievements(Map<String, dynamic> userProgress) {
    return getUnlockedAchievements(userProgress).fold(0, (sum, achievement) => sum + achievement.xpReward);
  }

  static String getRarityColor(String rarity) {
    switch (rarity) {
      case 'Common':
        return '#4CAF50'; // Green
      case 'Rare':
        return '#2196F3'; // Blue
      case 'Epic':
        return '#9C27B0'; // Purple
      case 'Legendary':
        return '#FF9800'; // Orange
      default:
        return '#9E9E9E'; // Grey
    }
  }
}
