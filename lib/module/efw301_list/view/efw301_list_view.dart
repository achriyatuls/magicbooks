import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../exercises/efw301_exercises.dart';

class Efw301ListView extends StatefulWidget {
  const Efw301ListView({Key? key}) : super(key: key);

  // Exercise methods - siswa akan mengisi ini di file efw301_exercises.dart
  Widget? exercise1() => Efw301Exercises.exercise1();
  Widget? exercise2() => Efw301Exercises.exercise2();
  Widget? exercise3() => Efw301Exercises.exercise3();
  Widget? exercise4() => Efw301Exercises.exercise4();
  Widget? exercise5() => Efw301Exercises.exercise5();
  Widget? exercise6() => Efw301Exercises.exercise6();
  Widget? exercise7() => Efw301Exercises.exercise7();
  Widget? exercise8() => Efw301Exercises.exercise8();
  Widget? exercise9() => Efw301Exercises.exercise9();

  @override
  State<Efw301ListView> createState() => Efw301ListController();

  Widget build(context, Efw301ListController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: const Color(0xFFEAE0FF),
      appBar: AppBar(
        title: const Text("EFW301 - ListView - Advanced"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildExerciseCard(rowLabelEfw300(exercise1, 1)),
              _buildExerciseCard(rowLabelEfw300(exercise2, 2)),
              _buildExerciseCard(rowLabelEfw300(exercise3, 3)),
              _buildExerciseCard(rowLabelEfw300(exercise4, 4)),
              _buildExerciseCard(rowLabelEfw300(exercise5, 5)),
              _buildExerciseCard(rowLabelEfw300(exercise6, 6)),
              _buildExerciseCard(rowLabelEfw300(exercise7, 7)),
              _buildExerciseCard(rowLabelEfw300(exercise8, 8)),
              _buildExerciseCard(rowLabelEfw300(exercise9, 9)),
              const SizedBox(height: 20),
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
