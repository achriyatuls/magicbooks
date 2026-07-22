// LEMBAR KERJA SISWA - EFW200 LAYOUT
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
class Efw200Exercises {
  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 1: Row
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah Row dengan 3 Container berwarna berbeda
  static Widget? exercise1() {
    // TULIS KODE DI SINI:
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 2: Column
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah Column dengan 3 Text widget
  static Widget? exercise2() {
    // TULIS KODE DI SINI:
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 3: Stack
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah Stack dengan 2 Container yang overlap
  static Widget? exercise3() {
    // TULIS KODE DI SINI:
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 4: Positioned
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah Positioned widget di dalam Stack
  static Widget? exercise4() {
    // TULIS KODE DI SINI:
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

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 5: Wrap
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah Wrap dengan 5 Container kecil
  static Widget? exercise5() {
    // TULIS KODE DI SINI:
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

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 6: Expanded
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah Expanded widget di dalam Row
  static Widget? exercise6() {
    // TULIS KODE DI SINI:
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 7: Flexible
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah Flexible widget di dalam Column
  static Widget? exercise7() {
    // TULIS KODE DI SINI:
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 8: SizedBox
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah SizedBox dengan lebar dan tinggi tertentu
  static Widget? exercise8() {
    // TULIS KODE DI SINI:
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 9: Container with margin and padding
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah Container dengan margin dan padding
  static Widget? exercise9() {
    // TULIS KODE DI SINI:
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 10: Padding
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah Padding dengan EdgeInsets.symmetric
  static Widget? exercise10() {
    // TULIS KODE DI SINI:
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 11: Center
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah Center widget dengan child Container
  static Widget? exercise11() {
    // TULIS KODE DI SINI:
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 12: Align
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah Align dengan alignment tertentu
  static Widget? exercise12() {
    // TULIS KODE DI SINI:
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 13: AspectRatio
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah AspectRatio dengan ratio 16:9
  static Widget? exercise13() {
    // TULIS KODE DI SINI:
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 14: FractionallySizedBox
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah FractionallySizedBox dengan widthFactor 0.5
  static Widget? exercise14() {
    // TULIS KODE DI SINI:
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 15: LayoutBuilder
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah LayoutBuilder untuk responsive layout
  static Widget? exercise15() {
    // TULIS KODE DI SINI:
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 16: Transform.rotate
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah Transform widget dengan rotate
  static Widget? exercise16() {
    // TULIS KODE DI SINI:
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 17: Transform.scale
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah Transform widget dengan scale
  static Widget? exercise17() {
    // TULIS KODE DI SINI:
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 18: Transform.translate
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat sebuah Transform widget dengan translate
  static Widget? exercise18() {
    // TULIS KODE DI SINI:
  }
}
