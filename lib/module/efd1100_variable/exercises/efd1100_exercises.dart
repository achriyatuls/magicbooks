// 📝 LEMBAR KERJA SISWA - EFD1100 VARIABLE
//
// ════════════════════════════════════════════════════════════════════════════
// PETUNJUK PENGGUNAAN:
// ════════════════════════════════════════════════════════════════════════════
//
// 1. File ini BOLEH diubah untuk menjawab exercise
// 2. Tulis kode HANYA di area yang ditandai dengan "👇 TULIS KODE DI SINI"
// 3. JANGAN mengubah:
//    - Nama function
//    - Parameter function
//    - Return statement (kecuali diminta)
//    - Variable yang sudah dideklarasikan (hanya boleh MENGISI nilainya)
//
// 4. Exercise dengan 🔒 = VALIDATED (Multiple test cases)
// 5. Exercise tanpa 🔒 = BASIC (Original system - manual check)
// 6. Centang hijau untuk VALIDATED = SEMUA test cases passed
//
// ════════════════════════════════════════════════════════════════════════════

/// 📚 Class yang berisi jawaban siswa untuk semua exercise
class Efd1100Exercises {
  // ═══════════════════════════════════════════════════════════════════════════
  // 🔒 EXERCISE 2: Konversi String ke Double (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  //
  // INSTRUKSI:
  // Ubah parameter text (String) menjadi double, dan return hasilnya
  //
  // CONTOH:
  // Input:  "100.24"
  // Output: 100.24 (double)
  //
  // HINT: Gunakan double.parse()
  // ═══════════════════════════════════════════════════════════════════════════

  static double? exercise2Solution(String text) {
    double? price;

    // 👇 TULIS KODE DI SINI:
    // Contoh: price = double.parse(text);

    return price; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // 🔒 EXERCISE 3: Konversi String ke Double (dengan validasi) (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  //
  // INSTRUKSI:
  // String input mungkin mengandung karakter non-numeric (contoh: "300.24a")
  // Hilangkan karakter yang bukan angka dan titik, lalu konversi ke double
  //
  // HINT:
  // 1. Gunakan .replaceAll(RegExp(r'[^\d.]'), '') untuk hilangkan non-numeric
  // 2. Gunakan double.tryParse() untuk safety
  // 3. Jika gagal, return 0.0
  // ═══════════════════════════════════════════════════════════════════════════

  static double? exercise3Solution(String text) {
    double? price;

    // 👇 TULIS KODE DI SINI:

    return price; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // 🔒 EXERCISE 4: Cek Bilangan Ganjil (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  //
  // INSTRUKSI:
  // Periksa apakah input adalah bilangan ganjil
  // Return true jika ganjil, false jika genap
  //
  // HINT: Gunakan modulo operator (%) untuk cek sisa bagi
  // Bilangan ganjil: input % 2 != 0
  // ═══════════════════════════════════════════════════════════════════════════

  static bool? exercise4Solution(int input) {
    bool? output;

    // 👇 TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // 🔒 EXERCISE 5: Parse dengan Try-Catch Safety (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  //
  // INSTRUKSI:
  // Parse string "300aa" menjadi double dengan aman
  // Jika gagal, gunakan default value 0.0
  //
  // HINT: Gunakan double.tryParse() ?? 0.0
  // ═══════════════════════════════════════════════════════════════════════════

  static double? exercise5Solution(String text) {
    double? total;

    // 👇 TULIS KODE DI SINI:

    return total; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // 🔒 EXERCISE 8: Extract Text Between Quotes (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  //
  // INSTRUKSI:
  // Ambil text yang berada di antara tanda petik tunggal (' ')
  //
  // CONTOH:
  // Input:  "hello 'Deny', apa kabar?"
  // Output: "Deny"
  //
  // HINT:
  // 1. int startIndex = text.indexOf("'") + 1;
  // 2. int endIndex = text.lastIndexOf("'");
  // 3. String result = text.substring(startIndex, endIndex);
  // ═══════════════════════════════════════════════════════════════════════════

  static String? exercise8Solution(String text) {
    String? name;

    // 👇 TULIS KODE DI SINI:

    return name; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // 🔒 EXERCISE 11: Penjumlahan (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  //
  // INSTRUKSI:
  // Tambahkan 5 pada input
  // ═══════════════════════════════════════════════════════════════════════════

  static int? exercise11Solution(int input) {
    int? output;

    // 👇 TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // 🔒 EXERCISE 18: String Concatenation (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  //
  // INSTRUKSI:
  // Tambahkan " World!" pada input
  //
  // CONTOH:
  // Input:  "Hello"
  // Output: "Hello World!"
  // ═══════════════════════════════════════════════════════════════════════════

  static String? exercise18Solution(String input) {
    String? output;

    // 👇 TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // 🔒 EXERCISE 35: Check if String Contains Word (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  //
  // INSTRUKSI:
  // Periksa apakah kata "Dart" muncul dalam input
  //
  // HINT: Gunakan .contains()
  // ═══════════════════════════════════════════════════════════════════════════

  static bool? exercise35Solution(String input) {
    bool? output;

    // 👇 TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // 📝 EXERCISE LAMA (Original System - Belum Dikonversi ke Validated)
  // ═══════════════════════════════════════════════════════════════════════════
  //
  // Exercise di bawah ini masih menggunakan sistem lama (manual check).
  // Akan dikonversi ke sistem validated di update berikutnya.
  //
  // ═══════════════════════════════════════════════════════════════════════════

  // EXERCISE 1: Type Check
  static bool? exercise1() {
    //Ubah tipe data variable dibawah ini menjadi String
    int price = 100;
    return price is String;
  }

  // EXERCISE 6: Safe Int Parse
  static bool? exercise6() {
    int? age;

    //Uncomment kode dibawah ini!
    //Kode dibawah akan error jika di jalankan,
    //Perbaiki dengan meng-gunakan .tryParse("39ads")??0
    //Sehingga ketika parameter-nya tidak valid, nilainya menjadi 0

    /*
    age = int.parse("39ads");
    */

    return age != null;
  }

  // EXERCISE 7: Type Conversion Int
  static bool? exercise7() {
    int price = 0;
    String value = "5000";

    // Uncomment kode dibawah, dan perbaiki agar tidak error
    /*
    value = price;
    */
    return price == 5000;
  }

  // EXERCISE 9: Calculate Average
  static bool? exercise9() {
    List numbers = [70, 23, 44, 33, 100, 23, 109];
    double average = 0;
    double total = 0;
    /*
          Hitunglah nilai rata2 dari List di atas.
          [TIPS] Gunakan for untuk mendapatkan total.
          Gunakan numbers.length untuk mendapatkan panjang List
          */
    return average.toStringAsFixed(2) == "57.43";
  }

  // EXERCISE 10: Find Min and Max
  static bool? exercise10() {
    List numbers = [70, 23, 44, 33, 100, 23, 109];
    /*
          Hitunglah minValue dan maxValue dari List numbers di atas.
          [Tips] - Gunakan .sort, ambil minValue dari .first dan ambil maxValue
          dari .last
          */
    int minValue = 0;
    int maxValue = 0;

    return minValue == 23 && maxValue == 109;
  }

  // EXERCISE 12: Subtraction
  static bool exercise12() {
    int input = 10;
    // Tuliskan kode untuk mengurangi 5 pada input
    int? output;

    return output == 5;
  }

  // EXERCISE 13: Addition Two Numbers
  static bool exercise13() {
    int input1 = 10;
    int input2 = 20;
    // Tuliskan kode untuk menjumlahkan input1 dan input2
    int? output;

    return output == 30;
  }

  // EXERCISE 14: Subtraction Two Numbers
  static bool exercise14() {
    int input1 = 10;
    int input2 = 20;
    // Tuliskan kode untuk mengurangi input2 dengan input1
    int? output;

    return output == 10;
  }

  // EXERCISE 15: Division
  static bool exercise15() {
    int input1 = 10;
    int input2 = 20;
    // Tuliskan kode untuk membagi input2 dengan input1
    double? output;

    return output == 2.0;
  }

  // EXERCISE 16: Multiplication
  static bool exercise16() {
    int input1 = 10;
    int input2 = 20;
    // Tuliskan kode untuk mengalikan input1 dan input2
    int? output;

    return output == 200;
  }

  // EXERCISE 17: Modulo
  static bool exercise17() {
    int input1 = 10;
    int input2 = 20;
    // Tuliskan kode untuk menghitung sisa bagi input2 dengan input1
    int? output;

    return output == 0;
  }

  // EXERCISE 19: Get First Word
  static bool exercise19() {
    String input = "Hello World!";
    // Tuliskan kode untuk mengambil kata pertama dari input
    String? output;

    return output == "Hello";
  }

  // EXERCISE 20: Get Second Word
  static bool exercise20() {
    String input = "Hello World!";
    // Tuliskan kode untuk mengambil kata kedua dari input
    String? output;

    return output == "World!";
  }

  // EXERCISE 21: Check Even Number
  static bool exercise21() {
    int input = 12345;
    // Tuliskan kode untuk memverifikasi apakah input adalah bilangan genap
    bool? output;

    return output == false;
  }

  // EXERCISE 22: Check Odd Number
  static bool exercise22() {
    int input = 12345;
    // Tuliskan kode untuk memverifikasi apakah input adalah bilangan ganjil
    bool? output;

    return output == true;
  }

  // EXERCISE 23: String Length Greater Than 3
  static bool exercise23() {
    String input = "Dart";
    // Tuliskan kode untuk memverifikasi apakah input memiliki panjang lebih dari 3 karakter
    bool? output;

    return output == true;
  }

  // EXERCISE 24: String Length Equal 3
  static bool exercise24() {
    String input = "Dart";
    // Tuliskan kode untuk memverifikasi apakah input memiliki panjang sama dengan 3 karakter
    bool? output;

    return output == false;
  }

  // EXERCISE 25: String Starts With
  static bool exercise25() {
    String input = "Dart";
    // Tuliskan kode untuk memverifikasi apakah input memiliki huruf pertama 'D'
    bool? output;

    return output == true;
  }

  // EXERCISE 26: String Ends With
  static bool exercise26() {
    String input = "Dart";
    // Tuliskan kode untuk memverifikasi apakah input memiliki huruf terakhir 't'
    bool? output;

    return output == true;
  }

  // EXERCISE 27: Check 5 Digits
  static bool exercise27() {
    int input = 12345;
    // Tuliskan kode untuk memverifikasi apakah input memiliki 5 digit
    bool? output;

    return output == true;
  }

  // EXERCISE 28: Check 4 Digits
  static bool exercise28() {
    int input = 12345;
    // Tuliskan kode untuk memverifikasi apakah input memiliki 4 digit
    bool? output;

    return output == false;
  }

  // EXERCISE 29: Check 2 Decimals
  static bool exercise29() {
    double input = 123.45;
    // Tuliskan kode untuk memverifikasi apakah input memiliki 2 digit setelah koma
    bool? output;

    return output == true;
  }

  // EXERCISE 30: Check 3 Decimals
  static bool exercise30() {
    double input = 123.45;
    // Tuliskan kode untuk memverifikasi apakah input memiliki 3 digit setelah koma
    bool? output;

    return output == false;
  }

  // EXERCISE 31: Check Palindrome
  static bool exercise31() {
    String input = "Hello World";
    // Tuliskan kode untuk memverifikasi apakah input adalah palindrome
    bool? output;

    return output == false;
  }

  // EXERCISE 32: Convert to Snake Case
  static bool exercise32() {
    String input = "Dart is Awesome";
    // Tuliskan kode untuk mengubah input menjadi huruf kecil semua dan memisahkan kata dengan spasi menjadi underscore
    String? output;

    return output == "dart_is_awesome";
  }

  // EXERCISE 33: Check if String is Number
  static bool exercise33() {
    String input = "1234";
    // Tuliskan kode untuk memverifikasi apakah input adalah angka
    bool? output;

    return output == true;
  }

  // EXERCISE 34: Limit String Length
  static bool exercise34() {
    String input =
        "Dart is a client-optimized programming language for fast apps on multiple platforms.";
    // Tuliskan kode untuk membatasi jumlah karakter pada input menjadi 50 karakter
    String? output = input.substring(0, 30);

    return output.length == 50;
  }
}
