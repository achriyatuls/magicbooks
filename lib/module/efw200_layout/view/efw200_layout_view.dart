import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../controller/efw200_layout_controller.dart';

class Efw200LayoutView extends StatefulWidget {
  const Efw200LayoutView({Key? key}) : super(key: key);

  // Exercise methods - siswa akan mengisi ini
  bool? exercise1() {
    // Buat sebuah Row dengan 3 Container berwarna berbeda
    return false;
  }

  bool? exercise2() {
    // Buat sebuah Column dengan 3 Text widget
    return false;
  }

  bool? exercise3() {
    // Buat sebuah Stack dengan 2 Container yang overlap
    return false;
  }

  bool? exercise4() {
    // Buat sebuah Positioned widget di dalam Stack
    return false;
  }

  bool? exercise5() {
    // Buat sebuah Wrap dengan 5 Container kecil
    return false;
  }

  bool? exercise6() {
    // Buat sebuah Expanded widget di dalam Row
    return false;
  }

  bool? exercise7() {
    // Buat sebuah Flexible widget di dalam Column
    return false;
  }

  bool? exercise8() {
    // Buat sebuah SizedBox dengan lebar dan tinggi tertentu
    return false;
  }

  bool? exercise9() {
    // Buat sebuah Container dengan margin dan padding
    return false;
  }

  bool? exercise10() {
    // Buat sebuah Padding dengan EdgeInsets.symmetric
    return false;
  }

  bool? exercise11() {
    // Buat sebuah Center widget dengan child Container
    return false;
  }

  bool? exercise12() {
    // Buat sebuah Align dengan alignment tertentu
    return false;
  }

  bool? exercise13() {
    // Buat sebuah AspectRatio dengan ratio 16:9
    return false;
  }

  bool? exercise14() {
    // Buat sebuah FractionallySizedBox dengan widthFactor 0.5
    return false;
  }

  bool? exercise15() {
    // Buat sebuah LayoutBuilder untuk responsive layout
    return false;
  }

  @override
  State<Efw200LayoutView> createState() => Efw200LayoutController();

  Widget build(context, Efw200LayoutController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("EFW200 - Layout"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              rowLabel(exercise1),
              rowLabel(exercise2),
              rowLabel(exercise3),
              rowLabel(exercise4),
              rowLabel(exercise5),
              rowLabel(exercise6),
              rowLabel(exercise7),
              rowLabel(exercise8),
              rowLabel(exercise9),
              rowLabel(exercise10),
              rowLabel(exercise11),
              rowLabel(exercise12),
              rowLabel(exercise13),
              rowLabel(exercise14),
              rowLabel(exercise15),
            ],
          ),
        ),
      ),
    );
  }
}
