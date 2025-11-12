import '../service/module_exercise_service.dart';

class ModuleData {
  final String id;
  final String title;
  final String description;
  final String category;
  final int totalExercises;
  final String difficulty;
  final String icon;
  final List<String> topics;
  final bool isUIExercise;

  ModuleData({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.totalExercises,
    required this.difficulty,
    required this.icon,
    required this.topics,
    this.isUIExercise = false,
  });

  // Get actual exercise count from file
  Future<int> getActualExerciseCount() async {
    try {
      return await ModuleExerciseService.getTotalExercises(id);
    } catch (e) {
      return totalExercises; // Fallback to default
    }
  }
}

class ModuleService {
  static List<ModuleData> getAllModules() {
    return [
      // Data Modules
      ModuleData(
        id: 'EFD1100',
        title: 'Variable',
        description: 'Pelajari konsep dasar variabel dalam Dart',
        category: 'Data Types',
        totalExercises: 35,
        difficulty: 'Beginner',
        icon: '📊',
        topics: ['String', 'int', 'double', 'bool', 'var', 'dynamic'],
      ),
      ModuleData(
        id: 'EFD1200',
        title: 'DateTime',
        description: 'Manipulasi tanggal dan waktu',
        category: 'Data Types',
        totalExercises: 35,
        difficulty: 'Beginner',
        icon: '📅',
        topics: ['DateTime', 'Duration', 'Format', 'Parse'],
      ),
      ModuleData(
        id: 'EFD1300',
        title: 'String',
        description: 'Operasi string dan manipulasi teks',
        category: 'Data Types',
        totalExercises: 35,
        difficulty: 'Beginner',
        icon: '📝',
        topics: ['Concatenation', 'Interpolation', 'Methods', 'Regex'],
      ),
      ModuleData(
        id: 'EFD1400',
        title: 'Number',
        description: 'Operasi matematika dan angka',
        category: 'Data Types',
        totalExercises: 35,
        difficulty: 'Beginner',
        icon: '🔢',
        topics: ['int', 'double', 'Math', 'Operators'],
      ),
      ModuleData(
        id: 'EFD1500',
        title: 'If Statement',
        description: 'Kondisional dan logika pemrograman',
        category: 'Control Flow',
        totalExercises: 35,
        difficulty: 'Beginner',
        icon: '🔀',
        topics: ['if', 'else', 'else if', 'ternary'],
      ),
      ModuleData(
        id: 'EFB100',
        title: 'Null Safety',
        description: 'Penanganan null dan null safety',
        category: 'Advanced',
        totalExercises: 28,
        difficulty: 'Intermediate',
        icon: '🛡️',
        topics: ['null', '?', '!', '??', 'late'],
      ),
      ModuleData(
        id: 'EFD1600',
        title: 'List & Map',
        description: 'Koleksi data dan struktur data',
        category: 'Data Structures',
        totalExercises: 35,
        difficulty: 'Intermediate',
        icon: '📋',
        topics: ['List', 'Map', 'Set', 'Iteration'],
      ),
      ModuleData(
        id: 'EFD1700',
        title: 'Regex',
        description: 'Regular expression dan pattern matching',
        category: 'Advanced',
        totalExercises: 34,
        difficulty: 'Advanced',
        icon: '🔍',
        topics: ['Pattern', 'Match', 'Replace', 'Validation'],
      ),
      ModuleData(
        id: 'EFD1800',
        title: 'Async',
        description: 'Pemrograman asynchronous',
        category: 'Advanced',
        totalExercises: 35,
        difficulty: 'Advanced',
        icon: '⚡',
        topics: ['Future', 'async', 'await', 'Stream'],
      ),

      // UI Modules
      ModuleData(
        id: 'EFW100',
        title: 'Common Widget',
        description: 'Widget dasar Flutter',
        category: 'UI Components',
        totalExercises: 15,
        difficulty: 'Beginner',
        icon: '🧩',
        topics: ['Text', 'Container', 'Button', 'Image'],
        isUIExercise: true,
      ),
      ModuleData(
        id: 'EFW200',
        title: 'Layout',
        description: 'Struktur layout dasar',
        category: 'UI Layout',
        totalExercises: 18,
        difficulty: 'Beginner',
        icon: '📐',
        topics: ['Row', 'Column', 'Stack', 'Positioned'],
        isUIExercise: true,
      ),
      ModuleData(
        id: 'EFW300',
        title: 'ListView',
        description: 'List dan scrollable content',
        category: 'UI Components',
        totalExercises: 15,
        difficulty: 'Intermediate',
        icon: '📜',
        topics: ['ListView', 'ListTile', 'ScrollController'],
        isUIExercise: true,
      ),
      ModuleData(
        id: 'EFW301',
        title: 'ListView Advanced',
        description: 'ListView dengan fitur advanced',
        category: 'UI Components',
        totalExercises: 9,
        difficulty: 'Advanced',
        icon: '📜',
        topics: ['CustomScrollView', 'Sliver', 'RefreshIndicator'],
        isUIExercise: true,
      ),
      ModuleData(
        id: 'EFW400',
        title: 'GridView',
        description: 'Grid layout dan responsive design',
        category: 'UI Layout',
        totalExercises: 16,
        difficulty: 'Intermediate',
        icon: '🔲',
        topics: ['GridView', 'StaggeredGrid', 'Responsive'],
        isUIExercise: true,
      ),
    ];
  }

  static ModuleData? getModuleById(String id) {
    try {
      return getAllModules().firstWhere((module) => module.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<ModuleData> getModulesByCategory(String category) {
    return getAllModules()
        .where((module) => module.category == category)
        .toList();
  }

  static List<String> getAllCategories() {
    return getAllModules().map((module) => module.category).toSet().toList();
  }

  static List<ModuleData> getDataModules() {
    return getAllModules().where((module) => !module.isUIExercise).toList();
  }

  static List<ModuleData> getUIModules() {
    return getAllModules().where((module) => module.isUIExercise).toList();
  }
}
