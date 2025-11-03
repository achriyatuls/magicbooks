import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

class Efw400GridView extends StatefulWidget {
  const Efw400GridView({Key? key}) : super(key: key);

  // Exercise methods - siswa akan mengisi ini di file efw400_exercises.dart
  Widget? exercise1() => Efw400Exercises.exercise1();
  Widget? exercise2() => Efw400Exercises.exercise2();
  Widget? exercise3() => Efw400Exercises.exercise3();
  Widget? exercise4() => Efw400Exercises.exercise4();
  Widget? exercise5() => Efw400Exercises.exercise5();
  Widget? exercise6() => Efw400Exercises.exercise6();
  Widget? exercise7() => Efw400Exercises.exercise7();
  Widget? exercise8() => Efw400Exercises.exercise8();
  Widget? exercise9() => Efw400Exercises.exercise9();
  Widget? exercise10() => Efw400Exercises.exercise10();
  Widget? exercise11() => Efw400Exercises.exercise11();
  Widget? exercise12() => Efw400Exercises.exercise12();
  Widget? exercise13() => Efw400Exercises.exercise13();
  Widget? exercise14() => Efw400Exercises.exercise14();
  Widget? exercise15() => Efw400Exercises.exercise15();
  Widget? exercise16() => Efw400Exercises.exercise16();

  @override
  State<Efw400GridView> createState() => Efw400GridController();

  Widget build(context, Efw400GridController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: const Color(0xFFD6CBFF),
      appBar: AppBar(
        title: const Text("EFW400 - GridView"),
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
              _buildExerciseCard(rowLabelEfw400(exercise1, 1)),
              _buildExerciseCard(rowLabelEfw400(exercise2, 2)),
              _buildExerciseCard(rowLabelEfw400(exercise3, 3)),
              _buildExerciseCard(rowLabelEfw400(exercise4, 4)),
              _buildExerciseCard(rowLabelEfw400(exercise5, 5)),
              _buildExerciseCard(rowLabelEfw400(exercise6, 6)),
              _buildExerciseCard(rowLabelEfw400(exercise7, 7)),
              _buildExerciseCard(rowLabelEfw400(exercise8, 8)),
              _buildExerciseCard(rowLabelEfw400(exercise9, 9)),
              _buildExerciseCard(rowLabelEfw400(exercise10, 10)),
              _buildExerciseCard(rowLabelEfw400(exercise11, 11)),
              _buildExerciseCard(rowLabelEfw400(exercise12, 12)),
              _buildExerciseCard(rowLabelEfw400(exercise13, 13)),
              _buildExerciseCard(rowLabelEfw400(exercise14, 14)),
              _buildExerciseCard(rowLabelEfw400(exercise15, 15)),
              _buildExerciseCard(rowLabelEfw400(exercise16, 16)),
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
