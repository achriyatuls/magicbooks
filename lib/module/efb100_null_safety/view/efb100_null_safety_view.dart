import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../../../shared/widget/row_label/row_label_validated_efb100.dart';

class Efb100NullSafetyView extends StatefulWidget {
  const Efb100NullSafetyView({Key? key}) : super(key: key);

  /*
    ?
    ??
    !
    late
  */
// Exercise 1
  void exercise1() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    String? name; //nullable
    print(name?.toUpperCase());
  }

// Exercise 2
  void exercise2() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    int? x; //null
    int y = x ?? 1; // y = 1;
    print(y);
  }

// Exercise 3
  void exercise3() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    String? text;
    print(text?.length);
  }

// Exercise 4
  void exercise4() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    int? a;
    int b = a ?? 3;
    print(b);
  }

// Exercise 5
  void exercise5() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    String? word;
    print(word?.length ?? "null");
  }

// Exercise 6
  void exercise6() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    int? number;
    print(number ??= 10);
    // if (number == null) {
    //   number = 10;
    // }
  }

// Exercise 7
  void exercise7() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    String? message;
    print(message ?? "Hello World!");
  }

// Exercise 8
  void exercise8() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    List<String>? names;
    print(names?.length ?? "dony");
  }

// Exercise 9
  void exercise9() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    int? x;
    int y = x ?? (2 + 2);
    print(y);
  }

// Exercise 10
  void exercise10() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    Map<String, int?>? scores = {'Math': 90, 'Science': null};
    print(scores['Math'] ?? "null");
  }

  // Exercise 11
  void exercise11() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    String? firstName = "John";
    String? lastName = "Doe";
    print("Hello ${firstName ?? "Guest"} ${lastName ?? ""}!");
  }

// Exercise 12
  void exercise12() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    String? text;
    text = "budy";
    text = null;
    print(text?.toUpperCase());
  }

// Exercise 13
  void exercise13() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    int? a = 2;
    int b = a + 3;
    print(b);
  }

// Exercise 14
  void exercise14() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    //              012345
    String? text = "Lorem ipsum dolor sit amet";
    print("text.substring(0, 5)".toUpperCase());
  }

// Exercise 15
  void exercise15() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    int? x;
    int y = x ?? 10;
    print(y);
  }

// Exercise 16
  void exercise16() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    String? text;
    print(text?.length ?? 0);
  }

// Exercise 17
  void exercise17() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    List<String>? names = ['John', 'Jane', 'Bob'];
    print(names[1].length ?? 0);
  }

// Exercise 18
  void exercise18() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    int? a = 5;
    int b = a ?? -1;
    print(b.isNegative);
  }

// Exercise 19
  void exercise19() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    String? text = "hello";
    print(text.toUpperCase() ?? "null");
  }

// Exercise 20
  void exercise20() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    int? a;
    int b = a ?? -1;
    print(b.isNegative);
  }

// Exercise 21
  void exercise21() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    List<int?> numbers = [1, 2, null, 4, 5];
    /*
    1
    2
    null  -3
    4
    5
    */
    int sum = 0;
    for (var number in numbers) {
      sum += number ?? -3;
    }
    print(sum);
  }

// Exercise 22
  void exercise22() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    List<String>? names;
    for (var name in names ?? []) {
      print(name.toUpperCase());
    }
  }

// Exercise 23
  void exercise23() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    List<String?> names = ['John', 'Jane', null, 'Bob'];
    for (var name in names) {
      print(name?.toUpperCase() ?? "NoName");
    }
  }

// Exercise 24
  void exercise24() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    Map<String, int?>? scores = {
      'Math': 90,
      'Science': null,
      'English': 95,
    };
    for (var entry in scores.entries.toList()) {
      print("${entry.key}: ${entry.value ?? "null"}");
    }
  }

// Exercise 25
  void exercise25() {
    // Apa yang akan ditampilkan di console dari kode di bawah ini?
    List<int?>? numbers = [1, 2, null, 4, 5];
    /*
    1
    2
    null  -12
    4
    5
    */
    for (var number in numbers ?? []) {
      print(number ?? -12);
    }
  }

  void exercise001() {
    // Jawablah dengan format ini: (contoh)
    /*
    Subtotal: 10000     31500
    Discount: 6000      6300
    Tax: 3000           3150
    Total: 20000        28350
    */
    List<int?> prices = [5000, 10000, null, 7500, 9000];
    Map<String, int> discounts = {'Gold': 20, 'Silver': 10, 'Bronze': 5};
    int? tax = 10;
    int subtotal = 0;

    for (var price in prices) {
      /*    5000
            10000
            null    0
            7500
            9000
      */
      subtotal += price ?? 0;
    }

    int discount = 0;
    String membership = 'Gold';
    if (discounts.containsKey(membership)) {
      discount = discounts[membership]!;
    }

    int discountAmount = (subtotal * discount / 100).round();
    int taxAmount = (subtotal * (tax ?? 0) / 100).round();
    int total = subtotal - discountAmount + taxAmount;

    print('Subtotal: $subtotal');
    print('Discount: $discountAmount');
    print('Tax: $taxAmount');
    print('Total: $total');
  }

  void exercise002() {
    // Tentukan nilai subtotal, discount, tax, dan total yang akan ditampilkan pada aplikasi POS
    // Jawablah dengan format ini:
    /*
    Subtotal: 10000
    Discount: 6000
    Tax: 3000
    Total: 20000
    */

    List<Map<String, dynamic>> items = [
      {'id': 1, 'name': 'Coca Cola', 'price': 5000},
      {'id': 2, 'name': 'Pepsi', 'price': 7500},
      {'id': 3, 'name': 'Fanta', 'price': null},
      {'id': 4, 'name': 'Sprite', 'price': 9000},
      {'id': 5, 'name': 'Mizone', 'price': 6000}
    ];

    double subtotal = 0;
    for (var item in items) {
      subtotal += item['price'] ?? 0;
    }

    int discount = 10;
    int discountAmount = (subtotal * discount / 100).round();

    double? tax;
    int taxAmount = (subtotal * (tax ?? 0) / 100).round();

    double total = subtotal - discountAmount + taxAmount;

    print('Subtotal: $subtotal');
    print('Discount: $discountAmount');
    print('Tax: $taxAmount');
    print('Total: $total');
  }

  void exercise003() {
    /*
    Berapa profit dari Kopi, Teh dan Susu
    Jawab dgn format ini:
    Kopi: 300000
    Teh: 120000
    Susu: 195000
    */
    List<Map<String, dynamic>> barang = [
      {'nama': 'Kopi', 'hargaJual': 15000, 'hargaBeli': 10000, 'jumlah': 100},
      {'nama': 'Teh', 'hargaJual': 12000, 'hargaBeli': 9000, 'jumlah': 50},
      {'nama': 'Susu', 'hargaJual': 25000, 'hargaBeli': 18000, 'jumlah': 25},
    ];

    // Hitung profit dari masing-masing barang dan total profit
    int totalProfit = 0;
    for (var item in barang) {
      int profit = (item['hargaJual'] - item['hargaBeli']) * item['jumlah'];
      totalProfit += profit;
      print('${item['nama']}: $profit');
    }

    // Menampilkan hasil perhitungan total profit
    print('Total Profit: $totalProfit');
  }

  Widget build(context, Efb100NullSafetyController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: const Color(0xFFE8DCFF),
      appBar: AppBar(
        title: const Text("EFB100 - Null Safety"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: const [],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    "productName",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _buildActionCard(rowLabelValidatedEfb100(1)),
              _buildActionCard(rowLabelValidatedEfb100(2)),
              _buildActionCard(rowLabelValidatedEfb100(3)),
              _buildActionCard(rowLabelValidatedEfb100(4)),
              _buildActionCard(rowLabelValidatedEfb100(5)),
              _buildActionCard(rowLabelValidatedEfb100(6)),
              _buildActionCard(rowLabelValidatedEfb100(7)),
              _buildActionCard(rowLabelValidatedEfb100(8)),
              _buildActionCard(rowLabelValidatedEfb100(9)),
              _buildActionCard(rowLabelValidatedEfb100(10)),
              _buildActionCard(rowLabelValidatedEfb100(11)),
              _buildActionCard(rowLabelValidatedEfb100(12)),
              _buildActionCard(rowLabelValidatedEfb100(13)),
              _buildActionCard(rowLabelValidatedEfb100(14)),
              _buildActionCard(rowLabelValidatedEfb100(15)),
              _buildActionCard(rowLabelValidatedEfb100(16)),
              _buildActionCard(rowLabelValidatedEfb100(17)),
              _buildActionCard(rowLabelValidatedEfb100(18)),
              _buildActionCard(rowLabelValidatedEfb100(19)),
              _buildActionCard(rowLabelValidatedEfb100(20)),
              _buildActionCard(rowLabelValidatedEfb100(21)),
              _buildActionCard(rowLabelValidatedEfb100(22)),
              _buildActionCard(rowLabelValidatedEfb100(23)),
              _buildActionCard(rowLabelValidatedEfb100(24)),
              _buildActionCard(rowLabelValidatedEfb100(25)),

              // rowAction(exercise26),
              // rowAction(exercise27),
              // rowAction(exercise28),
              // rowAction(exercise29),
              // rowAction(exercise30),
              // rowAction(exercise31),
              // rowAction(exercise32),
              // rowAction(exercise33),
              // rowAction(exercise34),
              // rowAction(exercise35),
              const Divider(),
              // legacy tasks moved to 26-28
              _buildActionCard(rowLabelValidatedEfb100(26)),
              _buildActionCard(rowLabelValidatedEfb100(27)),
              _buildActionCard(rowLabelValidatedEfb100(28)),
              _buildActionCard(rowAction(exercise002)),
              _buildActionCard(rowAction(exercise003)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard(Widget child) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: child,
      ),
    );
  }

  @override
  State<Efb100NullSafetyView> createState() => Efb100NullSafetyController();
}
