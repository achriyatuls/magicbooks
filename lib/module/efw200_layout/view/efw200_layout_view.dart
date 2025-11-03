import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../exercises/efw200_exercises.dart';

class Efw200LayoutView extends StatefulWidget {
  const Efw200LayoutView({Key? key}) : super(key: key);

  @override
  State<Efw200LayoutView> createState() => _Efw200LayoutViewState();
}

class _Efw200LayoutViewState extends State<Efw200LayoutView> {
  @override
  void initState() {
    super.initState();
    // Daftarkan instance ini ke Efw200ProgressService
    Efw200ProgressService.instance.setEfw200View(this);
  }

  // Exercise methods - siswa akan mengisi ini di file efw200_exercises.dart
  Widget? exercise1() => Efw200Exercises.exercise1();
  Widget? exercise2() => Efw200Exercises.exercise2();
  Widget? exercise3() => Efw200Exercises.exercise3();
  Widget? exercise4() => Efw200Exercises.exercise4();
  Widget? exercise5() => Efw200Exercises.exercise5();
  Widget? exercise6() => Efw200Exercises.exercise6();
  Widget? exercise7() => Efw200Exercises.exercise7();
  Widget? exercise8() => Efw200Exercises.exercise8();
  Widget? exercise9() => Efw200Exercises.exercise9();
  Widget? exercise10() => Efw200Exercises.exercise10();
  Widget? exercise11() => Efw200Exercises.exercise11();
  Widget? exercise12() => Efw200Exercises.exercise12();
  Widget? exercise13() => Efw200Exercises.exercise13();
  Widget? exercise14() => Efw200Exercises.exercise14();
  Widget? exercise15() => Efw200Exercises.exercise15();
  Widget? exercise16() => Efw200Exercises.exercise16();
  Widget? exercise17() => Efw200Exercises.exercise17();
  Widget? exercise18() => Efw200Exercises.exercise18();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5C6FF),
      appBar: AppBar(
        title: const Text("EFW200 - Layout"),
        backgroundColor: const Color(0xFFAD88C6),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Debug Info Card
              Card(
                color: Colors.yellow[300],
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text('Debug Info',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Builder(
                        builder: (context) {
                          Widget? testWidget = exercise1();
                          bool isValid =
                              Efw200Validator.validateExercise(1, testWidget);
                          return Column(
                            children: [
                              Text(
                                  'Exercise 1 Widget: ${testWidget?.runtimeType}'),
                              Text('Is Valid: $isValid'),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Exercise Cards
              _buildExerciseCard(rowLabelEfw200(exercise1, 1)),
              _buildExerciseCard(rowLabelEfw200(exercise2, 2)),
              _buildExerciseCard(rowLabelEfw200(exercise3, 3)),
              _buildExerciseCard(rowLabelEfw200(exercise4, 4)),
              _buildExerciseCard(rowLabelEfw200(exercise5, 5)),
              _buildExerciseCard(rowLabelEfw200(exercise6, 6)),
              _buildExerciseCard(rowLabelEfw200(exercise7, 7)),
              _buildExerciseCard(rowLabelEfw200(exercise8, 8)),
              _buildExerciseCard(rowLabelEfw200(exercise9, 9)),
              _buildExerciseCard(rowLabelEfw200(exercise10, 10)),
              _buildExerciseCard(rowLabelEfw200(exercise11, 11)),
              _buildExerciseCard(rowLabelEfw200(exercise12, 12)),
              _buildExerciseCard(rowLabelEfw200(exercise13, 13)),
              _buildExerciseCard(rowLabelEfw200(exercise14, 14)),
              _buildExerciseCard(rowLabelEfw200(exercise15, 15)),
              _buildExerciseCard(rowLabelEfw200(exercise16, 16)),
              _buildExerciseCard(rowLabelEfw200(exercise17, 17)),
              _buildExerciseCard(rowLabelEfw200(exercise18, 18)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseCard(Widget child) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: child,
      ),
    );
  }
}
