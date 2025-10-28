import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../shared/widget/reusable_widgets.dart';
import '../shared/service/module_exercise_service.dart';
import '../shared/service/exercise_progress_service.dart';
import '../shared/service/efw100_progress_service.dart';
import '../module/efw100_common_widget/validator/efw100_validator.dart';
import 'exercise_detail_screen.dart';
import 'efw100_preview_screen.dart';

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
                                        // Show preview button for EFW100 exercises
                                        if (widget.moduleId == 'EFW100')
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
                                        // Show refresh button for non-EFW100 exercises
                                        if (widget.moduleId != 'EFW100' &&
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

  // Show preview widget for EFW100 exercises
  void _showPreviewWidget(ExerciseInfo exercise) {
    // Extract exercise number
    final exerciseNumber = int.tryParse(exercise.id.split('_ex')[1]) ?? 1;

    // Get widget - first try from service, then create temporary instance
    Widget? widget;
    bool isValid = false;

    // Try to get from Efw100ProgressService first
    final efw100View = Efw100ProgressService.instance.efw100View;
    if (efw100View != null) {
      try {
        // Call the exercise method dynamically
        switch (exerciseNumber) {
          case 1:
            widget = (efw100View as dynamic).exercise1();
            break;
          case 2:
            widget = (efw100View as dynamic).exercise2();
            break;
          case 3:
            widget = (efw100View as dynamic).exercise3();
            break;
          case 4:
            widget = (efw100View as dynamic).exercise4();
            break;
          case 5:
            widget = (efw100View as dynamic).exercise5();
            break;
          case 6:
            widget = (efw100View as dynamic).exercise6();
            break;
          case 7:
            widget = (efw100View as dynamic).exercise7();
            break;
          case 8:
            widget = (efw100View as dynamic).exercise8();
            break;
          case 9:
            widget = (efw100View as dynamic).exercise9();
            break;
          case 10:
            widget = (efw100View as dynamic).exercise10();
            break;
          case 11:
            widget = (efw100View as dynamic).exercise11();
            break;
          case 12:
            widget = (efw100View as dynamic).exercise12();
            break;
          case 13:
            widget = (efw100View as dynamic).exercise13();
            break;
          case 14:
            widget = (efw100View as dynamic).exercise14();
            break;
          case 15:
            widget = (efw100View as dynamic).exercise15();
            break;
        }
      } catch (e) {
        print('Error calling exercise method from view: $e');
      }
    }

    // If widget not obtained from service, create default widgets
    if (widget == null) {
      widget = _getDefaultWidget(exerciseNumber);
    }

    // Validate widget
    isValid = Efw100Validator.validateExercise(exerciseNumber, widget);

    // Navigate to preview screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Efw100PreviewScreen(
          exerciseNumber: exerciseNumber,
          widget: widget,
          isValid: isValid,
        ),
      ),
    );
  }

  // Helper method to create default widgets based on exercise number
  Widget? _getDefaultWidget(int exerciseNumber) {
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
}
