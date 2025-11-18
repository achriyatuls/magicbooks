import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../shared/service/auth_service.dart';
import '../shared/service/exercise_progress_service.dart';
import '../shared/service/module_exercise_service.dart';
import '../shared/service/module_service.dart';
import '../shared/model/user_model.dart';
import '../shared/model/exercise_progress_model.dart';
import '../shared/widget/reusable_widgets.dart';
import '../shared/util/grade_converter.dart';
import 'login_screen.dart';
import 'module_exercises_screen.dart';
import 'edit_profile_screen.dart';
import 'achievement_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final AuthService _authService = AuthService();
  final ExerciseProgressService _progressService = ExerciseProgressService();

  int _currentIndex = 0;
  UserModel? _userData;
  List<ModuleProgress> _moduleProgressList = [];
  List<ModuleData> _allModules = [];
  bool _isLoading = true;
  StreamSubscription<QuerySnapshot>? _progressStream;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _setupProgressListener();
  }

  @override
  void dispose() {
    _progressStream?.cancel();
    super.dispose();
  }

  Future<void> _loadUserData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userData = await _authService.getUserData(user.uid);
        final moduleProgress =
            await _progressService.getAllModuleProgressSummaries(user.uid);
        final allModules = ModuleService.getAllModules();

        // Update modules with actual exercise counts and progress from Firestore
        for (var module in allModules) {
          try {
            final actualCount =
                await ModuleExerciseService.getTotalExercises(module.id);

            // Get completed exercises from Firestore
            final snapshot = await FirebaseFirestore.instance
                .collection('exercise_progress')
                .where('userId', isEqualTo: user.uid)
                .where('moduleId', isEqualTo: module.id)
                .where('isCompleted', isEqualTo: true)
                .get();

            final completedCount = snapshot.docs.length;
            final totalScore = snapshot.docs.fold(0, (sum, doc) {
              final data = doc.data();
              return sum + (data['score'] as int? ?? 0);
            });

            // Update the module with actual count
            final index = allModules.indexWhere((m) => m.id == module.id);
            if (index != -1) {
              allModules[index] = ModuleData(
                id: module.id,
                title: module.title,
                description: module.description,
                category: module.category,
                totalExercises: actualCount,
                difficulty: module.difficulty,
                icon: module.icon,
                topics: module.topics,
                isUIExercise: module.isUIExercise,
              );
            }

            // Update module progress with data from Firestore
            final progressIndex =
                moduleProgress.indexWhere((p) => p.moduleId == module.id);
            if (progressIndex != -1) {
              moduleProgress[progressIndex] = ModuleProgress(
                moduleId: module.id,
                userId: user.uid,
                totalExercises: actualCount,
                completedExercises: completedCount,
                completionPercentage: actualCount > 0
                    ? (completedCount / actualCount) * 100
                    : 0.0,
                totalScore: totalScore,
                lastAccessed: DateTime.now(),
                updatedAt: DateTime.now(),
              );
            } else {
              // Add new progress if not exists
              moduleProgress.add(ModuleProgress(
                moduleId: module.id,
                userId: user.uid,
                totalExercises: actualCount,
                completedExercises: completedCount,
                completionPercentage: actualCount > 0
                    ? (completedCount / actualCount) * 100
                    : 0.0,
                totalScore: totalScore,
                lastAccessed: DateTime.now(),
                updatedAt: DateTime.now(),
              ));
            }
          } catch (e) {
            print('Error getting exercise count for ${module.id}: $e');
          }
        }

        setState(() {
          _userData = userData;
          _moduleProgressList = moduleProgress;
          _allModules = allModules;
        });
      }
    } catch (e) {
      print('Error loading user data: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Method to refresh progress data
  Future<void> _refreshProgress() async {
    await _loadUserData();
  }

  // Setup listener for exercise progress changes
  void _setupProgressListener() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    _progressStream = FirebaseFirestore.instance
        .collection('exercise_progress')
        .where('userId', isEqualTo: user.uid)
        .snapshots()
        .listen((snapshot) {
      // Update progress when there are changes
      if (snapshot.docs.isNotEmpty) {
        _updateModuleProgress();
      }
    });
  }

  // Update module progress based on latest Firestore data
  Future<void> _updateModuleProgress() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    try {
      // Get all completed exercises from Firestore
      final snapshot = await FirebaseFirestore.instance
          .collection('exercise_progress')
          .where('userId', isEqualTo: user.uid)
          .where('isCompleted', isEqualTo: true)
          .get();

      // Group by moduleId
      final Map<String, int> moduleCompletedCount = {};
      final Map<String, int> moduleTotalScore = {};

      for (var doc in snapshot.docs) {
        final data = doc.data();
        final moduleId = data['moduleId'] as String?;
        if (moduleId != null) {
          moduleCompletedCount[moduleId] =
              (moduleCompletedCount[moduleId] ?? 0) + 1;
          moduleTotalScore[moduleId] =
              (moduleTotalScore[moduleId] ?? 0) + (data['score'] as int? ?? 0);
        }
      }

      // Update progress list with latest data from Firestore
      final updatedProgress = <ModuleProgress>[];
      for (var progress in _moduleProgressList) {
        final completedCount = moduleCompletedCount[progress.moduleId] ?? 0;
        final totalScore = moduleTotalScore[progress.moduleId] ?? 0;

        // Get actual total exercises count to ensure accuracy
        int actualTotalExercises = progress.totalExercises;
        try {
          actualTotalExercises =
              await ModuleExerciseService.getTotalExercises(progress.moduleId);
        } catch (e) {
          print('Error getting total exercises for ${progress.moduleId}: $e');
        }

        updatedProgress.add(ModuleProgress(
          moduleId: progress.moduleId,
          userId: progress.userId,
          totalExercises: actualTotalExercises,
          completedExercises: completedCount,
          completionPercentage: actualTotalExercises > 0
              ? (completedCount / actualTotalExercises) * 100
              : 0.0,
          totalScore: totalScore,
          lastAccessed: progress.lastAccessed,
          updatedAt: DateTime.now(),
        ));
      }

      setState(() {
        _moduleProgressList = updatedProgress;
      });
    } catch (e) {
      print('Error updating module progress: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: ReusableLoadingWidget(message: 'Memuat data...'),
      );
    }

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildHomeScreen(),
          _buildModulesScreen(),
          _buildProgressScreen(),
          _buildAchievementScreen(),
          _buildProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFFAD88C6),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Modules',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Achievements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magic Book'),
        backgroundColor: const Color(0xFFAD88C6),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _signOut,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFAD88C6),
              Color(0xFFE1AFD1),
            ],
          ),
        ),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: _refreshProgress,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome Card
                  ReusableCard(
                    backgroundColor: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat datang, ${_userData?.nama ?? 'User'}!',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFAD88C6),
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${_userData?.jurusan ?? ''} - ${_userData?.kelas ?? ''} (${_userData?.absen ?? ''})',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Quick Stats
                  Text(
                    'Statistik Pembelajaran',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: ReusableCard(
                          backgroundColor: Colors.white,
                          child: Column(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                size: 40,
                                color: Colors.green,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${_moduleProgressList.fold(0, (sum, module) => sum + module.completedExercises)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                              ),
                              Text(
                                'Exercise Selesai',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ReusableCard(
                          backgroundColor: Colors.white,
                          child: Column(
                            children: [
                              const Icon(
                                Icons.book,
                                size: 40,
                                color: Colors.blue,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${_moduleProgressList.length}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                              ),
                              Text(
                                'Module',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Recent Progress
                  Text(
                    'Progress Terbaru',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),

                  const SizedBox(height: 16),

                  ...(_moduleProgressList.take(3).map(
                        (module) => ReusableCard(
                          backgroundColor: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                module.moduleId,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              ReusableProgressIndicator(
                                progress: module.completionPercentage / 100,
                                label: 'Progress',
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${module.completedExercises}/${module.totalExercises} exercises',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      )),

                  const SizedBox(height: 24),

                  // Recent Activities
                  Text(
                    'Aktivitas Terbaru',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),

                  const SizedBox(height: 16),

                  _buildRecentActivities(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecentActivities() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _getRecentActivities(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ReusableCard(
            backgroundColor: Colors.white,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return ReusableCard(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Icon(Icons.history, size: 48, color: Colors.grey[400]),
                  const SizedBox(height: 8),
                  Text(
                    'Belum ada aktivitas',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                ],
              ),
            ),
          );
        }

        return Column(
          children: snapshot.data!.take(5).map((activity) {
            return ReusableCard(
              backgroundColor: Colors.white,
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: _getActivityColor(activity['type']),
                  child: Icon(
                    _getActivityIcon(activity['type']),
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  activity['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  _formatTimestamp(activity['timestamp']),
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                trailing: activity['score'] != null
                    ? Chip(
                        label: Text('+${activity['score']} XP'),
                        backgroundColor: Colors.amber.shade100,
                        labelStyle: const TextStyle(fontSize: 12),
                      )
                    : null,
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Future<List<Map<String, dynamic>>> _getRecentActivities() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return [];

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('exercise_progress')
          .where('userId', isEqualTo: user.uid)
          .where('isCompleted', isEqualTo: true)
          .orderBy('updatedAt', descending: true)
          .limit(10)
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        return {
          'type': 'exercise_completed',
          'title': 'Menyelesaikan ${data['exerciseId'] ?? ''}',
          'moduleId': data['moduleId'] ?? '',
          'timestamp': (data['updatedAt'] as Timestamp?)?.toDate(),
          'score': data['score'] as int?,
        };
      }).toList();
    } catch (e) {
      print('Error getting recent activities: $e');
      return [];
    }
  }

  Color _getActivityColor(String type) {
    switch (type) {
      case 'exercise_completed':
        return Colors.green;
      case 'module_completed':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  IconData _getActivityIcon(String type) {
    switch (type) {
      case 'exercise_completed':
        return Icons.check_circle;
      case 'module_completed':
        return Icons.book;
      default:
        return Icons.notifications;
    }
  }

  String _formatTimestamp(DateTime? timestamp) {
    if (timestamp == null) return '';

    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Baru saja';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} menit yang lalu';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} jam yang lalu';
    } else {
      return '${difference.inDays} hari yang lalu';
    }
  }

  Widget _buildModulesScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modules'),
        backgroundColor: const Color(0xFFAD88C6),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFAD88C6),
              Color(0xFFE1AFD1),
            ],
          ),
        ),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: _refreshProgress,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: _allModules.length,
              itemBuilder: (context, index) {
                final module = _allModules[index];
                final progress = _moduleProgressList.firstWhere(
                  (p) => p.moduleId == module.id,
                  orElse: () => ModuleProgress(
                    moduleId: module.id,
                    userId: FirebaseAuth.instance.currentUser?.uid ?? '',
                    totalExercises: module.totalExercises,
                    completedExercises: 0,
                    completionPercentage: 0.0,
                    totalScore: 0,
                    lastAccessed: DateTime.now(),
                    updatedAt: DateTime.now(),
                  ),
                );

                return ReusableCard(
                  backgroundColor: Colors.white,
                  onTap: () => _navigateToModule(module.id),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // Module Icon
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: _getCategoryColor(module.category),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                module.icon,
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Module Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        module.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        if (module.isUIExercise)
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 6,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.blue.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: const Text(
                                              'UI',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        const SizedBox(width: 4),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: _getDifficultyColor(
                                                module.difficulty),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            module.difficulty,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  module.description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Colors.grey[600],
                                      ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  module.category,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color:
                                            _getCategoryColor(module.category),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ReusableProgressIndicator(
                        progress: progress.completionPercentage / 100,
                        label: 'Progress',
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${progress.completedExercises}/${module.totalExercises} exercises',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          if (progress.totalScore > 0)
                            Text(
                              'Score: ${progress.totalScore}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFAD88C6),
                                  ),
                            ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress'),
        backgroundColor: const Color(0xFFAD88C6),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFAD88C6),
              Color(0xFFE1AFD1),
            ],
          ),
        ),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: _refreshProgress,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Overall Progress
                  ReusableCard(
                    backgroundColor: Colors.white,
                    child: Column(
                      children: [
                        Text(
                          'Progress Keseluruhan',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 16),
                        CircularProgressIndicator(
                          value: _calculateOverallProgress(),
                          backgroundColor: Colors.grey.shade300,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFFAD88C6)),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '${(_calculateOverallProgress() * 100).toInt()}%',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFAD88C6),
                              ),
                        ),
                        const SizedBox(height: 16),
                        // Detailed Statistics
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '${_moduleProgressList.fold(0, (sum, module) => sum + module.completedExercises)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                ),
                                const Text('Completed'),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '${_moduleProgressList.fold(0, (sum, module) => sum + module.totalExercises)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                ),
                                const Text('Total'),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '${_moduleProgressList.fold(0, (sum, module) => sum + module.totalScore)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber,
                                      ),
                                ),
                                const Text('XP Earned'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Grade Information Card
                  ReusableCard(
                    backgroundColor: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nilai Keseluruhan',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 16),
                        if (_moduleProgressList.isNotEmpty) ...[
                          Builder(
                            builder: (context) {
                              final gradeReport =
                                  GradeConverter.getDetailedGradeReport(
                                      _moduleProgressList);
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: _getGradeColor(
                                              gradeReport['letterGrade']
                                                  as String),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            gradeReport['letterGrade']
                                                as String,
                                            style: const TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        gradeReport['description'] as String,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: _getGradeColor(
                                              gradeReport['letterGrade']
                                                  as String),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildGradeInfo('Nilai',
                                          '${gradeReport['numericGrade']}%'),
                                      const SizedBox(height: 8),
                                      _buildGradeInfo(
                                        'Weighted',
                                        '${(gradeReport['weightedProgress'] as double).toStringAsFixed(1)}%',
                                      ),
                                      const SizedBox(height: 8),
                                      _buildGradeInfo(
                                        'Modul Selesai',
                                        '${gradeReport['completedModules']}/${gradeReport['totalModules']}',
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ] else ...[
                          const Text(
                            'Belum ada data progress',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Module Progress Details
                  ...(_moduleProgressList.map(
                    (module) => ReusableCard(
                      backgroundColor: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            module.moduleId,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 12),
                          ReusableProgressIndicator(
                            progress: module.completionPercentage / 100,
                            label: 'Progress',
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${module.completedExercises}/${module.totalExercises} exercises',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                'Score: ${module.totalScore}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFFAD88C6),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _editProfile,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFAD88C6),
              Color(0xFFE1AFD1),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Profile Card
                ReusableCard(
                  backgroundColor: Colors.white,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: const Color(0xFFAD88C6),
                        backgroundImage: _userData?.photoURL != null
                            ? NetworkImage(_userData!.photoURL!)
                                as ImageProvider
                            : null,
                        child: _userData?.photoURL == null
                            ? Text(
                                _userData?.nama.substring(0, 1).toUpperCase() ??
                                    'U',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _userData?.nama ?? 'Nama tidak tersedia',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _userData?.email ?? 'Email tidak tersedia',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Profile Details
                ReusableCard(
                  backgroundColor: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informasi Profil',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 16),
                      _buildProfileDetail('Jurusan', _userData?.jurusan ?? '-'),
                      _buildProfileDetail('Kelas', _userData?.kelas ?? '-'),
                      _buildProfileDetail(
                          'Nomor Absen', _userData?.absen ?? '-'),
                      _buildProfileDetail(
                          'Bergabung', _formatDate(_userData?.createdAt)),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Action Buttons
                ReusableButton(
                  text: 'Edit Profil',
                  onPressed: _editProfile,
                  icon: Icons.edit,
                ),

                const SizedBox(height: 16),

                ReusableButton(
                  text: 'Keluar',
                  backgroundColor: Colors.red,
                  onPressed: _signOut,
                  icon: Icons.logout,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    return '${date.day}/${date.month}/${date.year}';
  }

  double _calculateOverallProgress() {
    if (_moduleProgressList.isEmpty) return 0.0;

    // Calculate based on actual completed exercises vs total exercises
    final totalExercises = _moduleProgressList.fold(
        0, (sum, module) => sum + module.totalExercises);
    final completedExercises = _moduleProgressList.fold(
        0, (sum, module) => sum + module.completedExercises);

    if (totalExercises == 0) return 0.0;

    return completedExercises / totalExercises;
  }

  void _navigateToModule(String moduleId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ModuleExercisesScreen(
          moduleId: moduleId,
          moduleTitle: moduleId,
          onProgressUpdated: _refreshProgress,
        ),
      ),
    );
  }

  void _editProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EditProfileScreen(),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'data types':
        return Colors.blue;
      case 'control flow':
        return Colors.green;
      case 'advanced':
        return Colors.red;
      case 'data structures':
        return Colors.orange;
      case 'ui components':
        return Colors.purple;
      case 'ui layout':
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'beginner':
        return Colors.green;
      case 'intermediate':
        return Colors.orange;
      case 'advanced':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'A':
        return Colors.green;
      case 'B':
        return Colors.lightGreen;
      case 'C':
        return Colors.orange;
      case 'D':
        return Colors.deepOrange;
      case 'E':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Widget _buildGradeInfo(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementScreen() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Prepare user progress data for achievements
    final userProgress = _prepareUserProgressData();

    return AchievementScreen(userProgress: userProgress);
  }

  Map<String, dynamic> _prepareUserProgressData() {
    final completedExercises = _moduleProgressList.fold(
        0, (sum, progress) => sum + progress.completedExercises);

    // Count perfect exercises - only count if ALL exercises in module are completed
    final perfectExercises = _moduleProgressList.fold(0, (sum, progress) {
      // Perfect means ALL exercises completed (100% completion)
      if (progress.completionPercentage == 100.0 &&
          progress.completedExercises == progress.totalExercises) {
        return sum + progress.completedExercises;
      }
      return sum;
    });

    final totalXP = _moduleProgressList.fold(
        0, (sum, progress) => sum + progress.totalScore);

    // Prepare module progress map for ALL modules (EFD, EFB, EFW)
    Map<String, dynamic> moduleProgress = {};
    for (var progress in _moduleProgressList) {
      // Perfect exercises = all exercises completed (100% completion)
      final isPerfect = progress.completionPercentage == 100.0 &&
          progress.completedExercises == progress.totalExercises;

      moduleProgress[progress.moduleId] = {
        'completionPercentage': progress.completionPercentage,
        'perfectExercises': isPerfect ? progress.completedExercises : 0,
        'totalExercises': progress.totalExercises,
        'completedExercises': progress.completedExercises,
      };
    }

    // Log untuk debugging
    print('📊 Achievement Progress Summary:');
    print('Total Completed Exercises: $completedExercises');
    print('Perfect Exercises: $perfectExercises');
    print('Total XP: $totalXP');
    print('Module Progress Keys: ${moduleProgress.keys.toList()}');

    return {
      'totalCompletedExercises': completedExercises,
      'perfectExercises': perfectExercises,
      'totalXP': totalXP,
      'streakDays': 0, // TODO: Implement streak tracking
      'moduleProgress': moduleProgress,
    };
  }

  Future<void> _signOut() async {
    final shouldSignOut = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );

    if (shouldSignOut == true) {
      await _authService.signOut();
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    }
  }
}
