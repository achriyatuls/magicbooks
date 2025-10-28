import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

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

  // Exercise methods - siswa akan mengisi ini
  Widget? exercise1() {
    // INSTRUKSI: Buat sebuah Row dengan 3 Container berwarna berbeda
    return Row(
      children: [
        Container(width: 50, height: 50, color: Colors.red),
        Container(width: 50, height: 50, color: Colors.green),
        Container(width: 50, height: 50, color: Colors.blue),
      ],
    );
  }

  Widget? exercise2() {
    // INSTRUKSI: Buat sebuah Column dengan 3 Text widget
    return Column(
      children: [
        Text("Text 1"),
        Text("Text 2"),
        Text("Text 3"),
      ],
    );
  }

  Widget? exercise3() {
    // INSTRUKSI: Buat sebuah Stack dengan 2 Container yang overlap
    return Stack(
      children: [
        Container(width: 100, height: 100, color: Colors.red),
        Container(width: 50, height: 50, color: Colors.green),
      ],
    );
  }

  Widget? exercise4() {
    // Instruksi: Buat sebuah Positioned widget di dalam Stack
    return Stack(
      children: [
        Container(width: 100, height: 100, color: Colors.red),
        Positioned(
            top: 20,
            left: 20,
            child: Container(width: 50, height: 50, color: Colors.green)),
      ],
    );
  }

  Widget? exercise5() {
    // Instruksi: Buat sebuah Wrap dengan 5 Container kecil
    return Wrap(
      children: [
        Container(width: 50, height: 50, color: Colors.red),
        Container(width: 50, height: 50, color: Colors.green),
        Container(width: 50, height: 50, color: Colors.blue),
        Container(width: 50, height: 50, color: Colors.yellow),
        Container(width: 50, height: 50, color: Colors.purple),
      ],
    );
  }

  Widget? exercise6() {
    // Instruksi: Buat sebuah Expanded widget di dalam Row
    return Row(
      children: [
        Expanded(child: Container(width: 50, height: 50, color: Colors.red)),
        Expanded(child: Container(width: 50, height: 50, color: Colors.green)),
      ],
    );
  }

  Widget? exercise7() {
// Instruksi: Buat sebuah Flexible widget di dalam Column
    return Column(
      children: [
        Flexible(child: Container(width: 50, height: 50, color: Colors.red)),
        Flexible(child: Container(width: 50, height: 50, color: Colors.green)),
      ],
    );
  }

  Widget? exercise8() {
    // Instruksi: Buat sebuah SizedBox dengan lebar dan tinggi tertentu
    return SizedBox(width: 100, height: 100);
  }

  Widget? exercise9() {
    // Instruksi: Buat sebuah Container dengan margin dan padding
    return Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10));
  }

  Widget? exercise10() {
    // Instruksi: Buat sebuah Padding dengan EdgeInsets.symmetric
    return Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10));
  }

  Widget? exercise11() {
// Instruksi: Buat sebuah Center widget dengan child Container
    return Center(child: Container(width: 50, height: 50, color: Colors.red));
  }

  Widget? exercise12() {
// Instruksi: Buat sebuah Align dengan alignment tertentu
    return Align(
        alignment: Alignment.topLeft,
        child: Container(width: 50, height: 50, color: Colors.red));
  }

  Widget? exercise13() {
// Instruksi: Buat sebuah AspectRatio dengan ratio 16:9
    return AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(width: 50, height: 50, color: Colors.red));
  }

  Widget? exercise14() {
// Instruksi: Buat sebuah FractionallySizedBox dengan widthFactor 0.5
    return FractionallySizedBox(
        widthFactor: 0.5,
        child: Container(width: 50, height: 50, color: Colors.red));
  }

  Widget? exercise15() {
// Instruksi: Buat sebuah LayoutBuilder untuk responsive layout
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          color: Colors.red);
    });
  }

  Widget? exercise16() {
    // Instruksi: Buat sebuah Transform widget dengan rotate
    return Transform.rotate(
      angle: 0.5,
      child: Container(width: 50, height: 50, color: Colors.blue),
    );
  }

  Widget? exercise17() {
    // Instruksi: Buat sebuah Transform widget dengan scale
    return Transform.scale(
      scale: 1.5,
      child: Container(width: 50, height: 50, color: Colors.green),
    );
  }

  Widget? exercise18() {
    // Instruksi: Buat sebuah Transform widget dengan translate
    return Transform.translate(
      offset: Offset(10, 10),
      child: Container(width: 50, height: 50, color: Colors.purple),
    );
  }

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
