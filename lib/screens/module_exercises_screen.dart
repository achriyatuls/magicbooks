import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../shared/widget/reusable_widgets.dart';
import '../shared/service/module_exercise_service.dart';
import '../shared/service/exercise_progress_service.dart';
import 'exercise_detail_screen.dart';

class ModuleExercisesScreen extends StatefulWidget {
  final String moduleId;
  final String moduleTitle;
  final VoidCallback? onProgressUpdated;

  const ModuleExercisesScreen({
    Key? key,
    required this.moduleId,
    required this.moduleTitle,
    this.onProgressUpdated,
  }) : super(key: key);

  @override
  State<ModuleExercisesScreen> createState() => _ModuleExercisesScreenState();
}

class _ModuleExercisesScreenState extends State<ModuleExercisesScreen> {
  List<ExerciseInfo> _exercises = [];
  Map<String, bool> _exerciseStatus = {};
  bool _isLoading = true;
  bool _isSaving = false; // Flag untuk mencegah multiple saves

  @override
  void initState() {
    super.initState();
    _loadExercises();
  }

  Future<void> _loadExercises() async {
    setState(() {
      _isLoading = true;
    });

    try {
      print('Loading exercises for module: ${widget.moduleId}');
      final exercises =
          await ModuleExerciseService.getModuleExercises(widget.moduleId);
      final exerciseStatus =
          ModuleExerciseService.getExerciseStatus(widget.moduleId);
      print('Loaded ${exercises.length} exercises for ${widget.moduleId}');
      print('Exercise status: $exerciseStatus');

      setState(() {
        _exercises = exercises;
        _exerciseStatus = exerciseStatus;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading exercises for ${widget.moduleId}: $e');
      setState(() {
        _isLoading = false;
      });

      // Show error message to user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading exercises: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.moduleTitle),
        backgroundColor: const Color(0xFFAD88C6),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _checkAllExerciseStatus,
            tooltip: 'Cek Semua Status Exercise',
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
          child: _isLoading
              ? const ReusableLoadingWidget(message: 'Memuat exercises...')
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _exercises.length,
                        itemBuilder: (context, index) {
                          final exercise = _exercises[index];
                          return ReusableCard(
                            backgroundColor: Colors.white,
                            margin: const EdgeInsets.only(bottom: 12),
                            onTap: () => _navigateToExercise(exercise),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        exercise.title,
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
                                        if (exercise.isValidated)
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.green.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: const Text(
                                              'VALIDATED',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: _getDifficultyColor(
                                                exercise.difficulty),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            exercise.difficulty,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  exercise.description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Colors.grey[600],
                                      ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (exercise.hint != null) ...[
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade50,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Colors.blue.shade200),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.lightbulb_outline,
                                          color: Colors.blue.shade700,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            exercise.hint!,
                                            style: TextStyle(
                                              color: Colors.blue.shade700,
                                              fontSize: 12,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          _exerciseStatus[exercise.id] == true
                                              ? Icons.check_circle
                                              : Icons.radio_button_unchecked,
                                          color: _exerciseStatus[exercise.id] ==
                                                  true
                                              ? Colors.green
                                              : Colors.grey,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          _exerciseStatus[exercise.id] == true
                                              ? 'Selesai'
                                              : 'Belum',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: _exerciseStatus[
                                                            exercise.id] ==
                                                        true
                                                    ? Colors.green
                                                    : Colors.grey,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'ID: ${exercise.id}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Colors.grey[500],
                                                fontFamily: 'monospace',
                                              ),
                                        ),
                                        const SizedBox(width: 8),
                                        if (_exerciseStatus[exercise.id] !=
                                            true)
                                          IconButton(
                                            icon: const Icon(Icons.refresh),
                                            onPressed: () =>
                                                _refreshExerciseStatus(
                                                    exercise),
                                            tooltip: 'Cek Status Exercise',
                                            color: Colors.blue,
                                            iconSize: 20,
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    // Save Progress Button at bottom
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: ReusableButton(
                        text: _isSaving ? ' Menyimpan...' : 'Simpan Progress',
                        onPressed: _isSaving ? null : _saveAllProgress,
                        backgroundColor: _isSaving ? Colors.grey : Colors.green,
                        textColor: Colors.white,
                        icon:
                            _isSaving ? Icons.hourglass_empty : Icons.save_alt,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return Colors.green;
      case 'medium':
        return Colors.orange;
      case 'hard':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void _navigateToExercise(ExerciseInfo exercise) async {
    try {
      final exerciseCode = await ModuleExerciseService.getExerciseCode(
        widget.moduleId,
        exercise.id,
      );

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ExerciseDetailScreen(
            exerciseId: exercise.id,
            moduleId: widget.moduleId,
            exerciseTitle: exercise.title,
            exerciseDescription: exercise.description,
            exerciseCode: exerciseCode,
            filePath: _getExerciseFilePath(exercise.id),
            functionName: _getExerciseFunctionName(exercise.id),
            isUIExercise: false, // Data modules are not UI exercises
          ),
        ),
      );
    } catch (e) {
      print('Error getting exercise code: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error loading exercise: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _markAsCompleted(ExerciseInfo exercise) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tandai Exercise Selesai'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Apakah Anda sudah menyelesaikan exercise:'),
            const SizedBox(height: 8),
            Text(
              exercise.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text('Pastikan Anda sudah:'),
            const Text('• Membuka file exercise'),
            const Text('• Mengedit kode di area "TULIS KODE DI SINI"'),
            const Text('• Mengetes kode Anda'),
            const Text('• Memastikan hasilnya benar'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _confirmCompletion(exercise);
            },
            child: const Text('Ya, Selesai'),
          ),
        ],
      ),
    );
  }

  void _confirmCompletion(ExerciseInfo exercise) {
    // TODO: Implement actual progress saving to Firestore
    // For now, just show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${exercise.title} berhasil ditandai sebagai selesai!'),
        backgroundColor: Colors.green,
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.white,
          onPressed: () {
            // TODO: Implement undo functionality
          },
        ),
      ),
    );

    // Update UI to show completed state
    setState(() {
      // Find and update the exercise in the list
      final index = _exercises.indexWhere((e) => e.id == exercise.id);
      if (index != -1) {
        // Create a new ExerciseInfo with completed status
        // Note: This is a simplified approach - in real implementation,
        // you would have a proper state management system
        _exercises[index] = ExerciseInfo(
          id: exercise.id,
          title: exercise.title,
          description: exercise.description,
          instructions: exercise.instructions,
          difficulty: exercise.difficulty,
          isValidated: exercise.isValidated,
          hint: exercise.hint,
          example: exercise.example,
        );
      }
    });
  }

  void _refreshExerciseStatus(ExerciseInfo exercise) async {
    // Refresh status from validator
    final updatedStatus =
        ModuleExerciseService.getExerciseStatus(widget.moduleId);

    setState(() {
      _exerciseStatus = updatedStatus;
    });

    final isCompleted = updatedStatus[exercise.id] == true;

    // Show status feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCompleted
            ? '${exercise.title} berhasil dikerjakan!'
            : '${exercise.title} belum selesai. Silakan periksa kode Anda.'),
        backgroundColor: isCompleted ? Colors.green : Colors.orange,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Check all exercise status
  void _checkAllExerciseStatus() async {
    try {
      // Refresh status for all exercises
      final updatedStatus =
          ModuleExerciseService.getExerciseStatus(widget.moduleId);

      setState(() {
        _exerciseStatus = updatedStatus;
      });

      int completedCount = 0;
      int totalCount = _exercises.length;

      // Count completed exercises
      for (var exercise in _exercises) {
        final isCompleted = updatedStatus[exercise.id] == true;
        if (isCompleted) {
          completedCount++;
        }
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              '📊 Status Update: $completedCount/$totalCount exercises selesai'),
          backgroundColor: completedCount > 0 ? Colors.green : Colors.blue,
          duration: const Duration(seconds: 3),
        ),
      );
    } catch (e) {
      print('Error checking exercise status: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error checking status: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Save all progress to Firestore
  void _saveAllProgress() async {
    if (_isSaving) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('⏳ Sedang menyimpan, tunggu sebentar...'),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    _isSaving = true;

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Anda harus login terlebih dahulu'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Show loading dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Menyimpan progress...'),
            ],
          ),
        ),
      );

      // Refresh status for all exercises
      final updatedStatus =
          ModuleExerciseService.getExerciseStatus(widget.moduleId);

      setState(() {
        _exerciseStatus = updatedStatus;
      });

      // Get completed exercises
      final completedExercises = _exercises
          .where((exercise) => updatedStatus[exercise.id] == true)
          .map((exercise) => exercise.id)
          .toList();

      if (completedExercises.isNotEmpty) {
        // Use batch write method
        await ExerciseProgressService.markMultipleExercisesCompleted(
            user.uid, completedExercises, 100);
      }

      Navigator.pop(context); // Close loading dialog

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('✅ ${completedExercises.length} exercises tersimpan!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );

      // Call callback to refresh progress in parent screen
      if (widget.onProgressUpdated != null) {
        widget.onProgressUpdated!();
      }
    } catch (e) {
      Navigator.pop(context); // Close loading dialog if still open
      print('Error saving all progress: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving progress: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      _isSaving = false;
    }
  }

  // Get exercise file path based on exercise ID
  String _getExerciseFilePath(String exerciseId) {
    final moduleId = exerciseId.split('_ex')[0];
    switch (moduleId) {
      case 'EFD1100':
        return 'lib/module/efd1100_variable/exercises/efd1100_exercises.dart';
      case 'EFD1200':
        return 'lib/module/efd1200_datetime/exercises/efd1200_exercises.dart';
      case 'EFD1300':
        return 'lib/module/efd1300_string/exercises/efd1300_exercises.dart';
      case 'EFD1400':
        return 'lib/module/efd1400_number/exercises/efd1400_exercises.dart';
      case 'EFD1500':
        return 'lib/module/efd1500_if/exercises/efd1500_exercises.dart';
      case 'EFB100':
        return 'lib/module/efb100_null/exercises/efb100_exercises.dart';
      case 'EFD1600':
        return 'lib/module/efd1600_list/exercises/efd1600_exercises.dart';
      case 'EFD1700':
        return 'lib/module/efd1700_regex/exercises/efd1700_exercises.dart';
      case 'EFD1800':
        return 'lib/module/efd1800_async/exercises/efd1800_exercises.dart';
      case 'EFW100':
        return 'lib/module/efw100_widget/exercises/efw100_exercises.dart';
      case 'EFW200':
        return 'lib/module/efw200_layout/exercises/efw200_exercises.dart';
      case 'EFW300':
        return 'lib/module/efw300_listview/exercises/efw300_exercises.dart';
      case 'EFW301':
        return 'lib/module/efw301_listview_adv/exercises/efw301_exercises.dart';
      case 'EFW400':
        return 'lib/module/efw400_gridview/exercises/efw400_exercises.dart';
      default:
        return 'lib/module/${moduleId.toLowerCase()}/exercises/${moduleId.toLowerCase()}_exercises.dart';
    }
  }

  // Get exercise function name based on exercise ID
  String _getExerciseFunctionName(String exerciseId) {
    final exerciseNumber = exerciseId.split('_ex')[1];
    return 'exercise${exerciseNumber}()';
  }
}
