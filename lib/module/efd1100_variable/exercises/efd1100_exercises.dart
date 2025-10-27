// LEMBAR KERJA SISWA - EFD1100 VARIABLE
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
//    - Variable yang sudah dideklarasikan (hanya boleh MENGISI nilainya)
//
// 4. Exercise dengan = VALIDATED (Multiple test cases)
// 5. Exercise tanpa = BASIC (Original system - manual check)
// 6. Centang hijau untuk VALIDATED = SEMUA test cases passed
//
// ════════════════════════════════════════════════════════════════════════════

/// Class yang berisi jawaban siswa untuk semua exercise
class Efd1100Exercises {
  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 1: Type Check (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Buat variabel price bertipe String dan isi nilainya.
  // - Pastikan TIDAK menggunakan tipe int tanpa quotes (contoh: 100)
  // - Contoh benar: "100" (String)
  // Hasil fungsi harus mengembalikan true jika price adalah String.

  static bool? exercise1() {
    String? price;

    // TULIS KODE DI SINI:
    // HINT: Isi variabel price dengan String, bukan angka tanpa quotes
    // Contoh: price = "100";
    // Contoh benar:
    price = "100";

    bool? result = price is String;
    return result; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 2: Konversi String ke Double (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ubah parameter text (String) menjadi double, dan return hasilnya
  //
  // CONTOH:
  // Input:  "100.24"
  // Output: 100.24 (double)
  //
  // HINT: Gunakan double.parse()

  static double? exercise2Solution(String text) {
    double? price;

    // TULIS KODE DI SINI:
    // Contoh: price = double.parse(text);

    price = double.parse(text);

    return price; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 3: Konversi String ke Double (dengan validasi) (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - String input mungkin mengandung karakter non-numeric (contoh: "300.24a")
  // - Hilangkan karakter yang bukan angka dan titik, lalu konversi ke double
  //
  // HINT:
  // 1. Gunakan .replaceAll(RegExp(r'[^\d.]'), '') untuk hilangkan non-numeric
  // 2. Gunakan double.tryParse() untuk safety
  // 3. Jika gagal, return 0.0

  static double? exercise3Solution(String text) {
    double? price;

    // TULIS KODE DI SINI:
    text = text.replaceAll(RegExp(r'[^\d.]'), '');
    price = double.tryParse(text) ?? 0.0;

    return price; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 4: Cek Bilangan Ganjil (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Periksa apakah input adalah bilangan ganjil
  // - Return true jika ganjil, false jika genap
  //
  // HINT: Gunakan modulo operator (%) untuk cek sisa bagi
  // Bilangan ganjil: input % 2 != 0

  static bool? exercise4Solution(int input) {
    bool? output;

    output = input % 2 != 0;

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 5: Parse dengan Try-Catch Safety (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Parse string "300aa" menjadi double dengan aman
  // - Jika gagal, gunakan default value 0.0
  //
  // HINT: Gunakan double.tryParse() ?? 0.0

  static double? exercise5Solution(String text) {
    double? total;

    total = double.tryParse(text) ?? 0.0;

    return total; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 6: Safe Int Parse (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Uncomment kode dibawah ini!
  // - Kode dibawah akan error jika di jalankan
  // - Perbaiki dengan menggunakan .tryParse("39ads")??0
  // - Sehingga ketika parameter-nya tidak valid, nilainya menjadi 0

  static bool? exercise6() {
    int? age;

    // HINT: Gunakan int.tryParse("39ads") ?? 0 agar aman saat parse gagal
    age = int.tryParse("39ads") ?? 0;

    return age != null; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 7: Type Conversion Int (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Uncomment kode dibawah, dan perbaiki agar tidak error
  // - Konversi price (int) ke value (String) dengan benar

  static bool? exercise7() {
    int price = 0;
    String value = "5000";

    // TULIS KODE DI SINI:
    // Uncomment kode dibawah, dan perbaiki agar tidak error
    // HINT: Konversi int ke String dengan .toString()
    value = price.toString();

    return price == 0; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 8: Extract Text Between Quotes (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ambil text yang berada di antara tanda petik tunggal (' ')
  //
  // CONTOH:
  // Input:  "hello 'Deny', apa kabar?"
  // Output: "Deny"
  //
  // HINT:
  // 1. int startIndex = text.indexOf("'") + 1;
  // 2. int endIndex = text.lastIndexOf("'");
  // 3. String result = text.substring(startIndex, endIndex);

  static String? exercise8Solution(String text) {
    String? name;

    // TULIS KODE DI SINI:
    int startIndex = text.indexOf("'") + 1;
    int endIndex = text.lastIndexOf("'");
    name = text.substring(startIndex, endIndex);

    return name; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 9: Calculate Average (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitunglah nilai rata-rata dari List di bawah
  // - TIPS: Gunakan for untuk mendapatkan total
  // - Gunakan numbers.length untuk mendapatkan panjang List

  static bool? exercise9() {
    List numbers = [70, 23, 44, 33, 100, 23, 109];
    double average = 0;
    double total = 0;

    // TULIS KODE DI SINI:

    // gunakan for loop untuk menghitung total
    for (int i = 0; i < numbers.length; i++) {
      total += numbers[i];
    }

    // gunakan numbers.length untuk menghitung rata-rata
    average = total / numbers.length;

    return average.toStringAsFixed(2) == "57.43"; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 10: Find Min and Max (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitunglah minValue dan maxValue dari List numbers di bawah
  // - TIPS: Gunakan .sort, ambil minValue dari .first dan ambil maxValue dari .last

  static bool? exercise10() {
    List numbers = [70, 23, 44, 33, 100, 23, 109];
    int minValue = 0;
    int maxValue = 0;

    // TULIS KODE DI SINI:
    numbers.sort();
    minValue = numbers.first;
    maxValue = numbers.last;

    return minValue == 23 && maxValue == 109; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 11: Penjumlahan (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Tambahkan 5 pada input

  static int? exercise11Solution(int input) {
    int? output;

    // TULIS KODE DI SINI:
    output = input + 5;
    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 12: Subtraction (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Kurangi input dengan 5

  static bool exercise12() {
    int input = 10;
    int? output;

    // TULIS KODE DI SINI:

    output = input - 5;

    return output == 5; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 13: Addition Two Numbers (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Jumlahkan input1 dan input2

  static bool exercise13() {
    int input1 = 10;
    int input2 = 20;
    int? output;

    // TULIS KODE DI SINI:
    output = input1 + input2;
    return output == 30; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 14: Subtraction Two Numbers (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Kurangi input2 dengan input1

  static bool exercise14() {
    int input1 = 10;
    int input2 = 20;
    int? output;

    // TULIS KODE DI SINI:
    output = input2 - input1;

    return output == 10; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 15: Division (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Bagi input2 dengan input1

  static bool exercise15() {
    int input1 = 10;
    int input2 = 20;
    double? output;

    // TULIS KODE DI SINI:
    output = input2 / input1;

    return output == 2.0; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 16: Multiplication (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Kalikan input1 dan input2

  static bool exercise16() {
    int input1 = 10;
    int input2 = 20;
    int? output;

    // TULIS KODE DI SINI:
    output = input1 * input2;

    return output == 200; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 17: Modulo (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung sisa bagi input2 dengan input1

  static bool exercise17() {
    int input1 = 10;
    int input2 = 20;
    int? output;

    // TULIS KODE DI SINI:
    output = input2 % input1;

    return output == 0; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 18: String Concatenation (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Tambahkan " World!" pada input
  //
  // CONTOH:
  // Input:  "Hello"
  // Output: "Hello World!"

  static String? exercise18Solution(String input) {
    String? output;

    // TULIS KODE DI SINI:
    // HINT: Tambahkan " World!" ke akhir input
    // output = input + " World!";

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 19: Get First Word (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ambil kata pertama dari input
  // - HINT: Gunakan .split() dan ambil index pertama

  static bool exercise19() {
    String input = "Hello World!";
    String? output;

    // TULIS KODE DI SINI:
    // HINT: Split string dengan spasi dan ambil index 0
    // output = input.split(" ")[0];

    return output == "Hello"; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 20: Get Second Word (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ambil kata kedua dari input
  // - HINT: Gunakan .split() dan ambil index kedua

  static bool exercise20() {
    String input = "Hello World!";
    String? output;

    // TULIS KODE DI SINI:
    // HINT: Split string dengan spasi dan ambil index 1
    // output = input.split(" ")[1];

    return output == "World!"; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 21: Check Even Number (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Periksa apakah input adalah bilangan genap
  // - HINT: Gunakan modulo (%) untuk cek sisa bagi 2

  static bool exercise21() {
    int input = 12345;
    bool? output;

    // TULIS KODE DI SINI:
    // HINT: Bilangan genap jika input % 2 == 0
    // output = input % 2 == 0;

    return output == false; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 22: Check Odd Number (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Periksa apakah input adalah bilangan ganjil
  // - HINT: Gunakan modulo (%) untuk cek sisa bagi 2

  static bool exercise22() {
    int input = 12345;
    bool? output;

    // TULIS KODE DI SINI:
    // HINT: Bilangan ganjil jika input % 2 != 0
    // output = input % 2 != 0;

    return output == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 23: String Length Greater Than 3 (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Periksa apakah input memiliki panjang lebih dari 3 karakter
  // - HINT: Gunakan .length

  static bool exercise23() {
    String input = "Dart";
    bool? output;

    // TULIS KODE DI SINI:
    // HINT: Cek panjang string > 3
    // output = input.length > 3;

    return output == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 24: String Length Equal 3 (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Periksa apakah input memiliki panjang sama dengan 3 karakter
  // - HINT: Gunakan .length

  static bool exercise24() {
    String input = "Dart";
    bool? output;

    // TULIS KODE DI SINI:
    // HINT: Cek panjang string == 3
    // output = input.length == 3;

    return output == false; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 25: String Starts With (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Periksa apakah input dimulai dengan huruf 'D'
  // - HINT: Gunakan .startsWith()

  static bool exercise25() {
    String input = "Dart";
    bool? output;

    // TULIS KODE DI SINI:
    // HINT: Cek apakah dimulai dengan huruf 'D'
    // output = input.startsWith('D');

    return output == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 26: String Ends With (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Periksa apakah input diakhiri dengan huruf 't'
  // - HINT: Gunakan .endsWith()

  static bool exercise26() {
    String input = "Dart";
    bool? output;

    // TULIS KODE DI SINI:
    // HINT: Cek apakah diakhiri dengan huruf 't'
    // output = input.endsWith('t');

    return output == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 27: Check 5 Digits (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Periksa apakah input memiliki 5 digit
  // - HINT: Konversi ke String dulu, lalu gunakan .length

  static bool exercise27() {
    int input = 12345;
    bool? output;

    // TULIS KODE DI SINI:
    // HINT: Konversi ke String lalu cek panjangnya == 5
    // output = input.toString().length == 5;

    return output == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 28: Check 4 Digits (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Periksa apakah input memiliki 4 digit
  // - HINT: Konversi ke String dulu, lalu gunakan .length

  static bool exercise28() {
    int input = 12345;
    bool? output;

    // TULIS KODE DI SINI:
    // HINT: Konversi ke String lalu cek panjangnya == 4
    // output = input.toString().length == 4;

    return output == false; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 29: Check 2 Decimals (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Periksa apakah input memiliki 2 digit setelah koma
  // - HINT: Gunakan .split('.') untuk memisahkan bagian desimal

  static bool exercise29() {
    double input = 123.45;
    bool? output;

    // TULIS KODE DI SINI:
    // HINT: Pisahkan bagian desimal dan cek jumlah digit == 2
    // final parts = input.toString().split('.');
    // output = parts.length == 2 && parts[1].length == 2;

    return output == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 30: Check 3 Decimals (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Periksa apakah input memiliki 3 digit setelah koma
  // - HINT: Gunakan .split('.') untuk memisahkan bagian desimal

  static bool exercise30() {
    double input = 123.45;
    bool? output;

    // TULIS KODE DI SINI:
    // HINT: Pisahkan bagian desimal dan cek jumlah digit == 3
    // final parts = input.toString().split('.');
    // output = parts.length == 2 && parts[1].length == 3;

    return output == false; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 31: Check Palindrome (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Periksa apakah input adalah palindrome (dibaca sama dari depan/belakang)
  // - HINT: Gunakan .split('').reversed.join('') untuk balik String

  static bool exercise31() {
    String input = "Hello World";
    bool? output;

    // TULIS KODE DI SINI:
    // HINT: Bandingkan input dengan versi terbalik: input.split('').reversed.join('')
    if (input.split('').reversed.join('') == input) {
      output = true;
    } else {
      output = false;
    }

    return output == false; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 32: Convert to Snake Case (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ubah input menjadi huruf kecil semua
  // - Ganti spasi dengan underscore (_)
  // - HINT: Gunakan .toLowerCase() dan .replaceAll(' ', '_')

  static bool exercise32() {
    String input = "Dart is Awesome";
    String? output;

    // TULIS KODE DI SINI:
    // HINT: Ubah ke huruf kecil dan ganti spasi dengan underscore
    // output = input.toLowerCase().replaceAll(' ', '_');

    return output == "dart_is_awesome"; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 33: Check if String is Number (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Periksa apakah input adalah angka valid
  // - HINT: Gunakan int.tryParse(), cek apakah hasilnya != null

  static bool exercise33() {
    String input = "1234";
    bool? output;

    // TULIS KODE DI SINI:
    // HINT: Cek apakah int.tryParse(input) menghasilkan nilai bukan null
    // output = int.tryParse(input) != null;

    return output == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 34: Limit String Length (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Batasi jumlah karakter pada input menjadi 50 karakter
  // - HINT: Gunakan .substring(0, 50)

  static bool exercise34() {
    String input =
        "Dart is a client-optimized programming language for fast apps on multiple platforms.";
    String? output;

    // TULIS KODE DI SINI:
    // HINT: Ambil 50 karakter pertama dengan substring(0, 50)
    // output = input.substring(0, 50);

    return output?.length == 50; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 35: Check if String Contains Word (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Periksa apakah kata "Dart" muncul dalam input
  // - HINT: Gunakan .contains()

  static bool? exercise35Solution(String input) {
    bool? output;

    // TULIS KODE DI SINI:
    // HINT: Gunakan input.contains("Dart") untuk mengecek keberadaan kata "Dart"
    // output = input.contains("Dart");

    return output; // ← JANGAN UBAH BARIS INI!
  }
}
