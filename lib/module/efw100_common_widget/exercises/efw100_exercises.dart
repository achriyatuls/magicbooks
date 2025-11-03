// LEMBAR KERJA SISWA - EFW100 COMMON WIDGET
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
class Efw100Exercises {
  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 1: Container
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Buat sebuah Container dengan lebar 100, tinggi 100, dan warna merah
  static Widget? exercise1() {
    // TULIS KODE DI SINI:
    return Container(
      width: 100,
      height: 100,
      color: Colors.red,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 2: Text
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Buat sebuah Text dengan isi "Hello Flutter" dan ukuran font 24
  static Widget? exercise2() {
    // TULIS KODE DI SINI:
    return Text(
      "Hello Flutter",
      style: TextStyle(fontSize: 24),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 3: Icon
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Buat sebuah Icon dengan Icons.home dan warna biru
  static Widget? exercise3() {
    // TULIS KODE DI SINI:
    return Icon(
      Icons.home,
      color: Colors.blue,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 4: Image.asset
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Buat sebuah Image.asset dengan path "assets/images/image1.jpg"
  static Widget? exercise4() {
    // TULIS KODE DI SINI:
    return Image.asset(
      "assets/images/image1.jpg",
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 5: CircleAvatar
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Buat sebuah CircleAvatar dengan radius 30 dan warna hijau
  static Widget? exercise5() {
    // TULIS KODE DI SINI:
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.green,
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 6: Card
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Buat sebuah Card dengan padding 16 dan child Text "Card Content"
  static Widget? exercise6() {
    // TULIS KODE DI SINI:
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Card Content"),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 7: ListTile
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Buat sebuah ListTile dengan title "List Tile" dan subtitle "Subtitle"
  static Widget? exercise7() {
    // TULIS KODE DI SINI:
    return ListTile(
      title: Text("List Tile"),
      subtitle: Text("Subtitle"),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 8: ElevatedButton
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Buat sebuah ElevatedButton dengan text "Click Me"
  static Widget? exercise8() {
    // TULIS KODE DI SINI:
    return ElevatedButton(
      onPressed: () {},
      child: Text("Click Me"),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 9: FloatingActionButton
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Buat sebuah FloatingActionButton dengan icon Icons.add
  static Widget? exercise9() {
    // TULIS KODE DI SINI:
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 10: AppBar
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Buat sebuah AppBar dengan title "My App"
  static Widget? exercise10() {
    // TULIS KODE DI SINI:
    return AppBar(
      title: Text("My App"),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 11: Scaffold
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Buat sebuah Scaffold dengan AppBar dan body Text "Hello World"
  static Widget? exercise11() {
    // TULIS KODE DI SINI:
    return Scaffold(
      appBar: AppBar(title: Text("App")),
      body: Text("Hello World"),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 12: SizedBox
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Buat sebuah SizedBox dengan lebar 200 dan tinggi 100
  static Widget? exercise12() {
    // TULIS KODE DI SINI:
    return SizedBox(
      width: 200,
      height: 100,
      child: Container(color: Colors.grey[300]),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 13: Padding
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Buat sebuah Padding dengan padding EdgeInsets.all(16) dan child Text "Padded Text"
  static Widget? exercise13() {
    // TULIS KODE DI SINI:
    return Padding(
      padding: EdgeInsets.all(16),
      child: Text("Padded Text"),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 14: Center
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Buat sebuah Center dengan child Text "Centered Text"
  static Widget? exercise14() {
    // TULIS KODE DI SINI:
    return Center(
      child: Text("Centered Text"),
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 15: Align
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Buat sebuah Align dengan alignment Alignment.centerRight dan child Text "Right Aligned"
  static Widget? exercise15() {
    // TULIS KODE DI SINI:
    return Align(
      alignment: Alignment.centerRight,
      child: Text("Right Aligned"),
    );
  }
}
