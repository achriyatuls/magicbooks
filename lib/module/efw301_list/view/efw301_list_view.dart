import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../controller/efw301_list_controller.dart';

class Efw301ListView extends StatefulWidget {
  const Efw301ListView({Key? key}) : super(key: key);

  // Exercise methods - siswa akan mengisi ini
  bool? exercise1() {
    // Buat ListView dengan Dismissible widget
    return false;
  }

  bool? exercise2() {
    // Buat ListView dengan RefreshIndicator
    return false;
  }

  bool? exercise3() {
    // Buat ListView dengan AnimatedList
    return false;
  }

  bool? exercise4() {
    // Buat ListView dengan ReorderableListView
    return false;
  }

  bool? exercise5() {
    // Buat ListView dengan SliverList
    return false;
  }

  bool? exercise6() {
    // Buat ListView dengan CustomScrollView
    return false;
  }

  bool? exercise7() {
    // Buat ListView dengan PageView
    return false;
  }

  bool? exercise8() {
    // Buat ListView dengan TabBarView
    return false;
  }

  bool? exercise9() {
    // Buat ListView dengan NestedScrollView
    return false;
  }

  @override
  State<Efw301ListView> createState() => Efw301ListController();

  Widget build(context, Efw301ListController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: const Color(0xFFF0E6FF),
      appBar: AppBar(
        title: const Text("EFW301 - ListView Advanced"),
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
              _buildExerciseCard(rowLabel(exercise1)),
              _buildExerciseCard(rowLabel(exercise2)),
              _buildExerciseCard(rowLabel(exercise3)),
              _buildExerciseCard(rowLabel(exercise4)),
              _buildExerciseCard(rowLabel(exercise5)),
              _buildExerciseCard(rowLabel(exercise6)),
              _buildExerciseCard(rowLabel(exercise7)),
              _buildExerciseCard(rowLabel(exercise8)),
              _buildExerciseCard(rowLabel(exercise9)),
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
