import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../controller/efw300_list_controller.dart';
import '../exercises/efw300_exercises.dart';

class Efw300ListView extends StatefulWidget {
  const Efw300ListView({Key? key}) : super(key: key);

  // Exercise methods - siswa akan mengisi ini di file efw300_exercises.dart
  Widget? exercise1() => Efw300Exercises.exercise1();
  Widget? exercise2() => Efw300Exercises.exercise2();
  Widget? exercise3() => Efw300Exercises.exercise3();
  Widget? exercise4() => Efw300Exercises.exercise4();
  Widget? exercise5() => Efw300Exercises.exercise5();
  Widget? exercise6() => Efw300Exercises.exercise6();
  Widget? exercise7() => Efw300Exercises.exercise7();
  Widget? exercise8() => Efw300Exercises.exercise8();
  Widget? exercise9() => Efw300Exercises.exercise9();
  Widget? exercise10() => Efw300Exercises.exercise10();
  Widget? exercise11() => Efw300Exercises.exercise11();
  Widget? exercise12() => Efw300Exercises.exercise12();
  Widget? exercise13() => Efw300Exercises.exercise13();
  Widget? exercise14() => Efw300Exercises.exercise14();
  Widget? exercise15() => Efw300Exercises.exercise15();

  @override
  State<Efw300ListView> createState() => Efw300ListController();

  Widget build(context, Efw300ListController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: const Color(0xFFEAE0FF),
      appBar: AppBar(
        title: const Text("EFW300 - ListView"),
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
              _buildExerciseCard(rowLabelEfw300(exercise10, 10)),
              _buildExerciseCard(rowLabelEfw300(exercise11, 11)),
              _buildExerciseCard(rowLabelEfw300(exercise12, 12)),
              _buildExerciseCard(rowLabelEfw300(exercise13, 13)),
              _buildExerciseCard(rowLabelEfw300(exercise14, 14)),
              _buildExerciseCard(rowLabelEfw300(exercise15, 15)),
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
