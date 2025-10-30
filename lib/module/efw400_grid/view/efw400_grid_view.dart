import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import 'package:magicbook/shared/widget/row_label/row_label_efw400.dart';
import '../controller/efw400_grid_controller.dart';

class Efw400GridView extends StatefulWidget {
  const Efw400GridView({Key? key}) : super(key: key);

  // Exercise methods - siswa akan mengisi ini
  Widget? exercise1() {
    // Buat GridView.count dengan crossAxisCount 2 dan 6 item
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      children: List.generate(
        6,
        (i) => Container(color: Colors.purple.withOpacity(0.1)),
      ),
    );
  }

  Widget? exercise2() {
    // Buat GridView.builder dengan crossAxisCount 3
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemCount: 9,
      itemBuilder: (_, __) => Container(color: Colors.purple.withOpacity(0.1)),
    );
  }

  Widget? exercise3() {
    // Buat GridView dengan crossAxisSpacing dan mainAxisSpacing
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      children: List.generate(
        6,
        (i) => Container(color: Colors.purple.withOpacity(0.1)),
      ),
    );
  }

  Widget? exercise4() {
    // Buat GridView dengan childAspectRatio 1.5
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      children: List.generate(
        6,
        (i) => Container(color: Colors.purple.withOpacity(0.1)),
      ),
    );
  }

  Widget? exercise5() {
    // Buat GridView dengan maxCrossAxisExtent 200
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      children: List.generate(
        6,
        (i) => Container(color: Colors.purple.withOpacity(0.1)),
      ),
    );
  }

  Widget? exercise6() {
    // Buat GridView dengan scrollDirection Axis.horizontal
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      children: List.generate(
        6,
        (i) => Container(color: Colors.purple.withOpacity(0.1)),
      ),
    );
  }

  Widget? exercise7() {
    // Buat GridView dengan physics BouncingScrollPhysics
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      children: List.generate(
        6,
        (i) => Container(color: Colors.purple.withOpacity(0.1)),
      ),
    );
  }

  Widget? exercise8() {
    // Buat GridView dengan padding EdgeInsets.all(16)
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
    );
  }

  Widget? exercise9() {
    // Buat GridView dengan cacheExtent 200
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
        (i) => Container(color: Colors.purple.withOpacity(0.1)),
      ),
    );
  }

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
