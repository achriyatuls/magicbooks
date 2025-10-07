import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';

class Efd1300StringView extends StatefulWidget {
  const Efd1300StringView({Key? key}) : super(key: key);

  bool? exercise1() {
    bool isValid = false;
    String productName = "JR SUPER 12";
    String query = "JR";

    //Perbaiki condition pada statement dibawah.
    //Seharusnya condition-nya adalah ketika:
    //productName mengandung kata2 yang ada pada variabel query!
    //[Tips] Gunakan .contains
    if (productName != productName) {
      isValid = true;
    }
    return isValid;
  }

  bool? exercise2() {
    bool isEmpty = false;
    String productName = "";
    String query = "JR";

    //Perbaiki condition pada statement dibawah.
    //Seharusnya condition-nya adalah ketika:
    //productName kosong
    //[Tips] Gunakan .isEmpty
    if (productName != productName) {
      isEmpty = true;
    }
    return isEmpty;
  }

  bool? exercise3() {
    bool isValid = false;
    String productName = "GG FILTER 12";
    String query = "JR";

    //Perbaiki condition pada statement dibawah.
    //Seharusnya condition-nya adalah ketika:
    //productName minimal memilki 2 karakter atau lebih
    //[Tips] Gunakan .length, dan >= 2
    if (productName == "") {
      isValid = true;
    }
    return isValid;
  }

  bool? exercise4() {
    bool isValid = false;
    int number = 23;
    String code = "";
    //Ubah angka 23 menjadi String "0023"
    //Gunakan .toString().padLeft(4,"0")!
    return code == "0023";
  }

  bool? exercise5() {
    bool isValid = false;
    int number = 27;
    String code = "";
    //Ubah angka 27 menjadi String "00027"
    //Gunakan .toString().padLeft(5,"0")!
    return code == "00027";
  }

  bool? exercise6() {
    String email = "denyocr.world@gmail.com";
    bool isValid = false;

    //Cek nilai email, apakah email yang valid atau tidak
    //Gunakan Regex di bawah ini:
    //Gunakan fungsi .hasMatch pada Regex!
    /*
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\.[a-zA-Z]+$',
    );
    */
    return isValid;
  }

  bool? exercise7() {
    String firstName = "ANDREA";
    //Index pada statement ini salah
    //Seharusnya index-nya adalah index dari huruf N pada text di atas
    //Perbaiki index-nya!
    bool isValid = firstName[0] == "N";
    return isValid;
  }

  bool? exercise8() {
    String firstName = "ANDREA";
    //Ubah semua text di atas menjadi lowercase semua
    //Gunakan .toLowerCase !
    return firstName == "andrea";
  }

  bool? exercise9() {
    String firstName = "daniel Goleman";
    //Ubah semua text di atas menjadi lowercase semua
    //Gunakan .toUpperCase !
    return firstName == "DANIEL GOLEMAN";
  }

  bool? exercise10() {
    List arr = [];
    String line = "1;GG FILTER 12;250;-";
    //Split string di atas berdasarkan ; dan tampung di dalam arr!
    //Gunakan .split !
    return arr.length == 4;
  }

  bool? exercise11() {
    List arr = [];
    String line = "1,GG FILTER 12,250,-";
    //Split string di atas berdasarkan ; dan tampung di dalam arr!
    //Gunakan .split !
    return arr.length == 4;
  }

  bool? exercise12() {
    Map product = {};
    String str = '{"product_name": "GG FILTER 12","price": 25}';
    //Ubah String di atas menjadi Map di Dart
    //Dan tampung pada variabel product
    //Gunakan jsonDecode!!!
    return product['product_name'] == 'GG FILTER 12';
  }

  bool exercise13() {
    String input = "Hello World";
    // Tuliskan kode untuk mengubah input menjadi huruf besar
    String? output;

    return output == "HELLO WORLD";
  }

  bool exercise14() {
    String input = "Hello World";
    // Tuliskan kode untuk mengubah input menjadi huruf kecil
    String? output;

    return output == "hello world";
  }

  bool exercise15() {
    String input = "Hello World";
    // Tuliskan kode untuk mengubah input menjadi judul case
    String? output;

    return output == "Hello World";
  }

  bool exercise16() {
    String input = "1234";
    // Tuliskan kode untuk mengubah input menjadi angka
    int? output;

    return output == 1234;
  }

  bool exercise17() {
    String input = "1234.56";
    // Tuliskan kode untuk mengubah input menjadi double
    double? output;

    return output == 1234.56;
  }

  bool exercise18() {
    String input = "Rp. 1.234,56";
    // Tuliskan kode untuk mengubah input menjadi double tanpa simbol mata uang
    double? output;

    return output == 1234.56;
  }

  bool exercise19() {
    double input = 1234.56;
    // Tuliskan kode untuk mengubah input menjadi String dengan format currency
    String? output;

    return output == "Rp. 1.234,56";
  }

  bool exercise20() {
    String input = "1234.56";
    // Tuliskan kode untuk mengubah input menjadi String dengan format currency
    String? output;

    return output == "Rp. 1.234,56";
  }

  bool exercise21() {
    String input = "Hello, World!";
    // Tuliskan kode untuk memverifikasi apakah input berisi kata "Hello"
    bool? output;

    return output == true;
  }

  bool exercise22() {
    String input = "Hello, World!";
    // Tuliskan kode untuk mengubah input menjadi "Hello World"
    String? output;

    return output == "Hello World";
  }

  bool exercise23() {
    String input = "Hello, World!";
    // Tuliskan kode untuk mengubah input menjadi "Hello,World!"
    String? output;

    return output == "Hello,World!";
  }

  bool exercise24() {
    String input = "Hello, World!";
    // Tuliskan kode untuk memverifikasi apakah input berisi kata "world"
    bool? output;

    return output == false;
  }

  bool exercise25() {
    String input = "Hello, World!";
    // Tuliskan kode untuk memverifikasi apakah input berisi kata "World"
    bool? output;

    return output == true;
  }

  bool exercise26() {
    String input = "Rp. 10.000";
    // Tuliskan kode untuk mengubah input menjadi 10000
    int? output;

    return output == 10000;
  }

  bool exercise27() {
    String input = "Rp. 10.000";
    // Tuliskan kode untuk mengubah input menjadi 10.000
    double? output;

    return output == 10.000;
  }

  bool exercise28() {
    String input = "Rp. 10.000";
    // Tuliskan kode untuk mengubah input menjadi 10,000.00
    String? output;

    return output == "10,000.00";
  }

  bool exercise29() {
    String input = "Hello, World!";
    // Tuliskan kode untuk memverifikasi apakah input berisi huruf besar
    bool? output;

    return output == true;
  }

  bool exercise30() {
    String input = "Hello, World!";
    // Tuliskan kode untuk memverifikasi apakah input berisi huruf kecil
    bool? output;

    return output == false;
  }

  bool exercise31() {
    String input = "12,345.67";
    // Tuliskan kode untuk mengkonversi input menjadi double
    double? output;

    return output == 12345.67;
  }

  bool exercise32() {
    String input = "Rp. 12.345,67";
    // Tuliskan kode untuk mengkonversi input menjadi double
    double? output;

    return output == 12345.67;
  }

  bool exercise33() {
    String input = "USD 12,345.67";
    // Tuliskan kode untuk mengkonversi input menjadi double
    double? output;

    return output == 12345.67;
  }

  bool exercise34() {
    String input = "€12.345,67";
    // Tuliskan kode untuk mengkonversi input menjadi double
    String cleanInput = input.replaceAll(RegExp(r'[^0-9,]'), '');
    cleanInput = cleanInput.replaceAll(",", ".");
    double? output = double.parse(cleanInput);

    return output == 12345.67;
  }

  bool exercise35() {
    String input = "¥12,345.67";
    // Tuliskan kode untuk mengkonversi input menjadi double
    String cleanInput = input.replaceAll(RegExp(r'[^0-9.]'), '');
    double? output = double.parse(cleanInput);

    return output == 12345.67;
  }

  Widget build(context, Efd1300StringController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: const Color(0xFFE5D9F2),
      appBar: AppBar(
        title: const Text("FbkDartString"),
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
  State<Efd1300StringView> createState() => Efd1300StringController();
}
