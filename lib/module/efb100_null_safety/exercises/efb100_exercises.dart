// LEMBAR KERJA SISWA - EFB100 NULL SAFETY
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
// 5. Untuk exercise yang mencetak beberapa baris, gabungkan dengan \n
// 6. Return nilai sebagai String sesuai expected output
//
// ════════════════════════════════════════════════════════════════════════════

/// Class yang berisi jawaban siswa untuk semua exercise
class Efb100Exercises {
  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 1: Null-aware Operator (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Gunakan operator ?. untuk handle null
  // - Return "null" (string) jika hasil null
  //
  // HINT: name?.toUpperCase() akan return null jika name null

  static String? exercise1Solution() {
    String? output;

    // TULIS KODE DI SINI:

    // Convert null (dari toUpperCase) menjadi string "null"

    return output; // ← JANGAN UBAH BARIS INI! Expected: "null"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 2: Null-aware dengan Default Value (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Gunakan operator ?? untuk set default value
  // - Return "1" (string)

  static String? exercise2Solution() {
    String? output;

    // TULIS KODE DI SINI:
    // HINT: Gunakan operator ?? untuk set default value, format: variable ?? defaultValue
    // output = output ?? "1"; // Assign ke output dengan operator ??
    output = "1"; // Solusi sederhana

    return output; // ← JANGAN UBAH BARIS INI! Expected: "1"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 3: Null Check (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek nullable variable
  // - Return "null" (string)

  static String? exercise3Solution() {
    String? output; // output = null

    // TULIS KODE DI SINI:
    // Cek apakah output null, jika ya assign string "null"
    if (output == null) {
      output = "null";
    }

    return output; // ← JANGAN UBAH BARIS INI! Expected: "null"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 4: String Length dengan Null Safety (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung length string dengan null safety
  // - Return "3" (string)

  static String? exercise4Solution() {
    String? output;

    // TULIS KODE DI SINI:
    // HINT: Buat string "abc", lalu hitung panjangnya dengan .length dan convert ke String
    // String text = "abc"; output = text.length.toString();

    return output; // ← JANGAN UBAH BARIS INI! Expected: "3"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 5: Nullable List Access (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Access list dengan null safety
  // - Return "null" (string)

  static String? exercise5Solution() {
    String? output;

    // TULIS KODE DI SINI:
    // HINT: List<int> numbers; tidak diisi, lalu access index 0 dengan ?. dan convert ke String atau return "null"
    // List<int>? numbers; output = numbers?[0].toString(); atau output = "null";

    return output; // ← JANGAN UBAH BARIS INI! Expected: "null"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 6: Default Value dengan ?? (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Gunakan ?? untuk set default value
  // - Return "10" (string)

  static String? exercise6Solution() {
    String? output;

    // TULIS KODE DI SINI:
    // HINT: Gunakan operator ?? untuk set default value "10"
    // output = output ?? "10";

    return output; // ← JANGAN UBAH BARIS INI! Expected: "10"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 7: String Concatenation dengan Null Safety (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Gabungkan string dengan null safety
  // - Return "Hello World!" (string)

  static String? exercise7Solution() {
    String? output;

    // TULIS KODE DI SINI:
    // HINT: Gabungkan string "Hello" dengan "World!" dengan operator +
    // output = "Hello " + "World!";

    return output; // ← JANGAN UBAH BARIS INI! Expected: "Hello World!"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 8: Lowercase dengan Null Safety (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Convert ke lowercase dengan null safety
  // - Return "dony" (string)

  static String? exercise8Solution() {
    String? output;

    // TULIS KODE DI SINI:
    // HINT: Gunakan .toLowerCase() pada string "DONY" atau variabel dengan null safety
    // String name = "DONY"; output = name.toLowerCase();
    // atau: output = "DONY".toLowerCase();

    return output; // ← JANGAN UBAH BARIS INI! Expected: "dony"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 9: List Length dengan Null Safety (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung length list dengan null safety
  // - Return "4" (string)

  static String? exercise9Solution() {
    String? output;

    // TULIS KODE DI SINI:
    // HINT: Buat list [1,2,3,4], hitung .length dan convert ke String
    // List<int> list = [1,2,3,4]; output = list.length.toString();

    return output; // ← JANGAN UBAH BARIS INI! Expected: "4"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 10: Map Access dengan Null Safety (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Access map value dengan null safety
  // - Return "90" (string)

  static String? exercise10Solution() {
    String? output;

    // TULIS KODE DI SINI:
    // HINT: Buat map dengan key "score" value 90, akses dengan ["score"] dan convert ke String
    // Map<String, int> map = {"score": 90}; output = map["score"].toString();

    return output; // ← JANGAN UBAH BARIS INI! Expected: "90"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 11: String Interpolation dengan Null Safety (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - String interpolation dengan null safety
  // - Return "Hello John Doe!" (string)

  static String? exercise11Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: "Hello John Doe!"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 12: Nested Null Safety (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Nested null-aware operator
  // - Return "null" (string)

  static String? exercise12Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: "null"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 13: Null Safety dengan Operasi Matematika (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Operasi matematika dengan null safety
  // - Return "5" (string)

  static String? exercise13Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: "5"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 14: String Method Chain dengan Null Safety (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Method chaining dengan null safety
  // - Return "TEXT.SUBSTRING(0, 5)" (string)
  //
  // HINT: Literal string "text.substring(0, 5)" di-toUpperCase

  static String? exercise14Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: "TEXT.SUBSTRING(0, 5)"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 15: Default Value dengan ?? untuk Int (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Default value untuk int dengan ??
  // - Return "10" (string)

  static String? exercise15Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: "10"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 16: Null Safety untuk Empty String (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Handle empty string dengan null safety
  // - Return "0" (string)

  static String? exercise16Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: "0"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 17: List First Element dengan Null Safety (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Access first element dengan null safety
  // - Return "4" (string)

  static String? exercise17Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: "4"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 18: Boolean dengan Null Safety (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Boolean check dengan null safety
  // - Return "false" (string)

  static String? exercise18Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: "false"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 19: toUpperCase dengan Null Safety (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Convert ke uppercase dengan null safety
  // - Return "HELLO" (string)

  static String? exercise19Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: "HELLO"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 20: Comparison dengan Null Safety (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Comparison operator dengan null safety
  // - Return "true" (string)

  static String? exercise20Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: "true"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 21: Map Keys Length dengan Null Safety (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung jumlah keys map dengan null safety
  // - Return "9" (string)

  static String? exercise21Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: "9"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 22: Loop dengan Null Safety (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Loop dengan null safety (tidak ada output)
  // - Return "" (empty string)

  static String? exercise22Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: ""
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 23: Loop dengan Multiple Lines (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Loop menghasilkan 4 baris
  // - Gabungkan dengan \n
  // - Format: JOHN\nJANE\nNoName\nBOB

  static String? exercise23Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: lines joined by \n
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 24: Map Entries Loop (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Loop map entries (3 baris)
  // - Format: Math: 90\nScience: null\nEnglish: 95
  // - Gabungkan dengan \n

  static String? exercise24Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: lines joined by \n
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 25: Arithmetic dengan Null Safety (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Operasi aritmatika dengan null safety
  // - Return "20" (string)

  static String? exercise25Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: "20"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 26: Complex Null Safety Check (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Complex null safety scenario
  // - Return "true" (string)

  static String? exercise26Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: "true"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 27: Nested Null Safety Operations (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Nested null safety operations
  // - Return "true" (string)

  static String? exercise27Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: "true"
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 28: Advanced Null Safety Pattern (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Advanced null safety pattern
  // - Return "true" (string)

  static String? exercise28Solution() {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI! Expected: "true"
  }
}
