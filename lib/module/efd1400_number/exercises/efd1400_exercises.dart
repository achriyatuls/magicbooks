// LEMBAR KERJA SISWA - EFD1400 NUMBER
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
// 5. Centang hijau untuk VALIDATED = SEMUA test cases passed
//
// ════════════════════════════════════════════════════════════════════════════

/// Class yang berisi jawaban siswa untuk semua exercise
class Efd1400Exercises {
  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 1: Try Parse dengan Default Value (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Parse string ke int dengan aman
  // - Jika gagal, gunakan default value 0
  //
  // HINT: Gunakan int.tryParse() ?? 0

  static int? exercise1Solution(String input) {
    int? number;

    // TULIS KODE DI SINI:

    return number; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 2: Clean Non-Numeric Characters (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hilangkan semua karakter non-numeric dari string
  // - Parse hasilnya ke int
  //
  // HINT:
  // 1. Gunakan .replaceAll(RegExp(r'[^0-9]+'), '') untuk hapus non-numeric
  // 2. Parse dengan int.parse()

  static int? exercise2Solution(String input) {
    int? number;

    // TULIS KODE DI SINI:

    return number; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 3: Assign Double Value (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Input sudah bertipe double, langsung assign ke number
  //
  // HINT: number = input

  static double? exercise3Solution(double input) {
    double? number;

    // TULIS KODE DI SINI:

    return number; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 4: Try Parse Double dengan Default Value (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Parse string ke double dengan aman
  // - Jika gagal, gunakan default value 0.0
  //
  // HINT: Gunakan double.tryParse() ?? 0.0

  static double? exercise4Solution(String input) {
    double? number;

    // TULIS KODE DI SINI:

    return number; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 5: Calculate Total (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung total = qty * price
  //
  // HINT: total = qty * price

  static double? exercise5Solution() {
    double? total;
    double qty = 2;
    double price = 100;

    // TULIS KODE DI SINI:

    return total; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 6: Division Result (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung total = 23 / 2
  //
  // HINT: total = 23 / 2

  static double? exercise6Solution() {
    double? total;

    // TULIS KODE DI SINI:

    return total; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 7: Format Double dengan toStringAsFixed (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Format double dengan 2 desimal
  //
  // HINT: Gunakan price.toStringAsFixed(2)

  static String? exercise7Solution(double price) {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 8: Pad Left dengan Zero (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi id ke string dengan panjang 8 digit
  // - Tambahkan leading zero jika kurang dari 8 digit
  //
  // CONTOH:
  // Input:  123
  // Output: "00000123"
  //
  // HINT: Gunakan id.toString().padLeft(8, "0")

  static String? exercise8Solution(int id) {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 9: Format Currency Rupiah (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Format angka menjadi format rupiah (Rp10.000)
  //
  // CONTOH:
  // Input:  10000
  // Output: "Rp10.000"
  //
  // HINT: Gunakan regex untuk menambah titik ribuan, tambah "Rp" di depan

  static String? exercise9Solution(int input) {
    String? formattedInput;

    // TULIS KODE DI SINI:

    return formattedInput; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 10: Format Currency Dollar (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Format angka menjadi format dollar ($10,000)
  //
  // CONTOH:
  // Input:  10000
  // Output: "$10,000"
  //
  // HINT: Gunakan regex untuk menambah koma ribuan, tambah "$" di depan

  static String? exercise10Solution(int input) {
    String? formattedInput;

    // TULIS KODE DI SINI:

    return formattedInput; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 11: Ceil (Bulatkan ke Atas) (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Bulatkan angka ke atas
  //
  // CONTOH:
  // Input:  3.2
  // Output: 4.0
  //
  // HINT: Gunakan number.ceilToDouble()

  static double? exercise11Solution(double number) {
    double? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 12: Floor (Bulatkan ke Bawah) (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Bulatkan angka ke bawah
  //
  // CONTOH:
  // Input:  3.8
  // Output: 3.0
  //
  // HINT: Gunakan number.floorToDouble()

  static double? exercise12Solution(double number) {
    double? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 13: Check Even Number (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah angka adalah bilangan genap
  //
  // HINT: input % 2 == 0

  static bool? exercise13Solution(int input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 14: Round to 2 Decimal Places (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Bulatkan ke 2 desimal
  //
  // HINT: double.parse(input.toStringAsFixed(2))

  static double? exercise14Solution(double input) {
    double? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 15: Check Divisible by 3 (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah angka habis dibagi 3
  //
  // HINT: input % 3 == 0

  static bool? exercise15Solution(int input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 16: Check Divisible by 6 (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah angka habis dibagi 6
  //
  // HINT: input % 6 == 0

  static bool? exercise16Solution(int input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 17: Swap Two Numbers (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Tukar nilai a dan b
  //
  // CONTOH:
  // Input:  a=5, b=10
  // Output: c=10, d=5
  //
  // HINT: Gunakan variable temporary untuk swap

  static Map<String, int>? exercise17Solution(int a, int b) {
    int? c;
    int? d;

    // TULIS KODE DI SINI:

    if (c == null || d == null) return null;
    return {"c": c, "d": d}; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 18: Check Prime Number (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah angka adalah bilangan prima
  //
  // HINT:
  // 1. Bilangan prima adalah bilangan > 1 yang hanya habis dibagi 1 dan dirinya sendiri
  // 2. Loop dari 2 sampai input-1, cek apakah ada yang habis dibagi

  static bool? exercise18Solution(int input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 19: Round to 1 Decimal Place (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Bulatkan ke 1 desimal
  //
  // HINT: double.parse(input.toStringAsFixed(1))

  static double? exercise19Solution(double input) {
    double? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 20: Check Divisible by 9 (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah angka habis dibagi 9
  //
  // HINT: input % 9 == 0

  static bool? exercise20Solution(int input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 21: String to Int (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi string ke int
  //
  // HINT: int.parse(input)

  static int? exercise21Solution(String input) {
    int? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 22: String to Double (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi string ke double
  //
  // HINT: double.parse(input)

  static double? exercise22Solution(String input) {
    double? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 23: Int to String (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi int ke string
  //
  // HINT: input.toString()

  static String? exercise23Solution(int input) {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 24: Double to String (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi double ke string
  //
  // HINT: input.toString()

  static String? exercise24Solution(double input) {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 25: Check if String is Integer (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah string bisa di-parse ke int
  //
  // HINT: int.tryParse(input) != null

  static bool? exercise25Solution(String input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 26: Check if String is Double (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah string bisa di-parse ke double
  //
  // HINT: double.tryParse(input) != null

  static bool? exercise26Solution(String input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 27: Check if String is NOT Integer (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah string TIDAK bisa di-parse ke int
  //
  // HINT: int.tryParse(input) == null

  static bool? exercise27Solution(String input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 28: Check if String is NOT Double (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah string TIDAK bisa di-parse ke double
  //
  // HINT: double.tryParse(input) == null

  static bool? exercise28Solution(String input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 29: Check if Number is Negative (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah angka negatif
  //
  // HINT: input < 0

  static bool? exercise29Solution(int input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 30: Check if Number is Negative (True Case) (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah angka negatif
  //
  // HINT: input < 0

  static bool? exercise30Solution(int input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 31: Check if Number is Positive (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah angka positif
  //
  // HINT: input > 0

  static bool? exercise31Solution(int input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 32: Check if Number is Positive (False Case) (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah angka positif
  //
  // HINT: input > 0

  static bool? exercise32Solution(int input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 33: Parse Comma-Separated Decimal (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Parse string dengan koma sebagai desimal separator
  //
  // CONTOH:
  // Input:  "123,45"
  // Output: 123.45
  //
  // HINT: Ganti koma dengan titik, lalu parse ke double

  static double? exercise33Solution(String input) {
    double? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 34: Parse Comma-Separated Integer (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Parse string dengan koma sebagai pemisah ribuan
  //
  // CONTOH:
  // Input:  "1,234"
  // Output: 1234
  //
  // HINT: Hapus koma, lalu parse ke int

  static int? exercise34Solution(String input) {
    int? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 35: Check if String Can Be Parsed to Double (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah string bisa di-parse ke double
  //
  // HINT: double.tryParse(input) != null

  static bool? exercise35Solution(String input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }
}
