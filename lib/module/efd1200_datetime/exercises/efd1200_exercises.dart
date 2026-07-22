// LEMBAR KERJA SISWA - EFD1200 DATETIME
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

import 'package:intl/intl.dart';

/// Class yang berisi jawaban siswa untuk semua exercise
class Efd1200Exercises {
  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 1: Format Date to yyyy-MM-dd (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Format tanggal ke format yyyy-MM-dd
  //
  // CONTOH:
  // Input:  2024-03-15 14:30:00
  // Output: "2024-03-15"
  //
  // HINT: Gunakan DateFormat("yyyy-MM-dd").format(date)

  static String? exercise1Solution(DateTime date) {
    String? datef;

    // TULIS KODE DI SINI:
    datef = DateFormat("yyyy-MM-dd").format(date);

    return datef; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 2: Format DateTime to yyyy-MM-dd kk:mm (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Format tanggal dan waktu ke format yyyy-MM-dd kk:mm
  //
  // CONTOH:
  // Input:  2024-03-15 14:30:00
  // Output: "2024-03-15 14:30"
  //
  // HINT: Gunakan DateFormat("yyyy-MM-dd kk:mm").format(date)

  static String? exercise2Solution(DateTime date) {
    String? datef;

    // TULIS KODE DI SINI:

    return datef; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 3: Get Day from Date (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ambil hari (day) dari tanggal
  //
  // CONTOH:
  // Input:  2024-03-15
  // Output: 15
  //
  // HINT: Gunakan date.day

  static int? exercise3Solution(DateTime date) {
    int? day;

    // TULIS KODE DI SINI:

    return day; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 4: Get Month from Date (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ambil bulan (month) dari tanggal
  //
  // CONTOH:
  // Input:  2024-03-15
  // Output: 3
  //
  // HINT: Gunakan date.month

  static int? exercise4Solution(DateTime date) {
    int? month;

    // TULIS KODE DI SINI:

    return month; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 5: Get Year from Date (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ambil tahun (year) dari tanggal
  //
  // CONTOH:
  // Input:  2024-03-15
  // Output: 2024
  //
  // HINT: Gunakan date.year

  static int? exercise5Solution(DateTime date) {
    int? year;

    // TULIS KODE DI SINI:

    return year; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 6: Format Time to kk:mm (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Format waktu ke format kk:mm (24-hour)
  //
  // CONTOH:
  // Input:  2024-03-15 14:30:00
  // Output: "14:30"
  //
  // HINT: Gunakan DateFormat("kk:mm").format(date)

  static String? exercise6Solution(DateTime date) {
    String? time;

    // TULIS KODE DI SINI:

    return time; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 7: Format Current Date to yyyy-MM-dd (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Format tanggal ke format yyyy-MM-dd
  //
  // HINT: Gunakan DateFormat("yyyy-MM-dd").format(date)

  static String? exercise7Solution(DateTime date) {
    String? datef;

    // TULIS KODE DI SINI:

    return datef; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 8: Format Current Time to kk:mm:ss (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Format waktu ke format kk:mm:ss
  //
  // CONTOH:
  // Input:  2024-03-15 14:30:45
  // Output: "14:30:45"
  //
  // HINT: Gunakan DateFormat("kk:mm:ss").format(date)

  static String? exercise8Solution(DateTime date) {
    String? time;

    // TULIS KODE DI SINI:

    return time; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 9: Calculate Difference in Days (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung selisih hari antara dua tanggal
  //
  // CONTOH:
  // Input:  startAt=2024-03-01, endAt=2024-03-15
  // Output: 14
  //
  // HINT: Gunakan endAt.difference(startAt).inDays

  static int? exercise9Solution(DateTime startAt, DateTime endAt) {
    int? diff;

    // TULIS KODE DI SINI:

    return diff; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 10: Format Date to EEEE, d MMM y (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Format tanggal ke format panjang (Nama Hari, Tanggal Bulan Tahun)
  //
  // CONTOH:
  // Input:  2024-03-15
  // Output: "Friday, 15 Mar 2024"
  //
  // HINT: Gunakan DateFormat("EEEE, d MMM y").format(date)

  static String? exercise10Solution(DateTime date) {
    String? datef;

    // TULIS KODE DI SINI:

    return datef; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 11: Add Days to Date (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Tambahkan sejumlah hari ke tanggal
  //
  // CONTOH:
  // Input:  date=2024-03-15, days=5
  // Output: 2024-03-20
  //
  // HINT: Gunakan date.add(Duration(days: days))

  static DateTime? exercise11Solution(DateTime date, int days) {
    DateTime? newDate;

    // TULIS KODE DI SINI:

    return newDate; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 12: Subtract Days from Date (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Kurangi sejumlah hari dari tanggal
  //
  // CONTOH:
  // Input:  date=2024-03-15, days=5
  // Output: 2024-03-10
  //
  // HINT: Gunakan date.subtract(Duration(days: days))

  static DateTime? exercise12Solution(DateTime date, int days) {
    DateTime? newDate;

    // TULIS KODE DI SINI:

    return newDate; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 13: Parse String to DateTime (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Konversi string ke DateTime
  //
  // CONTOH:
  // Input:  "2024-03-15"
  // Output: 2024-03-15 00:00:00
  //
  // HINT: Gunakan DateTime.parse(dateStr)

  static DateTime? exercise13Solution(String dateStr) {
    DateTime? date;

    // TULIS KODE DI SINI:

    return date; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 14: Get Weekday Name (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ambil nama hari dari tanggal
  //
  // CONTOH:
  // Input:  2024-03-15 (Friday)
  // Output: "Friday"
  //
  // HINT: Gunakan DateFormat("EEEE").format(date)

  static String? exercise14Solution(DateTime date) {
    String? weekday;

    // TULIS KODE DI SINI:

    return weekday; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 15: Get Month Name (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ambil nama bulan dari tanggal
  //
  // CONTOH:
  // Input:  2024-03-15
  // Output: "March"
  //
  // HINT: Gunakan DateFormat("MMMM").format(date)

  static String? exercise15Solution(DateTime date) {
    String? month;

    // TULIS KODE DI SINI:

    return month; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 16: Format Date to dd/MM/yyyy (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Format tanggal ke format dd/MM/yyyy
  //
  // CONTOH:
  // Input:  2024-03-15
  // Output: "15/03/2024"
  //
  // HINT: Gunakan DateFormat("dd/MM/yyyy").format(date)

  static String? exercise16Solution(DateTime date) {
    String? datef;

    // TULIS KODE DI SINI:

    return datef; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 17: Get Hour from DateTime (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ambil jam (hour) dari datetime
  //
  // CONTOH:
  // Input:  2024-03-15 14:30:00
  // Output: 14
  //
  // HINT: Gunakan date.hour

  static int? exercise17Solution(DateTime date) {
    int? hour;

    // TULIS KODE DI SINI:

    return hour; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 18: Get Minute from DateTime (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ambil menit (minute) dari datetime
  //
  // CONTOH:
  // Input:  2024-03-15 14:30:00
  // Output: 30
  //
  // HINT: Gunakan date.minute

  static int? exercise18Solution(DateTime date) {
    int? minute;

    // TULIS KODE DI SINI:

    return minute; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 19: Get Second from DateTime (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ambil detik (second) dari datetime
  //
  // CONTOH:
  // Input:  2024-03-15 14:30:45
  // Output: 45
  //
  // HINT: Gunakan date.second

  static int? exercise19Solution(DateTime date) {
    int? second;

    // TULIS KODE DI SINI:

    return second; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 20: Check if Date is Today (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah tanggal adalah hari ini
  //
  // HINT: Bandingkan year, month, day dengan DateTime.now()

  static bool? exercise20Solution(DateTime date) {
    bool? isToday;

    // TULIS KODE DI SINI:

    return isToday; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 21: Check if Date is in Past (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah tanggal adalah masa lalu
  //
  // HINT: Gunakan date.isBefore(DateTime.now())

  static bool? exercise21Solution(DateTime date) {
    bool? isPast;

    // TULIS KODE DI SINI:

    return isPast; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 22: Check if Date is in Future (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah tanggal adalah masa depan
  //
  // HINT: Gunakan date.isAfter(DateTime.now())

  static bool? exercise22Solution(DateTime date) {
    bool? isFuture;

    // TULIS KODE DI SINI:

    return isFuture; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 23: Get Difference in Hours (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung selisih jam antara dua datetime
  //
  // HINT: Gunakan endAt.difference(startAt).inHours

  static int? exercise23Solution(DateTime startAt, DateTime endAt) {
    int? diff;

    // TULIS KODE DI SINI:

    return diff; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 24: Get Difference in Minutes (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung selisih menit antara dua datetime
  //
  // HINT: Gunakan endAt.difference(startAt).inMinutes

  static int? exercise24Solution(DateTime startAt, DateTime endAt) {
    int? diff;

    // TULIS KODE DI SINI:

    return diff; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 25: Format Date to MMM d, yyyy (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Format tanggal ke format MMM d, yyyy
  //
  // CONTOH:
  // Input:  2024-03-15
  // Output: "Mar 15, 2024"
  //
  // HINT: Gunakan DateFormat("MMM d, yyyy").format(date)

  static String? exercise25Solution(DateTime date) {
    String? datef;

    // TULIS KODE DI SINI:

    return datef; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 26: Add Hours to DateTime (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Tambahkan sejumlah jam ke datetime
  //
  // HINT: Gunakan date.add(Duration(hours: hours))

  static DateTime? exercise26Solution(DateTime date, int hours) {
    DateTime? newDate;

    // TULIS KODE DI SINI:

    return newDate; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 27: Subtract Hours from DateTime (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Kurangi sejumlah jam dari datetime
  //
  // HINT: Gunakan date.subtract(Duration(hours: hours))

  static DateTime? exercise27Solution(DateTime date, int hours) {
    DateTime? newDate;

    // TULIS KODE DI SINI:

    return newDate; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 28: Get Milliseconds Since Epoch (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ambil milliseconds sejak epoch (1 Jan 1970)
  //
  // HINT: Gunakan date.millisecondsSinceEpoch

  static int? exercise28Solution(DateTime date) {
    int? millis;

    // TULIS KODE DI SINI:

    return millis; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 29: Create DateTime from Milliseconds (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Buat DateTime dari milliseconds
  //
  // HINT: Gunakan DateTime.fromMillisecondsSinceEpoch(milliseconds)

  static DateTime? exercise29Solution(int milliseconds) {
    DateTime? date;

    // TULIS KODE DI SINI:

    return date; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 30: Get Weekday Number (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ambil nomor hari dalam seminggu (1=Monday, 7=Sunday)
  //
  // HINT: Gunakan date.weekday

  static int? exercise30Solution(DateTime date) {
    int? weekday;

    // TULIS KODE DI SINI:

    return weekday; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 31: Check if Same Day (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah dua tanggal adalah hari yang sama
  //
  // HINT: Bandingkan year, month, day

  static bool? exercise31Solution(DateTime date1, DateTime date2) {
    bool? isSameDay;

    // TULIS KODE DI SINI:

    return isSameDay; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 32: Get First Day of Month (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ambil tanggal pertama bulan tersebut
  //
  // CONTOH:
  // Input:  2024-03-15
  // Output: 2024-03-01
  //
  // HINT: Gunakan DateTime(date.year, date.month, 1)

  static DateTime? exercise32Solution(DateTime date) {
    DateTime? firstDay;

    // TULIS KODE DI SINI:

    return firstDay; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 33: Get Last Day of Month (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Ambil tanggal terakhir bulan tersebut
  //
  // CONTOH:
  // Input:  2024-03-15
  // Output: 2024-03-31
  //
  // HINT: Gunakan DateTime(date.year, date.month + 1, 0)

  static DateTime? exercise33Solution(DateTime date) {
    DateTime? lastDay;

    // TULIS KODE DI SINI:

    return lastDay; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 34: Format Date to Relative Time (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Format tanggal menjadi relative time (e.g., "2 days ago")
  //
  // HINT: Hitung selisih dengan DateTime.now() dan format

  static String? exercise34Solution(DateTime date) {
    String? relative;

    // TULIS KODE DI SINI:

    return relative; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 35: Check if Leap Year (VALIDATED)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah tahun adalah tahun kabisat
  //
  // HINT:
  // Tahun kabisat jika:
  // - Habis dibagi 4, DAN
  // - Tidak habis dibagi 100, ATAU habis dibagi 400

  static bool? exercise35Solution(int year) {
    bool? isLeap;

    // TULIS KODE DI SINI:

    return isLeap; // ← JANGAN UBAH BARIS INI!
  }
}
