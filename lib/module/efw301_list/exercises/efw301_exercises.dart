// LEMBAR KERJA SISWA - EFW301 LIST (ADVANCED)
//
// ════════════════════════════════════════════════════════════════════════════
// PETUNJUK PENGGUNAAN:
// ════════════════════════════════════════════════════════════════════════════
//
// 1. File ini BOLEH diubah untuk menjawab exercise
// 2. Tulis kode HANYA di area yang ditandai dengan "TULIS KODE DI SINI"
// 3. JANGAN mengubah:
//    - Nama function
//    - Parameter function
//    - Return statement (kecuali diminta)
//
// ════════════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';

/// Class yang berisi jawaban siswa untuk semua exercise
class Efw301Exercises {
  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 1: Dismissible ListView
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: ListView dengan Dismissible
  static Widget? exercise1() {
    // TULIS KODE DI SINI:
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

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 2: RefreshIndicator
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: RefreshIndicator membungkus ListView
  static Widget? exercise2() {
    // TULIS KODE DI SINI:
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [ListTile(title: Text('Pull to refresh'))],
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 3: AnimatedList
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: AnimatedList
  static Widget? exercise3() {
    // TULIS KODE DI SINI:
    return AnimatedList(
      initialItemCount: 0,
      itemBuilder: (context, index, animation) => const SizedBox.shrink(),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 4: ReorderableListView
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: ReorderableListView
  static Widget? exercise4() {
    // TULIS KODE DI SINI:
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

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 5: CustomScrollView with SliverList
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: CustomScrollView dengan SliverList
  static Widget? exercise5() {
    // TULIS KODE DI SINI:
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

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 6: CustomScrollView generic
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: CustomScrollView generic
  static Widget? exercise6() {
    // TULIS KODE DI SINI:
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

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 7: PageView
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: PageView
  static Widget? exercise7() {
    // TULIS KODE DI SINI:
    return PageView(
      children: const [
        Center(child: Text('Page 1')),
        Center(child: Text('Page 2')),
      ],
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 8: DefaultTabController + TabBarView
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: DefaultTabController + TabBarView
  static Widget? exercise8() {
    // TULIS KODE DI SINI:
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

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 9: NestedScrollView
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: NestedScrollView
  static Widget? exercise9() {
    // TULIS KODE DI SINI:
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
}
