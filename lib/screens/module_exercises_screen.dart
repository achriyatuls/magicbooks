import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../shared/widget/reusable_widgets.dart';
import '../shared/service/module_exercise_service.dart';
import '../shared/service/exercise_progress_service.dart';
import '../shared/service/efw100_progress_service.dart';
import '../shared/service/efw200_progress_service.dart';
import '../shared/service/efw300_progress_service.dart';
import '../shared/service/efw301_progress_service.dart';
import '../shared/service/efw400_progress_service.dart';
import '../module/efw300_list/validator/efw300_validator.dart';
import '../module/efw301_list/validator/efw301_validator.dart';
import '../module/efw400_grid/validator/efw400_validator.dart';
import '../module/efw100_common_widget/validator/efw100_validator.dart';
import '../module/efw200_layout/validator/efw200_validator.dart';
import 'exercise_detail_screen.dart';
import 'efw100_preview_screen.dart';
import 'efw200_preview_screen.dart';
import 'efw300_preview_screen.dart';
import 'efw301_preview_screen.dart';
import 'efw400_preview_screen.dart';

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Auto-refresh status when screen becomes visible
    // This helps update status after user opens EFW view page
    if (_exercises.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _checkAllExerciseStatus();
      });
    }
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
                                        // Show preview button for EFW100/200/300/301/400 exercises
                                        if (widget.moduleId == 'EFW100' ||
                                            widget.moduleId == 'EFW200' ||
                                            widget.moduleId == 'EFW300' ||
                                            widget.moduleId == 'EFW301' ||
                                            widget.moduleId == 'EFW400')
                                          Tooltip(
                                            message: 'Preview Widget',
                                            child: IconButton(
                                              icon: const Icon(Icons.preview),
                                              onPressed: () =>
                                                  _showPreviewWidget(exercise),
                                              tooltip: 'Preview Widget',
                                              color: Colors.blue,
                                              iconSize: 20,
                                            ),
                                          ),
                                        // Show refresh button for non-EFW exercises
                                        if (widget.moduleId != 'EFW100' &&
                                            widget.moduleId != 'EFW200' &&
                                            widget.moduleId != 'EFW300' &&
                                            widget.moduleId != 'EFW301' &&
                                            widget.moduleId != 'EFW400' &&
                                            _exerciseStatus[exercise.id] !=
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
              'Status Update: $completedCount/$totalCount exercises selesai'),
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
          content: Text('Sedang menyimpan, tunggu sebentar...'),
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

      print('📊 EFW200 Status check for ${widget.moduleId}:');
      print('   Exercise IDs: ${_exercises.map((e) => e.id).join(", ")}');
      print('   Updated status: $updatedStatus');
      if (widget.moduleId == 'EFW200') {
        final efw200View = Efw200ProgressService.instance.efw200View;
        print('   Efw200View registered: ${efw200View != null}');
      }

      setState(() {
        _exerciseStatus = updatedStatus;
      });

      // Get completed exercises
      final completedExercises = _exercises
          .where((exercise) => updatedStatus[exercise.id] == true)
          .map((exercise) => exercise.id)
          .toList();

      print('   Completed exercises: ${completedExercises.join(", ")}');

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
        return 'lib/module/efd1500_if_statement/exercises/efd1500_exercises.dart';
      case 'EFB100':
        return 'lib/module/efb100_null_safety/exercises/efb100_exercises.dart';
      case 'EFD1600':
        return 'lib/module/efd1600_list_and_map/exercises/efd1600_exercises.dart';
      case 'EFD1700':
        return 'lib/module/efd1700_regex/exercises/efd1700_exercises.dart';
      case 'EFD1800':
        return 'lib/module/efd1800_async_function/exercises/efd1800_exercises.dart';
      case 'EFW100':
        return 'lib/module/efw100_common_widget/view/efw100_common_widget_view.dart';
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

  // Show preview widget for EFW100 and EFW200 exercises
  void _showPreviewWidget(ExerciseInfo exercise) {
    // Extract exercise number
    final exerciseNumber = int.tryParse(exercise.id.split('_ex')[1]) ?? 1;

    // Get widget - first try from service, then create temporary instance
    Widget? previewWidget;
    bool isValid = false;

    // EFW100 Logic
    if (widget.moduleId == 'EFW100') {
      final efw100View = Efw100ProgressService.instance.efw100View;
      if (efw100View != null) {
        try {
          // Call the exercise method dynamically
          switch (exerciseNumber) {
            case 1:
              previewWidget = (efw100View as dynamic).exercise1();
              break;
            case 2:
              previewWidget = (efw100View as dynamic).exercise2();
              break;
            case 3:
              previewWidget = (efw100View as dynamic).exercise3();
              break;
            case 4:
              previewWidget = (efw100View as dynamic).exercise4();
              break;
            case 5:
              previewWidget = (efw100View as dynamic).exercise5();
              break;
            case 6:
              previewWidget = (efw100View as dynamic).exercise6();
              break;
            case 7:
              previewWidget = (efw100View as dynamic).exercise7();
              break;
            case 8:
              previewWidget = (efw100View as dynamic).exercise8();
              break;
            case 9:
              previewWidget = (efw100View as dynamic).exercise9();
              break;
            case 10:
              previewWidget = (efw100View as dynamic).exercise10();
              break;
            case 11:
              previewWidget = (efw100View as dynamic).exercise11();
              break;
            case 12:
              previewWidget = (efw100View as dynamic).exercise12();
              break;
            case 13:
              previewWidget = (efw100View as dynamic).exercise13();
              break;
            case 14:
              previewWidget = (efw100View as dynamic).exercise14();
              break;
            case 15:
              previewWidget = (efw100View as dynamic).exercise15();
              break;
          }
        } catch (e) {
          print('Error calling EFW100 exercise method: $e');
        }
      }
    }

    // EFW200 Logic
    if (widget.moduleId == 'EFW200') {
      final efw200View = Efw200ProgressService.instance.efw200View;
      if (efw200View != null) {
        try {
          // Call the exercise method dynamically
          switch (exerciseNumber) {
            case 1:
              previewWidget = (efw200View as dynamic).exercise1();
              break;
            case 2:
              previewWidget = (efw200View as dynamic).exercise2();
              break;
            case 3:
              previewWidget = (efw200View as dynamic).exercise3();
              break;
            case 4:
              previewWidget = (efw200View as dynamic).exercise4();
              break;
            case 5:
              previewWidget = (efw200View as dynamic).exercise5();
              break;
            case 6:
              previewWidget = (efw200View as dynamic).exercise6();
              break;
            case 7:
              previewWidget = (efw200View as dynamic).exercise7();
              break;
            case 8:
              previewWidget = (efw200View as dynamic).exercise8();
              break;
            case 9:
              previewWidget = (efw200View as dynamic).exercise9();
              break;
            case 10:
              previewWidget = (efw200View as dynamic).exercise10();
              break;
            case 11:
              previewWidget = (efw200View as dynamic).exercise11();
              break;
            case 12:
              previewWidget = (efw200View as dynamic).exercise12();
              break;
            case 13:
              previewWidget = (efw200View as dynamic).exercise13();
              break;
            case 14:
              previewWidget = (efw200View as dynamic).exercise14();
              break;
            case 15:
              previewWidget = (efw200View as dynamic).exercise15();
              break;
            case 16:
              previewWidget = (efw200View as dynamic).exercise16();
              break;
            case 17:
              previewWidget = (efw200View as dynamic).exercise17();
              break;
            case 18:
              previewWidget = (efw200View as dynamic).exercise18();
              break;
          }
        } catch (e) {
          print('Error calling EFW200 exercise method: $e');
        }
      }
    }

    // EFW300 Logic
    if (widget.moduleId == 'EFW300') {
      final efw300View = Efw300ProgressService.instance.efw300View;
      if (efw300View != null) {
        try {
          switch (exerciseNumber) {
            case 1:
              previewWidget = (efw300View as dynamic).exercise1();
              break;
            case 2:
              previewWidget = (efw300View as dynamic).exercise2();
              break;
            case 3:
              previewWidget = (efw300View as dynamic).exercise3();
              break;
            case 4:
              previewWidget = (efw300View as dynamic).exercise4();
              break;
            case 5:
              previewWidget = (efw300View as dynamic).exercise5();
              break;
            case 6:
              previewWidget = (efw300View as dynamic).exercise6();
              break;
            case 7:
              previewWidget = (efw300View as dynamic).exercise7();
              break;
            case 8:
              previewWidget = (efw300View as dynamic).exercise8();
              break;
            case 9:
              previewWidget = (efw300View as dynamic).exercise9();
              break;
            case 10:
              previewWidget = (efw300View as dynamic).exercise10();
              break;
            case 11:
              previewWidget = (efw300View as dynamic).exercise11();
              break;
            case 12:
              previewWidget = (efw300View as dynamic).exercise12();
              break;
            case 13:
              previewWidget = (efw300View as dynamic).exercise13();
              break;
            case 14:
              previewWidget = (efw300View as dynamic).exercise14();
              break;
            case 15:
              previewWidget = (efw300View as dynamic).exercise15();
              break;
          }
        } catch (e) {
          print('Error calling EFW300 exercise method: $e');
        }
      }
    }

    // EFW301 Logic
    if (widget.moduleId == 'EFW301') {
      final efw301View = Efw301ProgressService.instance.efw301View;
      if (efw301View != null) {
        try {
          switch (exerciseNumber) {
            case 1:
              previewWidget = (efw301View as dynamic).exercise1();
              break;
            case 2:
              previewWidget = (efw301View as dynamic).exercise2();
              break;
            case 3:
              previewWidget = (efw301View as dynamic).exercise3();
              break;
            case 4:
              previewWidget = (efw301View as dynamic).exercise4();
              break;
            case 5:
              previewWidget = (efw301View as dynamic).exercise5();
              break;
            case 6:
              previewWidget = (efw301View as dynamic).exercise6();
              break;
            case 7:
              previewWidget = (efw301View as dynamic).exercise7();
              break;
            case 8:
              previewWidget = (efw301View as dynamic).exercise8();
              break;
            case 9:
              previewWidget = (efw301View as dynamic).exercise9();
              break;
          }
        } catch (e) {
          print('Error calling EFW301 exercise method: $e');
        }
      }
    }

    // EFW400 Logic
    if (widget.moduleId == 'EFW400') {
      final efw400View = Efw400ProgressService.instance.efw400View;
      if (efw400View != null) {
        try {
          switch (exerciseNumber) {
            case 1:
              previewWidget = (efw400View as dynamic).exercise1();
              break;
            case 2:
              previewWidget = (efw400View as dynamic).exercise2();
              break;
            case 3:
              previewWidget = (efw400View as dynamic).exercise3();
              break;
            case 4:
              previewWidget = (efw400View as dynamic).exercise4();
              break;
            case 5:
              previewWidget = (efw400View as dynamic).exercise5();
              break;
            case 6:
              previewWidget = (efw400View as dynamic).exercise6();
              break;
            case 7:
              previewWidget = (efw400View as dynamic).exercise7();
              break;
            case 8:
              previewWidget = (efw400View as dynamic).exercise8();
              break;
            case 9:
              previewWidget = (efw400View as dynamic).exercise9();
              break;
          }
        } catch (e) {
          print('Error calling EFW400 exercise method: $e');
        }
      }
    }

    // If widget not obtained from service, create default widgets
    if (previewWidget == null) {
      if (widget.moduleId == 'EFW300') {
        previewWidget = _getDefaultEfw300Widget(exerciseNumber);
      } else if (widget.moduleId == 'EFW301') {
        previewWidget = _getDefaultEfw301Widget(exerciseNumber);
      } else if (widget.moduleId == 'EFW400') {
        previewWidget = _getDefaultEfw400Widget(exerciseNumber);
      } else {
        previewWidget = _getDefaultWidget(exerciseNumber);
      }
    }

    // Validate widget based on module
    if (widget.moduleId == 'EFW100') {
      isValid = Efw100Validator.validateExercise(exerciseNumber, previewWidget);
    } else if (widget.moduleId == 'EFW200') {
      isValid = Efw200Validator.validateExercise(exerciseNumber, previewWidget);
    } else if (widget.moduleId == 'EFW300') {
      isValid = Efw300Validator.validateExercise(exerciseNumber, previewWidget);
    } else if (widget.moduleId == 'EFW301') {
      isValid = Efw301Validator.validateExercise(exerciseNumber, previewWidget);
    } else if (widget.moduleId == 'EFW400') {
      isValid = Efw400Validator.validateExercise(exerciseNumber, previewWidget);
    }

    // Navigate to preview screen based on module
    if (widget.moduleId == 'EFW200') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Efw200PreviewScreen(
            exerciseNumber: exerciseNumber,
            widget: previewWidget!,
            isValid: isValid,
          ),
        ),
      );
    } else if (widget.moduleId == 'EFW300') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Efw300PreviewScreen(
            exerciseNumber: exerciseNumber,
            widget: previewWidget!,
            isValid: isValid,
          ),
        ),
      );
    } else if (widget.moduleId == 'EFW301') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Efw301PreviewScreen(
            exerciseNumber: exerciseNumber,
            widget: previewWidget!,
            isValid: isValid,
          ),
        ),
      );
    } else if (widget.moduleId == 'EFW400') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Efw400PreviewScreen(
            exerciseNumber: exerciseNumber,
            preview: previewWidget,
            isValid: isValid,
          ),
        ),
      );
    } else {
      // Default to EFW100 for other EFW modules
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Efw100PreviewScreen(
            exerciseNumber: exerciseNumber,
            widget: previewWidget!,
            isValid: isValid,
          ),
        ),
      );
    }
  }

  // Helper method to create default widgets based on exercise number
  Widget? _getDefaultWidget(int exerciseNumber) {
    // Check if this is for EFW200 module
    if (widget.moduleId == 'EFW200') {
      return _getDefaultEfw200Widget(exerciseNumber);
    }

    // Default widgets for EFW100
    switch (exerciseNumber) {
      case 1:
        return Container(
          width: 100,
          height: 100,
          color: Colors.red,
        );
      case 2:
        return Text(
          "Hello Flutter",
          style: TextStyle(fontSize: 24),
        );
      case 3:
        return Icon(
          Icons.home,
          color: Colors.blue,
        );
      case 4:
        return Image.asset(
          "assets/images/image1.jpg",
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        );
      case 5:
        return CircleAvatar(
          radius: 30,
          backgroundColor: Colors.green,
        );
      case 6:
        return Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text("Card Content"),
          ),
        );
      case 7:
        return ListTile(
          title: Text("List Tile"),
          subtitle: Text("Subtitle"),
        );
      case 8:
        return ElevatedButton(
          onPressed: () {},
          child: Text("Click Me"),
        );
      case 9:
        return FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        );
      case 10:
        return AppBar(
          title: Text("My App"),
        );
      case 11:
        return Scaffold(
          appBar: AppBar(title: Text("App")),
          body: Text("Hello World"),
        );
      case 12:
        return SizedBox(
          width: 200,
          height: 100,
          child: Container(color: Colors.grey[300]),
        );
      case 13:
        return Padding(
          padding: EdgeInsets.all(16),
          child: Text("Padded Text"),
        );
      case 14:
        return Center(
          child: Text("Centered Text"),
        );
      case 15:
        return Align(
          alignment: Alignment.centerRight,
          child: Text("Right Aligned"),
        );
      default:
        return null;
    }
  }

  // Helper method to create default EFW200 widgets based on exercise number
  Widget? _getDefaultEfw200Widget(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        // Row with 3 containers
        return Row(
          children: [
            Container(width: 50, height: 50, color: Colors.red),
            Container(width: 50, height: 50, color: Colors.green),
            Container(width: 50, height: 50, color: Colors.blue),
          ],
        );
      case 2:
        // Column with 3 texts
        return Column(
          children: [
            Text("Text 1"),
            Text("Text 2"),
            Text("Text 3"),
          ],
        );
      case 3:
        // Stack
        return Stack(
          children: [
            Container(width: 100, height: 100, color: Colors.red),
            Container(width: 50, height: 50, color: Colors.green),
          ],
        );
      case 4:
        // Stack with Positioned
        return Stack(
          children: [
            Container(width: 100, height: 100, color: Colors.red),
            Positioned(
              top: 20,
              left: 20,
              child: Container(width: 50, height: 50, color: Colors.green),
            ),
          ],
        );
      case 5:
        // Wrap
        return Wrap(
          children: [
            Container(width: 50, height: 50, color: Colors.red),
            Container(width: 50, height: 50, color: Colors.green),
            Container(width: 50, height: 50, color: Colors.blue),
          ],
        );
      case 6:
        // Row with Expanded
        return Row(
          children: [
            Expanded(child: Container(height: 50, color: Colors.red)),
            Expanded(child: Container(height: 50, color: Colors.green)),
          ],
        );
      case 7:
        // Column with Flexible
        return Column(
          children: [
            Flexible(
                child: Container(width: 50, height: 50, color: Colors.red)),
            Flexible(
                child: Container(width: 50, height: 50, color: Colors.green)),
          ],
        );
      case 8:
        // SizedBox
        return SizedBox(width: 100, height: 100);
      case 9:
        // Container with margin and padding
        return Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
        );
      case 10:
        // Padding
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(width: 50, height: 50),
        );
      case 11:
        // Center
        return Center(
          child: Container(width: 50, height: 50, color: Colors.red),
        );
      case 12:
        // Align
        return Align(
          alignment: Alignment.topLeft,
          child: Container(width: 50, height: 50, color: Colors.red),
        );
      case 13:
        // AspectRatio
        return AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(color: Colors.red),
        );
      case 14:
        // FractionallySizedBox
        return FractionallySizedBox(
          widthFactor: 0.5,
          child: Container(height: 50, color: Colors.red),
        );
      case 15:
        // LayoutBuilder
        return LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              color: Colors.red,
            );
          },
        );
      case 16:
        // Transform.rotate
        return Transform.rotate(
          angle: 0.5,
          child: Container(width: 50, height: 50, color: Colors.blue),
        );
      case 17:
        // Transform.scale
        return Transform.scale(
          scale: 1.5,
          child: Container(width: 50, height: 50, color: Colors.green),
        );
      case 18:
        // Transform.translate
        return Transform.translate(
          offset: Offset(10, 10),
          child: Container(width: 50, height: 50, color: Colors.purple),
        );
      default:
        return Container(
          width: 100,
          height: 100,
          color: Colors.grey,
        );
    }
  }

  // Helper method to create default EFW300 widgets based on exercise number
  Widget? _getDefaultEfw300Widget(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        return ListView(
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 2:
        return ListView.builder(
          itemCount: 10,
          itemBuilder: (c, i) => ListTile(title: Text('Item ${i + 1}')),
        );
      case 3:
        return ListView.separated(
          itemCount: 5,
          itemBuilder: (c, i) => ListTile(title: Text('Item ${i + 1}')),
          separatorBuilder: (c, i) => const Divider(height: 1),
        );
      case 4:
        return ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            5,
            (i) => Container(
              width: 80,
              margin: const EdgeInsets.all(8),
              color: Colors.purpleAccent.withOpacity(0.2),
              child: Center(child: Text('Item ${i + 1}')),
            ),
          ),
        );
      case 5:
        return ListView(
          physics: const BouncingScrollPhysics(),
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 6:
        return ListView(
          controller: ScrollController(),
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 7:
        return ListView(
          shrinkWrap: true,
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 8:
        return ListView(
          padding: const EdgeInsets.all(16),
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 9:
        return ListView(
          itemExtent: 100,
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 10:
        return ListView(
          cacheExtent: 200,
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 11:
        return ListView.builder(
          addAutomaticKeepAlives: true,
          itemCount: 5,
          itemBuilder: (c, i) => ListTile(title: Text('Item ${i + 1}')),
        );
      case 12:
        return ListView.builder(
          addRepaintBoundaries: true,
          itemCount: 5,
          itemBuilder: (c, i) => ListTile(title: Text('Item ${i + 1}')),
        );
      case 13:
        return ListView(
          reverse: true,
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 14:
        return ListView(
          primary: false,
          shrinkWrap: true,
          children:
              List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
        );
      case 15:
        return ListView.custom(
          childrenDelegate: SliverChildListDelegate(
            List.generate(5, (i) => ListTile(title: Text('Item ${i + 1}'))),
          ),
        );
      default:
        return null;
    }
  }

  // Helper method to create default EFW301 widgets based on exercise number
  Widget? _getDefaultEfw301Widget(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        return ListView(
          children: List.generate(
            3,
            (i) => Dismissible(
              key: ValueKey('d-$i'),
              background: Container(color: Colors.redAccent),
              onDismissed: (_) {},
              child: ListTile(title: Text('Item ${i + 1}')),
            ),
          ),
        );
      case 2:
        return RefreshIndicator(
          onRefresh: () async {},
          child: ListView(
            children: const [ListTile(title: Text('Pull to refresh'))],
          ),
        );
      case 3:
        return AnimatedList(
          initialItemCount: 0,
          itemBuilder: (context, index, animation) => const SizedBox.shrink(),
        );
      case 4:
        return ReorderableListView(
          onReorder: (oldIndex, newIndex) {},
          children: List.generate(
            3,
            (i) => ListTile(
              key: ValueKey('r-$i'),
              title: Text('Item ${i + 1}'),
            ),
          ),
        );
      case 5:
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                const ListTile(title: Text('Sliver item 1')),
                const ListTile(title: Text('Sliver item 2')),
              ]),
            ),
          ],
        );
      case 6:
        return CustomScrollView(
          slivers: const [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('Content'),
              ),
            ),
          ],
        );
      case 7:
        return PageView(
          children: const [
            Center(child: Text('Page 1')),
            Center(child: Text('Page 2')),
          ],
        );
      case 8:
        return const DefaultTabController(
          length: 2,
          child: TabBarView(
            children: [
              Center(child: Text('Tab 1')),
              Center(child: Text('Tab 2')),
            ],
          ),
        );
      case 9:
        return NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => const [
            SliverAppBar(
              title: Text('Header'),
              pinned: true,
            ),
          ],
          body: ListView(
            children: const [
              ListTile(title: Text('Body item')),
            ],
          ),
        );
      default:
        return null;
    }
  }

  // Helper method to create default EFW400 widgets based on exercise number
  Widget? _getDefaultEfw400Widget(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          children: List.generate(
            6,
            (i) => Container(
                color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
          ),
        );
      case 2:
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          itemCount: 9,
          itemBuilder: (_, __) =>
              Container(color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
        );
      case 3:
        return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          children: List.generate(
            6,
            (i) => Container(
                color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
          ),
        );
      case 4:
        return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          children: List.generate(
            6,
            (i) => Container(
                color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
          ),
        );
      case 5:
        return GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          children: List.generate(
            6,
            (i) => Container(
                color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
          ),
        );
      case 6:
        return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          children: List.generate(
            6,
            (i) => Container(
                color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
          ),
        );
      case 7:
        return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          children: List.generate(
            6,
            (i) => Container(
                color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
          ),
        );
      case 8:
        return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          padding: const EdgeInsets.all(16),
          children: List.generate(
            6,
            (i) => Container(
                color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
          ),
        );
      case 9:
        return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          cacheExtent: 200,
          children: List.generate(
            6,
            (i) => Container(
                color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
          ),
        );
      default:
        return null;
    }
  }
}
