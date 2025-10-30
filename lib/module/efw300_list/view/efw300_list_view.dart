import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../controller/efw300_list_controller.dart';

class Efw300ListView extends StatefulWidget {
  const Efw300ListView({Key? key}) : super(key: key);

  // Exercise methods - siswa akan mengisi ini (mengembalikan Widget?)
  Widget? exercise1() {
    // Buat ListView dengan 5 ListTile
    List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }

  Widget? exercise2() {
    // Buat ListView.builder dengan 10 item
    List<String> items = [
      "Item 1",
      "Item 2",
      "Item 3",
      "Item 4",
      "Item 5",
      "Item 6",
      "Item 7",
      "Item 8",
      "Item 9",
      "Item 10"
    ];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }

  Widget? exercise3() {
    // Buat ListView.separated dengan separator Divider
    List<String> items = [
      "Item 1",
      "Item 2",
      "Item 3",
      "Item 4",
      "Item 5",
      "Item 6",
      "Item 7",
      "Item 8",
      "Item 9",
      "Item 10"
    ];
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  Widget? exercise4() {
    // Buat ListView dengan scrollDirection horizontal
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        5,
        (i) => Container(
          width: 80,
          margin: const EdgeInsets.all(8),
          color: Colors.purpleAccent.withOpacity(0.2),
          child: Center(child: Text('Item ${i + 1}')),
        ),
      ),
    );
  }

  Widget? exercise5() {
    // Buat ListView dengan physics BouncingScrollPhysics
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: List.generate(
        5,
        (i) => ListTile(title: Text('Item ${i + 1}')),
      ),
    );
  }

  Widget? exercise6() {
    // Buat ListView dengan controller ScrollController
    return ListView(
      controller: ScrollController(),
      children: List.generate(
        5,
        (i) => ListTile(title: Text('Item ${i + 1}')),
      ),
    );
  }

  Widget? exercise7() {
    // Buat ListView dengan shrinkWrap true
    List<String> items = [
      "Item 1",
      "Item 2",
      "Item 3",
      "Item 4",
      "Item 5",
      "Item 6",
      "Item 7",
      "Item 8",
      "Item 9",
      "Item 10"
    ];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }

  Widget? exercise8() {
    // Buat ListView dengan padding EdgeInsets.all(16)
    return ListView(
      padding: const EdgeInsets.all(16),
      children: List.generate(
        5,
        (i) => ListTile(title: Text('Item ${i + 1}')),
      ),
    );
  }

  Widget? exercise9() {
    // Buat ListView dengan itemExtent 100
    return ListView(
      itemExtent: 100,
      children: List.generate(
        5,
        (i) => ListTile(title: Text('Item ${i + 1}')),
      ),
    );
  }

  Widget? exercise10() {
    // Buat ListView dengan cacheExtent 200
    List<String> items = [
      "Item 1",
      "Item 2",
      "Item 3",
      "Item 4",
      "Item 5",
      "Item 6",
      "Item 7",
      "Item 8",
      "Item 9",
      "Item 10"
    ];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }

  Widget? exercise11() {
    // Buat ListView dengan addAutomaticKeepAlives true
    List<String> items = [
      "Item 1",
      "Item 2",
      "Item 3",
      "Item 4",
      "Item 5",
      "Item 6",
      "Item 7",
      "Item 8",
      "Item 9",
      "Item 10"
    ];
    return ListView.builder(
      addAutomaticKeepAlives: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }

  Widget? exercise12() {
    // Buat ListView dengan addRepaintBoundaries true
    List<String> items = [
      "Item 1",
      "Item 2",
      "Item 3",
      "Item 4",
      "Item 5",
      "Item 6",
      "Item 7",
      "Item 8",
      "Item 9",
      "Item 10",
    ];
    return ListView.builder(
      addRepaintBoundaries: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }

  Widget? exercise13() {
    // Buat ListView dengan reverse: true
    return ListView(
      reverse: true,
      children: List.generate(
        5,
        (i) => ListTile(title: Text('Item ${i + 1}')),
      ),
    );
  }

  Widget? exercise14() {
    // Buat ListView dengan primary: false dan shrinkWrap: true
    return ListView(
      primary: false,
      shrinkWrap: true,
      children: List.generate(
        5,
        (i) => ListTile(title: Text('Item ${i + 1}')),
      ),
    );
  }

  Widget? exercise15() {
    // Buat ListView.custom dengan SliverChildListDelegate
    return ListView.custom(
      childrenDelegate: SliverChildListDelegate(
        List.generate(
          5,
          (i) => ListTile(title: Text('Item ${i + 1}')),
        ),
      ),
    );
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
