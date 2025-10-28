import '../model/exercise_progress_model.dart';
import '../service/module_service.dart';

class GradeConverter {
  /// Convert overall progress to letter grade (A, B, C, D, E)
  static String convertToLetterGrade(double overallProgress) {
    if (overallProgress >= 90) return 'A';
    if (overallProgress >= 80) return 'B';
    if (overallProgress >= 70) return 'C';
    if (overallProgress >= 60) return 'D';
    return 'E';
  }

  /// Convert overall progress to numeric grade (0-100)
  static int convertToNumericGrade(double overallProgress) {
    return overallProgress.round();
  }

  /// Convert overall progress to grade description
  static String getGradeDescription(double overallProgress) {
    if (overallProgress >= 90) return 'Sangat Baik';
    if (overallProgress >= 80) return 'Baik';
    if (overallProgress >= 70) return 'Cukup';
    if (overallProgress >= 60) return 'Kurang';
    return 'Sangat Kurang';
  }

  /// Calculate weighted overall progress based on categories
  /// Data Modules: 40%, Logic Modules: 30%, UI Modules: 30%
  static double calculateWeightedProgress(
      List<ModuleProgress> moduleProgressList) {
    double dataProgress = 0.0;
    double logicProgress = 0.0;
    double uiProgress = 0.0;

    int dataCount = 0;
    int logicCount = 0;
    int uiCount = 0;

    for (var progress in moduleProgressList) {
      // Get module info to determine category
      final module = ModuleService.getModuleById(progress.moduleId);
      if (module != null) {
        if (module.category == 'Data Types' ||
            module.category == 'Data Structures') {
          dataProgress += progress.completionPercentage;
          dataCount++;
        } else if (module.category == 'Control Flow' ||
            module.category == 'Null Safety') {
          logicProgress += progress.completionPercentage;
          logicCount++;
        } else if (module.category == 'UI Components' ||
            module.category == 'UI Layout') {
          uiProgress += progress.completionPercentage;
          uiCount++;
        }
      }
    }

    // Calculate average per category
    final avgData = dataCount > 0 ? dataProgress / dataCount : 0.0;
    final avgLogic = logicCount > 0 ? logicProgress / logicCount : 0.0;
    final avgUI = uiCount > 0 ? uiProgress / uiCount : 0.0;

    // Apply weights: Data 40%, Logic 30%, UI  Hogar%
    final weightedProgress = (avgData * 0.4) + (avgLogic * 0.3) + (avgUI * 0.3);

    return weightedProgress.clamp(0.0, 100.0);
  }

  /// Calculate simple overall progress (average of all modules)
  static double calculateSimpleProgress(
      List<ModuleProgress> moduleProgressList) {
    if (moduleProgressList.isEmpty) return 0.0;

    double totalProgress = 0.0;
    for (var progress in moduleProgressList) {
      totalProgress += progress.completionPercentage;
    }

    return (totalProgress / moduleProgressList.length).clamp(0.0, 100.0);
  }

  /// Get grade breakdown by category
  static Map<String, double> getCategoryGrades(
      List<ModuleProgress> moduleProgressList) {
    Map<String, double> categories = {};

    Map<String, List<double>> categoryProgress = {};

    for (var progress in moduleProgressList) {
      final module = ModuleService.getModuleById(progress.moduleId);
      if (module != null) {
        final category = module.category;
        categoryProgress.putIfAbsent(category, () => []);
        categoryProgress[category]!.add(progress.completionPercentage);
      }
    }

    categoryProgress.forEach((category, progressList) {
      final avgProgress =
          progressList.reduce((a, b) => a + b) / progressList.length;
      categories[category] = avgProgress;
    });

    return categories;
  }

  /// Get detailed grade report
  static Map<String, dynamic> getDetailedGradeReport(
      List<ModuleProgress> moduleProgressList) {
    final simpleProgress = calculateSimpleProgress(moduleProgressList);
    final weightedProgress = calculateWeightedProgress(moduleProgressList);
    final categoryGrades = getCategoryGrades(moduleProgressList);

    return {
      'simpleProgress': simpleProgress,
      'weightedProgress': weightedProgress,
      'numericGrade': convertToNumericGrade(simpleProgress),
      'letterGrade': convertToLetterGrade(simpleProgress),
      'description': getGradeDescription(simpleProgress),
      'categoryGrades': categoryGrades,
      'totalModules': moduleProgressList.length,
      'completedModules':
          moduleProgressList.where((p) => p.completionPercentage == 100).length,
    };
  }

  /// Get progress summary text
  static String getProgressSummary(List<ModuleProgress> moduleProgressList) {
    if (moduleProgressList.isEmpty) return 'Belum ada progress';

    final simpleProgress = calculateSimpleProgress(moduleProgressList);
    final completedModules =
        moduleProgressList.where((p) => p.completionPercentage == 100).length;
    final totalModules = moduleProgressList.length;

    return '${completedModules}/${totalModules} modul selesai - Nilai: ${simpleProgress.toStringAsFixed(1)}%';
  }
}
