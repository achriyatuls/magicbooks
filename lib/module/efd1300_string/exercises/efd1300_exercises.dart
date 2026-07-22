// LEMBAR KERJA SISWA - EFD1300 STRING
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
class Efd1300Exercises {
  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 1: Check if String Contains Query (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah productName mengandung query
  // - Return true jika mengandung, false jika tidak
  //
  // HINT: Gunakan .contains()

  static bool? exercise1Solution(String productName, String query) {
    bool? isValid;

    // TULIS KODE DI SINI:
    isValid = productName.contains(query);

    return isValid; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 2: Check if String is Empty (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah string kosong
  // - Return true jika kosong, false jika tidak
  //
  // HINT: Gunakan .isEmpty

  static bool? exercise2Solution(String productName) {
    bool? isEmpty;

    // TULIS KODE DI SINI:

    return isEmpty; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 3: Check String Length (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah panjang string minimal 2 karakter
  // - Return true jika >= 2, false jika < 2
  //
  // HINT: Gunakan .length

  static bool? exercise3Solution(String productName) {
    bool? isValid;

    // TULIS KODE DI SINI:

    return isValid; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 4: Number to Fixed Width String (4 digits) (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ubah angka menjadi string fixed width 4 dengan leading zero
  //
  // CONTOH:
  // Input:  23
  // Output: "0023"
  //
  // HINT: Gunakan .toString().padLeft(4, '0')

  static String? exercise4Solution(int number) {
    String? code;

    // TULIS KODE DI SINI:

    return code; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 5: Number to Fixed Width String (5 digits) (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ubah angka menjadi string fixed width 5 dengan leading zero
  //
  // CONTOH:
  // Input:  27
  // Output: "00027"
  //
  // HINT: Gunakan .toString().padLeft(5, '0')

  static String? exercise5Solution(int number) {
    String? code;

    // TULIS KODE DI SINI:

    return code; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 6: Email Validation with Regex (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Validasi email dengan regex
  // - Return true jika valid, false jika tidak
  //
  // HINT: Gunakan RegExp dengan pattern email
  // final emailRegex = RegExp(
  //   r'^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\.[a-zA-Z]+$',
  // );

  static bool? exercise6Solution(String email) {
    bool? isValid;

    // TULIS KODE DI SINI:
    // HINT: Gunakan RegExp(...).hasMatch(email)

    return isValid; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 7: Check Character at Index (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah huruf pada index tertentu sama dengan target
  // - Return true jika sama, false jika tidak
  //
  // HINT: Gunakan input[index] == target

  static bool? exercise7Solution(String input, int index, String target) {
    bool? isValid;

    // TULIS KODE DI SINI:

    return isValid; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 8: Convert to Lowercase (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ubah string menjadi huruf kecil semua
  //
  // HINT: Gunakan .toLowerCase()

  static String? exercise8Solution(String input) {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 9: Convert to Uppercase (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ubah string menjadi huruf besar semua
  //
  // HINT: Gunakan .toUpperCase()

  static String? exercise9Solution(String input) {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 10: Split String with Custom Separator (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Pisahkan string dengan pemisah tertentu
  //
  // CONTOH:
  // Input:  "apple|banana|orange", "|"
  // Output: ["apple", "banana", "orange"]
  //
  // HINT: Gunakan .split(sep)

  static List<String>? exercise10Solution(String line, String sep) {
    List<String>? parts;

    // TULIS KODE DI SINI:

    return parts; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 11: Split String with Comma (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Pisahkan string dengan koma
  //
  // CONTOH:
  // Input:  "apple,banana,orange"
  // Output: ["apple", "banana", "orange"]
  //
  // HINT: Gunakan .split(',')

  static List<String>? exercise11Solution(String line) {
    List<String>? parts;

    // TULIS KODE DI SINI:

    return parts; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 12: Parse JSON String (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Parse JSON string menjadi Map
  //
  // CONTOH:
  // Input:  '{"product_name":"Apple","price":5000}'
  // Output: {"product_name":"Apple","price":5000}
  //
  // HINT: Gunakan jsonDecode dari dart:convert

  static Map<String, dynamic>? exercise12Solution(String jsonStr) {
    Map<String, dynamic>? product;

    // TULIS KODE DI SINI:

    return product; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 13: Convert to Uppercase (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ubah string menjadi huruf besar semua
  //
  // HINT: Gunakan .toUpperCase()

  static String? exercise13Solution(String input) {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 14: Convert to Lowercase (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ubah string menjadi huruf kecil semua
  //
  // HINT: Gunakan .toLowerCase()

  static String? exercise14Solution(String input) {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 15: Title Case (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ubah string menjadi Title Case (huruf pertama setiap kata besar)
  //
  // CONTOH:
  // Input:  "hello world"
  // Output: "Hello World"
  //
  // HINT: Split by space, capitalize first letter, join back

  static String? exercise15Solution(String input) {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 16: Parse Int (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi string menjadi int
  //
  // HINT: Gunakan int.parse()

  static int? exercise16Solution(String input) {
    int? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 17: Parse Double (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi string menjadi double
  //
  // HINT: Gunakan double.parse()

  static double? exercise17Solution(String input) {
    double? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 18: Currency String to Double (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi currency string (Rp. 1.234,56) menjadi double 1234.56
  //
  // HINT:
  // 1. Hilangkan "Rp. " dengan .replaceAll()
  // 2. Ganti "." dengan "" (hilangkan pemisah ribuan)
  // 3. Ganti "," dengan "." (desimal separator)
  // 4. Parse dengan double.parse()

  static double? exercise18Solution(String input) {
    double? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 19: Double to Currency String (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi double menjadi currency string (Rp. 1.234,56)
  //
  // HINT: Gunakan NumberFormat dari package:intl

  static String? exercise19Solution(double input) {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 20: String to Currency String (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi "1234.56" menjadi currency string (Rp. 1.234,56)
  //
  // HINT: Parse ke double dulu, lalu format dengan NumberFormat

  static String? exercise20Solution(String input) {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 21: Check if Contains "Hello" (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah string mengandung "Hello"
  //
  // HINT: Gunakan .contains()

  static bool? exercise21Solution(String input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 22: Remove Comma (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hilangkan koma dari string
  //
  // CONTOH:
  // Input:  "Hello, World!"
  // Output: "Hello World!"
  //
  // HINT: Gunakan .replaceAll(',', '')

  static String? exercise22Solution(String input) {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 23: Remove Space After Comma (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hilangkan spasi setelah koma
  //
  // CONTOH:
  // Input:  "Hello, World!"
  // Output: "Hello,World!"
  //
  // HINT: Gunakan .replaceAll(', ', ',')

  static String? exercise23Solution(String input) {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 24: Check if Contains "world" (case-sensitive) (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah string mengandung "world" (case-sensitive)
  //
  // HINT: Gunakan .contains('world')

  static bool? exercise24Solution(String input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 25: Check if Contains "World" (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah string mengandung "World"
  //
  // HINT: Gunakan .contains('World')

  static bool? exercise25Solution(String input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 26: Currency String to Int (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi "Rp. 10.000" menjadi int 10000
  //
  // HINT:
  // 1. Hilangkan "Rp. " dan "."
  // 2. Parse dengan int.parse()

  static int? exercise26Solution(String input) {
    int? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 27: Currency String to Double (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi "Rp. 10.000" menjadi double 10000.0
  //
  // HINT:
  // 1. Hilangkan "Rp. " dan "."
  // 2. Parse dengan double.parse()

  static double? exercise27Solution(String input) {
    double? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 28: Currency String to US Format (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi "Rp. 10.000" menjadi "10,000.00"
  //
  // HINT:
  // 1. Parse ke double dulu
  // 2. Format dengan NumberFormat US

  static String? exercise28Solution(String input) {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 29: Check if Has Uppercase (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah string memiliki huruf besar
  //
  // HINT: Gunakan RegExp dengan pattern [A-Z]

  static bool? exercise29Solution(String input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 30: Check if Has Lowercase (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah string memiliki huruf kecil
  //
  // HINT: Gunakan RegExp dengan pattern [a-z]

  static bool? exercise30Solution(String input) {
    bool? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 31: US Currency to Double (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi "12,345.67" menjadi 12345.67
  //
  // HINT:
  // 1. Hilangkan koma
  // 2. Parse dengan double.parse()

  static double? exercise31Solution(String input) {
    double? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 32: Rupiah Currency to Double (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi "Rp. 12.345,67" menjadi 12345.67
  //
  // HINT:
  // 1. Hilangkan "Rp. "
  // 2. Ganti "." dengan ""
  // 3. Ganti "," dengan "."
  // 4. Parse dengan double.parse()

  static double? exercise32Solution(String input) {
    double? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 33: USD Currency to Double (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi "USD 12,345.67" menjadi 12345.67
  //
  // HINT:
  // 1. Hilangkan "USD "
  // 2. Hilangkan koma
  // 3. Parse dengan double.parse()

  static double? exercise33Solution(String input) {
    double? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 34: Euro Currency to Double (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi "€12.345,67" menjadi 12345.67
  //
  // HINT:
  // 1. Hilangkan "€"
  // 2. Ganti "." dengan ""
  // 3. Ganti "," dengan "."
  // 4. Parse dengan double.parse()

  static double? exercise34Solution(String input) {
    double? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 35: Yen Currency to Double (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi "¥12,345.67" menjadi 12345.67
  //
  // HINT:
  // 1. Hilangkan "¥"
  // 2. Hilangkan koma
  // 3. Parse dengan double.parse()

  static double? exercise35Solution(String input) {
    double? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }
}
