import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../controller/efw400_grid_controller.dart';

class Efw400GridView extends StatefulWidget {
  const Efw400GridView({Key? key}) : super(key: key);

  // Exercise methods - siswa akan mengisi ini
  bool? exercise1() {
    // Buat GridView.count dengan crossAxisCount 2 dan 6 item
    return false;
  }

  bool? exercise2() {
    // Buat GridView.builder dengan crossAxisCount 3
    return false;
  }

  bool? exercise3() {
    // Buat GridView dengan crossAxisSpacing dan mainAxisSpacing
    return false;
  }

  bool? exercise4() {
    // Buat GridView dengan childAspectRatio 1.5
    return false;
  }

  bool? exercise5() {
    // Buat GridView dengan maxCrossAxisExtent 200
    return false;
  }

  bool? exercise6() {
    // Buat GridView dengan scrollDirection Axis.horizontal
    return false;
  }

  bool? exercise7() {
    // Buat GridView dengan physics BouncingScrollPhysics
    return false;
  }

  bool? exercise8() {
    // Buat GridView dengan padding EdgeInsets.all(16)
    return false;
  }

  bool? exercise9() {
    // Buat GridView dengan cacheExtent 200
    return false;
  }

  @override
  State<Efw400GridView> createState() => Efw400GridController();

  Widget build(context, Efw400GridController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("EFW400 - GridView"),
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
