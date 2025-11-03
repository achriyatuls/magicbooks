// LEMBAR KERJA SISWA - EFW400 GRID
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
class Efw400Exercises {
  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 1: GridView with crossAxisCount 2
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat GridView.count dengan crossAxisCount 2 dan 6 item
  static Widget? exercise1() {
    // TULIS KODE DI SINI:
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      children: List.generate(
        6,
        (i) => Container(color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 2: GridView.builder
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat GridView.builder dengan crossAxisCount 3
  static Widget? exercise2() {
    // TULIS KODE DI SINI:
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemCount: 9,
      itemBuilder: (_, __) =>
          Container(color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 3: GridView with spacing
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat GridView dengan crossAxisSpacing dan mainAxisSpacing
  static Widget? exercise3() {
    // TULIS KODE DI SINI:
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      children: List.generate(
        6,
        (i) => Container(color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 4: GridView with childAspectRatio
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat GridView dengan childAspectRatio 1.5
  static Widget? exercise4() {
    // TULIS KODE DI SINI:
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      children: List.generate(
        6,
        (i) => Container(color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 5: GridView with maxCrossAxisExtent
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat GridView dengan maxCrossAxisExtent 200
  static Widget? exercise5() {
    // TULIS KODE DI SINI:
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      children: List.generate(
        6,
        (i) => Container(color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 6: GridView horizontal
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat GridView dengan scrollDirection Axis.horizontal
  static Widget? exercise6() {
    // TULIS KODE DI SINI:
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      scrollDirection: Axis.horizontal,
      children: List.generate(
        6,
        (i) => Container(color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 7: GridView with BouncingScrollPhysics
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat GridView dengan physics BouncingScrollPhysics
  static Widget? exercise7() {
    // TULIS KODE DI SINI:
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      physics: const BouncingScrollPhysics(),
      children: List.generate(
        6,
        (i) => Container(color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 8: GridView with padding
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat GridView dengan padding EdgeInsets.all(16)
  static Widget? exercise8() {
    // TULIS KODE DI SINI:
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      padding: const EdgeInsets.all(16),
      children: List.generate(
        6,
        (i) => Container(color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 9: GridView with cacheExtent
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat GridView dengan cacheExtent 200
  static Widget? exercise9() {
    // TULIS KODE DI SINI:
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      cacheExtent: 200,
      children: List.generate(
        6,
        (i) => Container(color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 10: GridView with shrinkWrap
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat GridView dengan shrinkWrap true
  static Widget? exercise10() {
    // TULIS KODE DI SINI:
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        6,
        (i) => Container(color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 11: GridView with primary
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat GridView dengan primary true
  static Widget? exercise11() {
    // TULIS KODE DI SINI:
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      primary: true,
      children: List.generate(
        6,
        (i) => Container(color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 12: GridView.count
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat GridView.count dengan crossAxisCount 3
  static Widget? exercise12() {
    // TULIS KODE DI SINI:
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1.5,
      children: List.generate(
        6,
        (i) => Container(color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 13: GridView.builder with addAutomaticKeepAlives
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat GridView dengan addAutomaticKeepAlives true
  static Widget? exercise13() {
    // TULIS KODE DI SINI:
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemCount: 9,
      addAutomaticKeepAlives: true,
      itemBuilder: (_, __) =>
          Container(color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 14: GridView.builder with addRepaintBoundaries
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat GridView dengan addRepaintBoundaries true
  static Widget? exercise14() {
    // TULIS KODE DI SINI:
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemCount: 9,
      addRepaintBoundaries: true,
      itemBuilder: (_, __) =>
          Container(color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 15: GridView with reverse
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat GridView dengan reverse true
  static Widget? exercise15() {
    // TULIS KODE DI SINI:
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      reverse: true,
      children: List.generate(
        6,
        (i) => Container(color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 16: GridView with semanticChildCount
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI: Buat GridView dengan semanticChildCount 6
  static Widget? exercise16() {
    // TULIS KODE DI SINI:
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      semanticChildCount: 6,
      children: List.generate(
        6,
        (i) => Container(color: Color(0xFF8B4513)), // Saddle Brown (merah bata)
      ),
    );
  }
}
