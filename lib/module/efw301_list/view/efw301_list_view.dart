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
      appBar: AppBar(
        title: const Text("EFW301 - ListView Advanced"),
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
            ],
          ),
        ),
      ),
    );
  }
}
