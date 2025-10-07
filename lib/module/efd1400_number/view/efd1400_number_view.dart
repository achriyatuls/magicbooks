import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

class Efd1400NumberView extends StatefulWidget {
  const Efd1400NumberView({Key? key}) : super(key: key);

  bool? exercise1() {
    int? number;
    //Uncomment kode dibawah
    //Perbaiki error-nya!
    //Kali ini, jika String yang di input tidak valid,
    //Kita akan membuat nilai number menjadi 0
    //Gunakan .tryParse !

    /*
    number = int.parse("23a") ;
    */

    return number == 0;
  }

  bool? exercise2() {
    int? number;
    //Uncomment kode dibawah
    //Perbaiki error-nya!
    //Kali ini, jika String yang di input tidak valid,
    //Kita akan membuang semua non-numeric Character dengan Regex
    //Gunakan .replaceAll(RegExp(r'[^0-9]+'), '')

    /*
    number = int.parse("23a") ;
    */
    return number == 23;
  }

  bool? exercise3() {
    double? number;
    //Uncomment kode dibawah
    //Perbaiki error-nya!
    //[TIPS] Hover mouse ke method parse
    //Apakah tipe data yang seharusnya di input?
    //Perbaiki tipe data-nya agar kode ini bekerja!

    /*
    number = double.parse(29.23);
    */
    return number == 29.23;
  }

  bool? exercise4() {
    double? number;
    //Uncomment kode dibawah
    //Perbaiki error-nya!
    //[TIPS] Gunakan .tryParse
    //Jika error setting nilainya ke 0
    /*
    number = double.parse("29.23a");
    */
    return number == 0;
  }

  bool? exercise5() {
    //Uncomment kode di bawah
    //Kode-nya akan error karena kita memasukkan variabel integer
    //sebagai Parameter
    //Sedangkan function getTotal hanya menerima double!
    //Perbaiki deklarasi ketiga variable ini menjadi double!
    int total = 0;
    int qty = 2;
    int price = 100;
    /*
    total = getTotal(qty, price);
    */
    return total != 0;
  }

  //Kode ini tidak perlu di ubah
  double getTotal(double price, double qty) {
    return price * qty;
  }

  bool? exercise6() {
    int total = 0;
    //Uncomment kode di bawah
    //Kode tersebut akan error, karena hasil pembagian adalah double
    //Sedangkan variabel total adalah integer.
    //Perbaiki tipe data dari total!
    /*
    total = 23 / 2;
    */
    return total != 0;
  }

  bool? exercise7() {
    double price = 2500.2521;
    //Kita ingin membuat nilai price menjadi 2500.25
    //Ini bisa dilakukan dengan .toStringAsFixed(2)
    //Perbaiki kode return di bawah, agar nilainya adalah 2500.25!
    //[TIPS] - .toStringAsFixed(2) adalah method yang dimiliki variabel double
    //Bukan String!
    return price.toString() == "2500.25";
  }

  bool? exercise8() {
    int id = 1001;
    //Kita ingin membuat nilai id menjadi 00001001 (String)
    //Gunakan .padLeft(8, "0") pada return dibawah ini
    return id.toString() == "00001001";
  }

  bool? exercise9() {
    int input = 25000;
    //Atur nilai formattedInput menjadi Rp25.000.
    //Gunakan Regex berikut
    /*
      .replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => "${match[1]}.")
    */
    //Tambahkan "Rp" di depannya:
    String formattedInput = "";
    return formattedInput == "Rp25.000";
  }

  bool? exercise10() {
    int input = 2250;
    //Atur nilai formattedInput menjadi $2.250
    //Gunakan Regex berikut
    /*
      .replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => "${match[1]}.")
    */
    //Tambahkan "\$" di depannya:
    //[Tips] Untuk menampilkan Dollar di String, kamu harus menggunakan \$ bukan $
    String formattedInput = "";
    return formattedInput == "\$2.250";
  }

  bool? exercise11() {
    double number = 23.89;
    //Bulatkan number ke atas, menggunakan .ceil
    return number == 24;
  }

  bool? exercise12() {
    double number = 23.39;
    //Bulatkan number ke bawah, menggunakan .floor
    return number == 23;
  }

  bool exercise13() {
    int input = 12345;
    // Tuliskan kode untuk memverifikasi apakah input adalah bilangan genap
    bool? output;

    return output == false;
  }

  bool exercise14() {
    double input = 12345.6789;
    // Tuliskan kode untuk membulatkan input ke 2 angka di belakang koma
    double? output;

    return output == 12345.68;
  }

  bool exercise15() {
    int input = 123456;
    // Tuliskan kode untuk memverifikasi apakah input adalah bilangan bulat yang habis dibagi 3
    bool? output;

    return output == false;
  }

  bool exercise16() {
    int input = 123456;
    // Tuliskan kode untuk memverifikasi apakah input adalah bilangan bulat yang habis dibagi 6
    bool? output;

    return output == true;
  }

  bool exercise17() {
    int a = 10;
    int b = 20;
    // Tuliskan kode untuk menukar nilai a dan b
    int? c;
    int? d;

    return c == 20 && d == 10;
  }

  bool exercise18() {
    int input = 12345;
    // Tuliskan kode untuk memverifikasi apakah input adalah bilangan prima
    bool? output;

    return output == false;
  }

  bool exercise19() {
    double input = 12345.6789;
    // Tuliskan kode untuk membulatkan input ke 1 angka di belakang koma
    double? output;

    return output == 12345.7;
  }

  bool exercise20() {
    int input = 123456;
    // Tuliskan kode untuk memverifikasi apakah input adalah bilangan bulat yang habis dibagi 9
    bool? output;

    return output == true;
  }

  bool exercise21() {
    String input = "12345";
// Tuliskan kode untuk mengkonversi input menjadi integer
    int? output;

    return output == 12345;
  }

  bool exercise22() {
    String input = "12.345";
// Tuliskan kode untuk mengkonversi input menjadi double
    double? output;

    return output == 12.345;
  }

  bool exercise23() {
    int input = 12345;
// Tuliskan kode untuk mengkonversi input menjadi string
    String? output;

    return output == "12345";
  }

  bool exercise24() {
    double input = 12345.678;
// Tuliskan kode untuk mengkonversi input menjadi string
    String? output;

    return output == "12345.678";
  }

  bool exercise25() {
    String input = "12345";
// Tuliskan kode untuk memverifikasi apakah input merupakan bilangan bulat
    bool? output;

    return output == true;
  }

  bool exercise26() {
    String input = "12345.678";
// Tuliskan kode untuk memverifikasi apakah input merupakan bilangan riil
    bool? output;

    return output == true;
  }

  bool exercise27() {
    String input = "abcde";
// Tuliskan kode untuk memverifikasi apakah input merupakan bilangan bulat
    bool? output;

    return output == false;
  }

  bool exercise28() {
    String input = "abcde";
// Tuliskan kode untuk memverifikasi apakah input merupakan bilangan riil
    bool? output;

    return output == false;
  }

  bool exercise29() {
    int input = 12345;
// Tuliskan kode untuk memverifikasi apakah input merupakan bilangan negatif
    bool? output;

    return output == false;
  }

  bool exercise30() {
    int input = -12345;
// Tuliskan kode untuk memverifikasi apakah input merupakan bilangan negatif
    bool? output;

    return output == true;
  }

  bool exercise31() {
    int input = 12345;
// Tuliskan kode untuk memverifikasi apakah input merupakan bilangan positif
    bool? output;

    return output == true;
  }

  bool exercise32() {
    int input = -12345;
// Tuliskan kode untuk memverifikasi apakah input merupakan bilangan positif
    bool? output;

    return output == false;
  }

  bool exercise33() {
    String input = "1,000.50";
    // Tuliskan kode untuk mengubah input menjadi double
    double? output;

    return output == 1000.5;
  }

  bool exercise34() {
    String input = "100,000";
    // Tuliskan kode untuk mengubah input menjadi int
    int? output;

    return output == 100000;
  }

  bool exercise35() {
    String input = "100.5";
    // Tuliskan kode untuk memverifikasi apakah input bisa dikonversi ke double
    bool? output;

    return output == true;
  }

  Widget build(context, Efd1400NumberController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: const Color(0xFFE5D9F2),
      appBar: AppBar(
        title: const Text("FbkDartNumber"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildExerciseCard(rowLabel(exercise1)),
              _buildExerciseCard(rowLabel(exercise2)),
              _buildExerciseCard(rowLabel(exercise3)),
              _buildExerciseCard(rowLabel(exercise4)),
              _buildExerciseCard(rowLabel(exercise5)),
              _buildExerciseCard(rowLabel(exercise6)),
              _buildExerciseCard(rowLabel(exercise7)),
              _buildExerciseCard(rowLabel(exercise8)),
              _buildExerciseCard(rowLabel(exercise9)),
              _buildExerciseCard(rowLabel(exercise10)),
              _buildExerciseCard(rowLabel(exercise11)),
              _buildExerciseCard(rowLabel(exercise12)),
              _buildExerciseCard(rowLabel(exercise13)),
              _buildExerciseCard(rowLabel(exercise14)),
              _buildExerciseCard(rowLabel(exercise15)),
              _buildExerciseCard(rowLabel(exercise16)),
              _buildExerciseCard(rowLabel(exercise17)),
              _buildExerciseCard(rowLabel(exercise18)),
              _buildExerciseCard(rowLabel(exercise19)),
              _buildExerciseCard(rowLabel(exercise20)),
              _buildExerciseCard(rowLabel(exercise21)),
              _buildExerciseCard(rowLabel(exercise22)),
              _buildExerciseCard(rowLabel(exercise23)),
              _buildExerciseCard(rowLabel(exercise24)),
              _buildExerciseCard(rowLabel(exercise25)),
              _buildExerciseCard(rowLabel(exercise26)),
              _buildExerciseCard(rowLabel(exercise27)),
              _buildExerciseCard(rowLabel(exercise28)),
              _buildExerciseCard(rowLabel(exercise29)),
              _buildExerciseCard(rowLabel(exercise30)),
              _buildExerciseCard(rowLabel(exercise31)),
              _buildExerciseCard(rowLabel(exercise32)),
              _buildExerciseCard(rowLabel(exercise33)),
              _buildExerciseCard(rowLabel(exercise34)),
              _buildExerciseCard(rowLabel(exercise35)),
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

  @override
  State<Efd1400NumberView> createState() => Efd1400NumberController();
}
