import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../controller/efd1700_regex_controller.dart';

class Efd1700RegexView extends StatefulWidget {
  const Efd1700RegexView({Key? key}) : super(key: key);

  bool? exercise1() {
    String text = "Hello Flutter World";
    RegExp exp = RegExp(r"Flutter");
    // Tuliskan kode untuk menentukan apakah text memenuhi RegExp "Flutter"
    bool isMatch = exp.hasMatch(text);
    return isMatch == true;
  }

  bool? exercise2() {
    String text = "Dart Programming Language";
    RegExp exp = RegExp(r"\bDart\b");
    // Tuliskan kode untuk menentukan apakah text memenuhi RegExp "\bDart\b"
    bool isMatch = exp.hasMatch(text);
    return isMatch == true;
  }

  bool? exercise3() {
    String text = "dart programming";
    RegExp exp = RegExp(r"\bdart\b", caseSensitive: false);
    // Tuliskan kode untuk menentukan apakah text memenuhi RegExp "\bdart\b" dengan case sensitive false
    bool isMatch = exp.hasMatch(text);
    return isMatch == true;
  }

  bool? exercise4() {
    String text = "dart programming";
    RegExp exp = RegExp(r"\b[a-z]+\b");
    // Tuliskan kode untuk menentukan apakah text memenuhi RegExp "\b[a-z]+\b"
    bool isMatch = exp.hasMatch(text);
    return isMatch == true;
  }

  bool? exercise5() {
    String text = "dart programming";
    RegExp exp = RegExp(r"\b\w+\b");
    // Tuliskan kode untuk menentukan apakah text memenuhi RegExp "\b\w+\b"
    bool isMatch = exp.hasMatch(text);
    return isMatch == true;
  }

  bool? exercise6() {
    String text = "dart programming";
    RegExp exp = RegExp(r"\b\w{3,}\b");
    // Tuliskan kode untuk menentukan apakah text memenuhi RegExp "\b\w{3,}\b"
    bool isMatch = exp.hasMatch(text);
    return isMatch == true;
  }

  bool? exercise7() {
    String text = "dart programming";
    RegExp exp = RegExp(r"\b[a-z]{3,}\b");
    // Tuliskan kode untuk menentukan apakah text memenuhi RegExp "\b[a-z]{3,}\b"
    bool isMatch = exp.hasMatch(text);
    return isMatch == true;
  }

  bool? exercise8() {
    String text = "dart programming";
    RegExp exp = RegExp(r"\b\w*\b");
    // Tuliskan kode untuk menentukan apakah text memenuhi RegExp "\b\w*\b"
    bool isMatch = exp.hasMatch(text);
    return isMatch == true;
  }

  bool? exercise9() {
    var pattern = r'\d{3}-\d{2}-\d{4}';
    var string = '123-45-6789';
    // Tuliskan kode untuk memastikan apakah string sesuai dengan pattern
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise10() {
    var pattern = r'\b\w{5}\b';
    var string = 'Hello World';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan 5 huruf
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise11() {
    var pattern = r'^[A-Z]{1}\w+$';
    var string = 'Hello';
    // Tuliskan kode untuk memastikan apakah string dimulai dengan huruf kapital
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise12() {
    var pattern = r'\b\w*[aeiou]\w*\b';
    var string = 'Hello World';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan vokal
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise13() {
    var pattern = r'\b\d+\b';
    var string = 'I have 25 apples';
    // Tuliskan kode untuk memastikan apakah string memiliki angka
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise14() {
    var pattern = r'\b[A-Z][a-z]+\b';
    var string = 'Hello World';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan huruf kapital di awal
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise15() {
    var pattern = r'\b\w{4,}\b';
    var string = 'Hello World';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan minimal 4 huruf
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise16() {
    var pattern = r'\b[a-z]+\b';
    var string = 'hello world';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan huruf kecil
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise17() {
    var pattern = r'\b\w*[0-9]\w*\b';
    var string = 'Hello123 World';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan angka
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise18() {
    var pattern = r'\b\w*[A-Z]\w*\b';
    var string = 'Hello World';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan huruf kapital
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise19() {
    var pattern = r'\b\w*[a-z]\w*\b';
    var string = 'Hello World';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan huruf kecil
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise20() {
    var pattern = r'\b\w*[^a-zA-Z0-9]\w*\b';
    var string = 'Hello-World';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan karakter khusus
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise21() {
    var pattern = r'\b\w*[aeiouAEIOU]\w*\b';
    var string = 'Hello World';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan vokal
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise22() {
    var pattern = r'\b\w*[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]\w*\b';
    var string = 'Hello World';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan konsonan
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise23() {
    var pattern = r'\b\w*[0-9]\w*[0-9]\w*\b';
    var string = 'Hello123 World456';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan minimal 2 angka
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise24() {
    var pattern = r'\b\w*[A-Z]\w*[A-Z]\w*\b';
    var string = 'Hello World';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan minimal 2 huruf kapital
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise25() {
    var pattern = r'\b\w*[a-z]\w*[a-z]\w*\b';
    var string = 'Hello World';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan minimal 2 huruf kecil
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise26() {
    var pattern = r'\b\w*[aeiou]\w*[aeiou]\w*\b';
    var string = 'Hello World';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan minimal 2 vokal
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise27() {
    var pattern =
        r'\b\w*[bcdfghjklmnpqrstvwxyz]\w*[bcdfghjklmnpqrstvwxyz]\w*\b';
    var string = 'Hello World';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan minimal 2 konsonan
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise28() {
    var pattern = r'\b\w*[0-9]\w*[A-Z]\w*\b';
    var string = 'Hello123 World';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan angka dan huruf kapital
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise29() {
    var pattern = r'\b\w*[A-Z]\w*[0-9]\w*\b';
    var string = 'Hello123 World';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan huruf kapital dan angka
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise30() {
    var pattern = r'\b\w*[a-z]\w*[0-9]\w*\b';
    var string = 'hello123 world';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan huruf kecil dan angka
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise31() {
    var pattern = r'\b\w*[0-9]\w*[a-z]\w*\b';
    var string = 'hello123 world';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan angka dan huruf kecil
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise32() {
    var pattern = r'\b\w*[aeiou]\w*[0-9]\w*\b';
    var string = 'hello123 world';
    // Tuliskan kode untuk memastikan apakah string memiliki kata dengan vokal dan angka
    var exp = RegExp(pattern);
    var isMatch = exp.hasMatch(string);
    return isMatch == true;
  }

  bool? exercise33() {
    String input = "My email address is example@email.com";
    // Tuliskan kode untuk mengambil alamat email dari input
    RegExp exp = RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b');
    String? output = exp.firstMatch(input)?.group(0);
    return output == "example@email.com";
  }

  bool? exercise34() {
    String input = "My phone number is +62 812-3456-7890";
    // Tuliskan kode untuk mengambil nomor telepon dari input
    RegExp exp = RegExp(r'\+?\d{1,3}[-\s]?\d{1,4}[-\s]?\d{1,4}[-\s]?\d{1,9}');
    String? output = exp.firstMatch(input)?.group(0);
    return output == "+62 812-3456-7890";
  }

  @override
  State<Efd1700RegexView> createState() => Efd1700RegexController();

  Widget build(context, Efd1700RegexController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("EFD1700 - Regex Challenge"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              rowLabel(exercise1),
              rowLabel(exercise2),
              rowLabel(exercise3),
              rowLabel(exercise4),
              rowLabel(exercise5),
              rowLabel(exercise6),
              rowLabel(exercise7),
              rowLabel(exercise8),
              rowLabel(exercise9),
              rowLabel(exercise10),
              rowLabel(exercise11),
              rowLabel(exercise12),
              rowLabel(exercise13),
              rowLabel(exercise14),
              rowLabel(exercise15),
              rowLabel(exercise16),
              rowLabel(exercise17),
              rowLabel(exercise18),
              rowLabel(exercise19),
              rowLabel(exercise20),
              rowLabel(exercise21),
              rowLabel(exercise22),
              rowLabel(exercise23),
              rowLabel(exercise24),
              rowLabel(exercise25),
              rowLabel(exercise26),
              rowLabel(exercise27),
              rowLabel(exercise28),
              rowLabel(exercise29),
              rowLabel(exercise30),
              rowLabel(exercise31),
              rowLabel(exercise32),
              rowLabel(exercise33),
              rowLabel(exercise34),
            ],
          ),
        ),
      ),
    );
  }
}
