import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../controller/efw300_list_controller.dart';

class Efw300ListView extends StatefulWidget {
  const Efw300ListView({Key? key}) : super(key: key);

  // Exercise methods - siswa akan mengisi ini
  bool? exercise1() {
    // Buat ListView dengan 5 ListTile
    return false;
  }

  bool? exercise2() {
    // Buat ListView.builder dengan 10 item
    return false;
  }

  bool? exercise3() {
    // Buat ListView.separated dengan separator Divider
    return false;
  }

  bool? exercise4() {
    // Buat ListView dengan scrollDirection horizontal
    return false;
  }

  bool? exercise5() {
    // Buat ListView dengan physics BouncingScrollPhysics
    return false;
  }

  bool? exercise6() {
    // Buat ListView dengan controller ScrollController
    return false;
  }

  bool? exercise7() {
    // Buat ListView dengan shrinkWrap true
    return false;
  }

  bool? exercise8() {
    // Buat ListView dengan padding EdgeInsets.all(16)
    return false;
  }

  bool? exercise9() {
    // Buat ListView dengan itemExtent 100
    return false;
  }

  bool? exercise10() {
    // Buat ListView dengan cacheExtent 200
    return false;
  }

  bool? exercise11() {
    // Buat ListView dengan addAutomaticKeepAlives true
    return false;
  }

  bool? exercise12() {
    // Buat ListView dengan addRepaintBoundaries true
    return false;
  }

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
              _buildExerciseCard(rowLabel(exercise1)),
              _buildExerciseCard(rowLabel(exercise2)),
              _buildExerciseCard(rowLabel(exercise3)),
              _buildExerciseCard(rowLabel(exercise4)),
              _buildExerciseCard(rowLabel(exercise5)),
              _buildExerciseCard(rowLabel(exercise6)),
              _buildExerciseCard(rowLabel(exercise7)),
              _buildExerciseCard(rowLabel(exercise8)),
              _buildExerciseCard(rowLabel(exercise9)),
              _buildExerciseCard(rowLabel(exercise10)),
              _buildExerciseCard(rowLabel(exercise11)),
              _buildExerciseCard(rowLabel(exercise12)),
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
