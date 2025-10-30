import 'package:flutter/material.dart';
import '../../module/efw301_list/validator/efw301_validator.dart';

class Efw301ProgressService {
  static Efw301ProgressService? _instance;
  static Efw301ProgressService get instance =>
      _instance ??= Efw301ProgressService._();
  Efw301ProgressService._();

  dynamic _efw301View;

  void setEfw301View(dynamic view) {
    _efw301View = view;
  }

  dynamic get efw301View => _efw301View;

  Map<String, bool> getExerciseStatus({bool useDefault = true}) {
    try {
      Map<String, bool> status = {};
      for (int i = 1; i <= 9; i++) {
        final exerciseId = 'EFW301_ex$i';
        Widget? widget;

        if (_efw301View != null) {
          // Call exercise methods from view
          switch (i) {
            case 1:
              widget = _efw301View.exercise1();
              break;
            case 2:
              widget = _efw301View.exercise2();
              break;
            case 3:
              widget = _efw301View.exercise3();
              break;
            case 4:
              widget = _efw301View.exercise4();
              break;
            case 5:
              widget = _efw301View.exercise5();
              break;
            case 6:
              widget = _efw301View.exercise6();
              break;
            case 7:
              widget = _efw301View.exercise7();
              break;
            case 8:
              widget = _efw301View.exercise8();
              break;
            case 9:
              widget = _efw301View.exercise9();
              break;
            // ... tambahkan untuk semua exercises
          }
        } else {
          // Use default widgets
          widget = _getDefaultWidget(i);
        }

        status[exerciseId] = Efw301Validator.validateExercise(i, widget);
      }
      return status;
    } catch (e) {
      print('Error getting EFW301 status: $e');
      return {};
    }
  }

  Widget? _getDefaultWidget(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        // ListView dengan Dismissible item
        return ListView(
          children: List.generate(
            3,
            (i) => Dismissible(
              key: ValueKey('d-$i'),
              background: Container(color: Colors.redAccent),
              onDismissed: (_) {},
              child: ListTile(title: Text('Item ${i + 1}')),
            ),
          ),
        );
      case 2:
        // RefreshIndicator membungkus ListView
        return RefreshIndicator(
          onRefresh: () async {},
          child: ListView(
            children: const [
              ListTile(title: Text('Pull to refresh')),
            ],
          ),
        );
      case 3:
        // AnimatedList (minimal)
        return AnimatedList(
          initialItemCount: 0,
          itemBuilder: (context, index, animation) => const SizedBox.shrink(),
        );
      case 4:
        // ReorderableListView
        return ReorderableListView(
          onReorder: (oldIndex, newIndex) {},
          children: List.generate(
            3,
            (i) => ListTile(
              key: ValueKey('r-$i'),
              title: Text('Item ${i + 1}'),
            ),
          ),
        );
      case 5:
        // SliverList di dalam CustomScrollView
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
      case 6:
        // CustomScrollView generic
        return CustomScrollView(
          slivers: const [
            SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.all(16), child: Text('Content'))),
          ],
        );
      case 7:
        // PageView
        return PageView(
          children: const [
            Center(child: Text('Page 1')),
            Center(child: Text('Page 2')),
          ],
        );
      case 8:
        // TabBarView (butuh DefaultTabController untuk berfungsi penuh; tipe cek cukup TabBarView)
        return const DefaultTabController(
          length: 2,
          child: TabBarView(
            children: [
              Center(child: Text('Tab 1')),
              Center(child: Text('Tab 2')),
            ],
          ),
        );
      case 9:
        // NestedScrollView
        return NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
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
      default:
        return null;
    }
  }
}
