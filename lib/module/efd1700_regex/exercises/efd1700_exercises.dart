// LEMBAR KERJA SISWA - EFD1700 REGEX
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
class Efd1700Exercises {
  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 1: Basic Pattern Match (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah text mengandung pattern "Flutter"
  // - Return true jika match, false jika tidak
  //
  // HINT: Gunakan exp.hasMatch(text)

  static bool? exercise1Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:
    // RegExp exp = RegExp(pattern);
    // isMatch = exp.hasMatch(text);
    isMatch = RegExp(pattern).hasMatch(text);

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 2: Word Boundary Match (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah text mengandung kata lengkap sesuai pattern
  // - Pattern: \bDart\b (word boundary)
  //
  // HINT: \b = word boundary

  static bool? exercise2Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:
    isMatch = RegExp(pattern).hasMatch(text);

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 3: Case Insensitive Match (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek dengan case insensitive
  // - caseSensitive: false
  //
  // HINT: RegExp(pattern, caseSensitive: false)

  static bool? exercise3Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:
    isMatch = RegExp(pattern).hasMatch(text);
    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 4: Character Class [a-z]+ (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata dengan huruf kecil a-z
  // - Pattern: \b[a-z]+\b

  static bool? exercise4Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 5: Word Character \w+ (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata dengan word characters (\w = a-zA-Z0-9_)
  // - Pattern: \b\w+\b

  static bool? exercise5Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 6: Quantifier {3,} (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata dengan minimal 3 karakter
  // - Pattern: \b\w{3,}\b

  static bool? exercise6Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 7: Specific Range [a-z]{3,} (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata huruf kecil minimal 3 karakter

  static bool? exercise7Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 8: Zero or More * (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match dengan * (zero or more)
  // - Pattern: \b\w*\b

  static bool? exercise8Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 9: Digit Pattern \d{3}-\d{2}-\d{4} (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match pattern angka seperti SSN: 123-45-6789

  static bool? exercise9Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 10: Exact Length \w{5} (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata dengan exactly 5 karakter

  static bool? exercise10Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 11: Start Anchor ^ dan Character Class (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match string yang dimulai dengan huruf kapital
  // - Pattern: ^[A-Z]{1}\w+$

  static bool? exercise11Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 12: Vowel Match (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata yang mengandung vokal

  static bool? exercise12Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 13: Digit Match \d+ (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata yang mengandung angka

  static bool? exercise13Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 14: Capital First Letter (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata yang dimulai dengan huruf kapital

  static bool? exercise14Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 15: Minimum Length {4,} (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata dengan minimal 4 karakter

  static bool? exercise15Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 16: Lowercase Only (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata dengan huruf kecil saja

  static bool? exercise16Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 17: Contains Digit (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata yang mengandung angka

  static bool? exercise17Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 18: Contains Uppercase (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata yang mengandung huruf kapital

  static bool? exercise18Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 19: Contains Lowercase (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata yang mengandung huruf kecil

  static bool? exercise19Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 20: Special Character (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata yang mengandung karakter khusus

  static bool? exercise20Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 21: Contains Vowel (Case Insensitive) (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata yang mengandung vokal (a,e,i,o,u, A,E,I,O,U)

  static bool? exercise21Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 22: Contains Consonant (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata yang mengandung konsonan

  static bool? exercise22Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 23: Multiple Digits (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata dengan minimal 2 angka

  static bool? exercise23Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 24: Multiple Uppercase (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata dengan minimal 2 huruf kapital

  static bool? exercise24Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 25: Multiple Lowercase (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata dengan minimal 2 huruf kecil

  static bool? exercise25Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 26: Multiple Vowels (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata dengan minimal 2 vokal

  static bool? exercise26Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 27: Multiple Consonants (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata dengan minimal 2 konsonan

  static bool? exercise27Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 28: Digit and Uppercase (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata dengan angka dan huruf kapital

  static bool? exercise28Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 29: Uppercase and Digit (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata dengan huruf kapital dan angka

  static bool? exercise29Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 30: Lowercase and Digit (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata dengan huruf kecil dan angka

  static bool? exercise30Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 31: Digit and Lowercase (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata dengan angka dan huruf kecil

  static bool? exercise31Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 32: Vowel and Digit (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Match kata dengan vokal dan angka

  static bool? exercise32Solution(String text, String pattern) {
    bool? isMatch;

    // TULIS KODE DI SINI:

    return isMatch; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 33: Extract Email Address (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Extract alamat email dari text
  // - Pattern email: [A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}
  //
  // HINT: Gunakan exp.firstMatch(text)?.group(0)

  static String? exercise33Solution(String text) {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 34: Extract Phone Number (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Extract nomor telepon dari text
  // - Pattern: \+?\d{1,3}[-\s]?\d{1,4}[-\s]?\d{1,4}[-\s]?\d{1,9}
  //
  // HINT: Gunakan exp.firstMatch(text)?.group(0)

  static String? exercise34Solution(String text) {
    String? output;

    // TULIS KODE DI SINI:

    return output; // ← JANGAN UBAH BARIS INI!
  }
}
