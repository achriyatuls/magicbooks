import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../controller/efw100_common_widget_controller.dart';

class Efw100CommonWidgetView extends StatefulWidget {
  const Efw100CommonWidgetView({Key? key}) : super(key: key);

  // Exercise methods - siswa akan mengisi ini
  bool? exercise1() {
    // Buat sebuah Container dengan lebar 100, tinggi 100, dan warna merah
    return false;
  }

  bool? exercise2() {
    // Buat sebuah Text dengan isi "Hello Flutter" dan ukuran font 24
    return false;
  }

  bool? exercise3() {
    // Buat sebuah Icon dengan Icons.home dan warna biru
    return false;
  }

  bool? exercise4() {
    // Buat sebuah Image.asset dengan path "assets/images/image1.jpg"
    return false;
  }

  bool? exercise5() {
    // Buat sebuah CircleAvatar dengan radius 30 dan warna hijau
    return false;
  }

  bool? exercise6() {
    // Buat sebuah Card dengan padding 16 dan child Text "Card Content"
    return false;
  }

  bool? exercise7() {
    // Buat sebuah ListTile dengan title "List Tile" dan subtitle "Subtitle"
    return false;
  }

  bool? exercise8() {
    // Buat sebuah ElevatedButton dengan text "Click Me"
    return false;
  }

  bool? exercise9() {
    // Buat sebuah FloatingActionButton dengan icon Icons.add
    return false;
  }

  bool? exercise10() {
    // Buat sebuah AppBar dengan title "My App"
    return false;
  }

  bool? exercise11() {
    // Buat sebuah Scaffold dengan AppBar dan body Text "Hello World"
    return false;
  }

  bool? exercise12() {
    // Buat sebuah SizedBox dengan lebar 200 dan tinggi 100
    return false;
  }

  bool? exercise13() {
    // Buat sebuah Padding dengan padding EdgeInsets.all(16) dan child Text "Padded Text"
    return false;
  }

  bool? exercise14() {
    // Buat sebuah Center dengan child Text "Centered Text"
    return false;
  }

  bool? exercise15() {
    // Buat sebuah Align dengan alignment Alignment.centerRight dan child Text "Right Aligned"
    return false;
  }

  @override
  State<Efw100CommonWidgetView> createState() => Efw100CommonWidgetController();

  Widget build(context, Efw100CommonWidgetController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: const Color(0xFFD5C6FF),
      appBar: AppBar(
        title: const Text("EFW100 - Common Widget"),
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
              _buildExerciseCard(rowLabel(exercise13)),
              _buildExerciseCard(rowLabel(exercise14)),
              _buildExerciseCard(rowLabel(exercise15)),
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
