import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

class Efw301ListView extends StatefulWidget {
  const Efw301ListView({Key? key}) : super(key: key);

  // Exercise methods - siswa akan mengisi ini
  Widget? exercise1() {
    // ListView dengan Dismissible
    List<String> items = ["Item 1", "Item 2", "Item 3"];
    return ListView(
      children: List.generate(
        items.length,
        (i) => Dismissible(
          key: ValueKey('d-$i'),
          background: Container(color: Colors.redAccent),
          onDismissed: (_) {},
          child: ListTile(title: Text(items[i])),
        ),
      ),
    );
  }

  Widget? exercise2() {
    // RefreshIndicator membungkus ListView
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [ListTile(title: Text('Pull to refresh'))],
      ),
    );
  }

  Widget? exercise3() {
    // AnimatedList
    return AnimatedList(
      initialItemCount: 0,
      itemBuilder: (context, index, animation) => const SizedBox.shrink(),
    );
  }

  Widget? exercise4() {
    // ReorderableListView
    return ReorderableListView(
      onReorder: (oldIdx, newIdx) {},
      children: List.generate(
        3,
        (i) => ListTile(
          key: ValueKey('r-$i'),
          title: Text('Item ${i + 1}'),
        ),
      ),
    );
  }

  Widget? exercise5() {
    // CustomScrollView dengan SliverList
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            const ListTile(title: Text('Sliver item 1')),
            const ListTile(title: Text('Sliver item 2')),
          ]),
        ),
      ],
    );
  }

  Widget? exercise6() {
    // CustomScrollView generic
    return CustomScrollView(
      slivers: const [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text('Content'),
          ),
        ),
      ],
    );
  }

  Widget? exercise7() {
    // PageView
    return PageView(
      children: const [
        Center(child: Text('Page 1')),
        Center(child: Text('Page 2')),
      ],
    );
  }

  Widget? exercise8() {
    // DefaultTabController + TabBarView
    return const DefaultTabController(
      length: 2,
      child: TabBarView(
        children: [
          Center(child: Text('Tab 1')),
          Center(child: Text('Tab 2')),
        ],
      ),
    );
  }

  Widget? exercise9() {
    // NestedScrollView
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => const [
        SliverAppBar(
          title: Text('Header'),
          pinned: true,
        ),
      ],
      body: ListView(
        children: const [
          ListTile(title: Text('Body item')),
        ],
      ),
    );
  }

  @override
  State<Efw301ListView> createState() => Efw301ListController();

  Widget build(context, Efw301ListController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: const Color(0xFFEAE0FF),
      appBar: AppBar(
        title: const Text("EFW301 - ListView - Advanced"),
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
