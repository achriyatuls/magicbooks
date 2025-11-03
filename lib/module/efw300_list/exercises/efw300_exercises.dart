// LEMBAR KERJA SISWA - EFW300 LIST
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
class Efw300Exercises {
  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 1: ListView.builder with 5 items
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat ListView dengan 5 ListTile
  static Widget? exercise1() {
    // TULIS KODE DI SINI:
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

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 2: ListView.builder with 10 items
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat ListView.builder dengan 10 item
  static Widget? exercise2() {
    // TULIS KODE DI SINI:
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

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 3: ListView.separated
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat ListView.separated dengan separator Divider
  static Widget? exercise3() {
    // TULIS KODE DI SINI:
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

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 4: ListView horizontal
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat ListView dengan scrollDirection horizontal
  static Widget? exercise4() {
    // TULIS KODE DI SINI:
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

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 5: ListView with BouncingScrollPhysics
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat ListView dengan physics BouncingScrollPhysics
  static Widget? exercise5() {
    // TULIS KODE DI SINI:
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: List.generate(
        5,
        (i) => ListTile(title: Text('Item ${i + 1}')),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 6: ListView with ScrollController
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat ListView dengan controller ScrollController
  static Widget? exercise6() {
    // TULIS KODE DI SINI:
    return ListView(
      controller: ScrollController(),
      children: List.generate(
        5,
        (i) => ListTile(title: Text('Item ${i + 1}')),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 7: ListView with shrinkWrap
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat ListView dengan shrinkWrap true
  static Widget? exercise7() {
    // TULIS KODE DI SINI:
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

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 8: ListView with padding
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat ListView dengan padding EdgeInsets.all(16)
  static Widget? exercise8() {
    // TULIS KODE DI SINI:
    return ListView(
      padding: const EdgeInsets.all(16),
      children: List.generate(
        5,
        (i) => ListTile(title: Text('Item ${i + 1}')),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 9: ListView with itemExtent
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat ListView dengan itemExtent 100
  static Widget? exercise9() {
    // TULIS KODE DI SINI:
    return ListView(
      itemExtent: 100,
      children: List.generate(
        5,
        (i) => ListTile(title: Text('Item ${i + 1}')),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 10: ListView.builder generic
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat ListView dengan cacheExtent 200
  static Widget? exercise10() {
    // TULIS KODE DI SINI:
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

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 11: ListView with addAutomaticKeepAlives
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat ListView dengan addAutomaticKeepAlives true
  static Widget? exercise11() {
    // TULIS KODE DI SINI:
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

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 12: ListView with addRepaintBoundaries
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat ListView dengan addRepaintBoundaries true
  static Widget? exercise12() {
    // TULIS KODE DI SINI:
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

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 13: ListView with reverse
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat ListView dengan reverse: true
  static Widget? exercise13() {
    // TULIS KODE DI SINI:
    return ListView(
      reverse: true,
      children: List.generate(
        5,
        (i) => ListTile(title: Text('Item ${i + 1}')),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 14: ListView with primary false
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat ListView dengan primary: false dan shrinkWrap: true
  static Widget? exercise14() {
    // TULIS KODE DI SINI:
    return ListView(
      primary: false,
      shrinkWrap: true,
      children: List.generate(
        5,
        (i) => ListTile(title: Text('Item ${i + 1}')),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 15: ListView.custom
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat ListView.custom dengan SliverChildListDelegate
  static Widget? exercise15() {
    // TULIS KODE DI SINI:
    return ListView.custom(
      childrenDelegate: SliverChildListDelegate(
        List.generate(
          5,
          (i) => ListTile(title: Text('Item ${i + 1}')),
        ),
      ),
    );
  }
}
