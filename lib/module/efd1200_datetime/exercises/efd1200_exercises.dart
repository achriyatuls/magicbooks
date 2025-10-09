// 📝 LEMBAR KERJA SISWA - EFD1200 DATETIME
// Isi fungsi-fungsi berikut sesuai instruksi. Jangan ubah signature.

import 'package:intl/intl.dart';

class Efd1200Exercises {
  // 1. Format date to yyyy-MM-dd
  static String? exercise1Solution(DateTime date) {
    String? datef;
    // 👇 TULIS KODE DI SINI:
    // Gunakan DateFormat("yyyy-MM-dd").format(date)

    return datef;
  }

  // 2. Format datetime to yyyy-MM-dd kk:mm
  static String? exercise2Solution(DateTime date) {
    String? datef;
    // 👇 TULIS KODE DI SINI:
    // Gunakan DateFormat("yyyy-MM-dd kk:mm").format(date)

    return datef;
  }

  // 3. Get day from date
  static int? exercise3Solution(DateTime date) {
    int? day;
    // 👇 TULIS KODE DI SINI:
    // Gunakan date.day

    return day;
  }

  // 4. Get month from date
  static int? exercise4Solution(DateTime date) {
    int? month;
    // 👇 TULIS KODE DI SINI:
    // Gunakan date.month

    return month;
  }

  // 5. Get year from date
  static int? exercise5Solution(DateTime date) {
    int? year;
    // 👇 TULIS KODE DI SINI:
    // Gunakan date.year

    return year;
  }

  // 6. Format time to kk:mm
  static String? exercise6Solution(DateTime date) {
    String? time;
    // 👇 TULIS KODE DI SINI:
    // Gunakan DateFormat("kk:mm").format(date)

    return time;
  }

  // 7. Format current date to yyyy-MM-dd
  static String? exercise7Solution(DateTime date) {
    String? datef;
    // 👇 TULIS KODE DI SINI:
    // Gunakan DateFormat("yyyy-MM-dd").format(date)

    return datef;
  }

  // 8. Format current time to kk:mm:ss
  static String? exercise8Solution(DateTime date) {
    String? time;
    // 👇 TULIS KODE DI SINI:
    // Gunakan DateFormat("kk:mm:ss").format(date)

    return time;
  }

  // 9. Calculate difference in days
  static int? exercise9Solution(DateTime startAt, DateTime endAt) {
    int? diff;
    // 👇 TULIS KODE DI SINI:
    // Gunakan endAt.difference(startAt).inDays

    return diff;
  }

  // 10. Format date to EEEE, d MMM y
  static String? exercise10Solution(DateTime date) {
    String? datef;
    // 👇 TULIS KODE DI SINI:
    // Gunakan DateFormat("EEEE, d MMM y").format(date)

    return datef;
  }

  // 11. Add days to date
  static DateTime? exercise11Solution(DateTime date, int days) {
    DateTime? newDate;
    // 👇 TULIS KODE DI SINI:
    // Gunakan date.add(Duration(days: days))

    return newDate;
  }

  // 12. Subtract days from date
  static DateTime? exercise12Solution(DateTime date, int days) {
    DateTime? newDate;
    // 👇 TULIS KODE DI SINI:
    // Gunakan date.subtract(Duration(days: days))

    return newDate;
  }

  // 13. Parse string to DateTime
  static DateTime? exercise13Solution(String dateStr) {
    DateTime? date;
    // 👇 TULIS KODE DI SINI:
    // Gunakan DateTime.parse(dateStr)

    return date;
  }

  // 14. Get weekday name
  static String? exercise14Solution(DateTime date) {
    String? weekday;
    // 👇 TULIS KODE DI SINI:
    // Gunakan DateFormat("EEEE").format(date)

    return weekday;
  }

  // 15. Get month name
  static String? exercise15Solution(DateTime date) {
    String? month;
    // 👇 TULIS KODE DI SINI:
    // Gunakan DateFormat("MMMM").format(date)

    return month;
  }

  // 16. Format date to dd/MM/yyyy
  static String? exercise16Solution(DateTime date) {
    String? datef;
    // 👇 TULIS KODE DI SINI:
    // Gunakan DateFormat("dd/MM/yyyy").format(date)

    return datef;
  }

  // 17. Get hour from datetime
  static int? exercise17Solution(DateTime date) {
    int? hour;
    // 👇 TULIS KODE DI SINI:
    // Gunakan date.hour

    return hour;
  }

  // 18. Get minute from datetime
  static int? exercise18Solution(DateTime date) {
    int? minute;
    // 👇 TULIS KODE DI SINI:
    // Gunakan date.minute

    return minute;
  }

  // 19. Get second from datetime
  static int? exercise19Solution(DateTime date) {
    int? second;
    // 👇 TULIS KODE DI SINI:
    // Gunakan date.second

    return second;
  }

  // 20. Check if date is today
  static bool? exercise20Solution(DateTime date) {
    bool? isToday;
    // 👇 TULIS KODE DI SINI:
    // Bandingkan year, month, day dengan DateTime.now()

    return isToday;
  }

  // 21. Check if date is in past
  static bool? exercise21Solution(DateTime date) {
    bool? isPast;
    // 👇 TULIS KODE DI SINI:
    // Gunakan date.isBefore(DateTime.now())

    return isPast;
  }

  // 22. Check if date is in future
  static bool? exercise22Solution(DateTime date) {
    bool? isFuture;
    // 👇 TULIS KODE DI SINI:
    // Gunakan date.isAfter(DateTime.now())

    return isFuture;
  }

  // 23. Get difference in hours
  static int? exercise23Solution(DateTime startAt, DateTime endAt) {
    int? diff;
    // 👇 TULIS KODE DI SINI:
    // Gunakan endAt.difference(startAt).inHours

    return diff;
  }

  // 24. Get difference in minutes
  static int? exercise24Solution(DateTime startAt, DateTime endAt) {
    int? diff;
    // 👇 TULIS KODE DI SINI:
    // Gunakan endAt.difference(startAt).inMinutes

    return diff;
  }

  // 25. Format date to MMM d, yyyy
  static String? exercise25Solution(DateTime date) {
    String? datef;
    // 👇 TULIS KODE DI SINI:
    // Gunakan DateFormat("MMM d, yyyy").format(date)

    return datef;
  }

  // 26. Add hours to datetime
  static DateTime? exercise26Solution(DateTime date, int hours) {
    DateTime? newDate;
    // 👇 TULIS KODE DI SINI:
    // Gunakan date.add(Duration(hours: hours))

    return newDate;
  }

  // 27. Subtract hours from datetime
  static DateTime? exercise27Solution(DateTime date, int hours) {
    DateTime? newDate;
    // 👇 TULIS KODE DI SINI:
    // Gunakan date.subtract(Duration(hours: hours))

    return newDate;
  }

  // 28. Get milliseconds since epoch
  static int? exercise28Solution(DateTime date) {
    int? millis;
    // 👇 TULIS KODE DI SINI:
    // Gunakan date.millisecondsSinceEpoch

    return millis;
  }

  // 29. Create DateTime from milliseconds
  static DateTime? exercise29Solution(int milliseconds) {
    DateTime? date;
    // 👇 TULIS KODE DI SINI:
    // Gunakan DateTime.fromMillisecondsSinceEpoch(milliseconds)

    return date;
  }

  // 30. Get weekday number (1=Monday, 7=Sunday)
  static int? exercise30Solution(DateTime date) {
    int? weekday;
    // 👇 TULIS KODE DI SINI:
    // Gunakan date.weekday

    return weekday;
  }

  // 31. Check if same day
  static bool? exercise31Solution(DateTime date1, DateTime date2) {
    bool? isSameDay;
    // 👇 TULIS KODE DI SINI:
    // Bandingkan year, month, day

    return isSameDay;
  }

  // 32. Get first day of month
  static DateTime? exercise32Solution(DateTime date) {
    DateTime? firstDay;
    // 👇 TULIS KODE DI SINI:
    // Gunakan DateTime(date.year, date.month, 1)

    return firstDay;
  }

  // 33. Get last day of month
  static DateTime? exercise33Solution(DateTime date) {
    DateTime? lastDay;
    // 👇 TULIS KODE DI SINI:
    // Gunakan DateTime(date.year, date.month + 1, 0)

    return lastDay;
  }

  // 34. Format date to relative time (e.g., "2 days ago")
  static String? exercise34Solution(DateTime date) {
    String? relative;
    // 👇 TULIS KODE DI SINI:
    // Hitung selisih dengan DateTime.now() dan format

    return relative;
  }

  // 35. Check if leap year
  static bool? exercise35Solution(int year) {
    bool? isLeap;
    // 👇 TULIS KODE DI SINI:
    // Cek apakah tahun kabisat

    return isLeap;
  }
}
