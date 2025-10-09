// 📝 LEMBAR KERJA SISWA - EFD1400 NUMBER
// Isi fungsi-fungsi berikut sesuai instruksi. Jangan ubah signature.

class Efd1400Exercises {
  // 1. Try parse dengan default value 0
  static int? exercise1Solution(String input) {
    int? number;
    // 👇 TULIS KODE DI SINI:
    // Gunakan int.tryParse, jika null set ke 0

    return number;
  }

  // 2. Clean non-numeric characters dengan regex
  static int? exercise2Solution(String input) {
    int? number;
    // 👇 TULIS KODE DI SINI:
    // Hapus semua non-numeric dengan .replaceAll(RegExp(r'[^0-9]+'), '')
    // Lalu parse ke int

    return number;
  }

  // 3. Parse double dengan string input
  static double? exercise3Solution(double input) {
    double? number;
    // 👇 TULIS KODE DI SINI:
    // Input sudah double, langsung assign

    return number;
  }

  // 4. Try parse double dengan default 0
  static double? exercise4Solution(String input) {
    double? number;
    // 👇 TULIS KODE DI SINI:
    // Gunakan double.tryParse, jika null set ke 0

    return number;
  }

  // 5. Fix variable types untuk function call
  static double? exercise5Solution() {
    double? total;
    double qty = 2;
    double price = 100;
    // 👇 TULIS KODE DI SINI:
    // Hitung total = qty * price

    return total;
  }

  // 6. Fix division result type
  static double? exercise6Solution() {
    double? total;
    // 👇 TULIS KODE DI SINI:
    // total = 23 / 2

    return total;
  }

  // 7. Format double dengan toStringAsFixed
  static String? exercise7Solution(double price) {
    String? output;
    // 👇 TULIS KODE DI SINI:
    // Gunakan price.toStringAsFixed(2)

    return output;
  }

  // 8. Pad left dengan zero
  static String? exercise8Solution(int id) {
    String? output;
    // 👇 TULIS KODE DI SINI:
    // id.toString().padLeft(8, "0")

    return output;
  }

  // 9. Format currency rupiah
  static String? exercise9Solution(int input) {
    String? formattedInput;
    // 👇 TULIS KODE DI SINI:
    // Gunakan regex untuk menambah titik ribuan, tambah "Rp" di depan

    return formattedInput;
  }

  // 10. Format currency dollar
  static String? exercise10Solution(int input) {
    String? formattedInput;
    // 👇 TULIS KODE DI SINI:
    // Gunakan regex untuk menambah titik ribuan, tambah "\$" di depan

    return formattedInput;
  }

  // 11. Ceil (bulatkan ke atas)
  static double? exercise11Solution(double number) {
    double? output;
    // 👇 TULIS KODE DI SINI:
    // Gunakan number.ceil()

    return output;
  }

  // 12. Floor (bulatkan ke bawah)
  static double? exercise12Solution(double number) {
    double? output;
    // 👇 TULIS KODE DI SINI:
    // Gunakan number.floor()

    return output;
  }

  // 13. Check even number
  static bool? exercise13Solution(int input) {
    bool? output;
    // 👇 TULIS KODE DI SINI:
    // input % 2 == 0

    return output;
  }

  // 14. Round to 2 decimal places
  static double? exercise14Solution(double input) {
    double? output;
    // 👇 TULIS KODE DI SINI:
    // double.parse(input.toStringAsFixed(2))

    return output;
  }

  // 15. Check divisible by 3
  static bool? exercise15Solution(int input) {
    bool? output;
    // 👇 TULIS KODE DI SINI:
    // input % 3 == 0

    return output;
  }

  // 16. Check divisible by 6
  static bool? exercise16Solution(int input) {
    bool? output;
    // 👇 TULIS KODE DI SINI:
    // input % 6 == 0

    return output;
  }

  // 17. Swap two numbers
  static Map<String, int>? exercise17Solution(int a, int b) {
    int? c;
    int? d;
    // 👇 TULIS KODE DI SINI:
    // Tukar nilai a dan b

    if (c == null || d == null) return null;
    return {"c": c, "d": d};
  }

  // 18. Check prime number
  static bool? exercise18Solution(int input) {
    bool? output;
    // 👇 TULIS KODE DI SINI:
    // Cek apakah input adalah bilangan prima

    return output;
  }

  // 19. Round to 1 decimal place
  static double? exercise19Solution(double input) {
    double? output;
    // 👇 TULIS KODE DI SINI:
    // double.parse(input.toStringAsFixed(1))

    return output;
  }

  // 20. Check divisible by 9
  static bool? exercise20Solution(int input) {
    bool? output;
    // 👇 TULIS KODE DI SINI:
    // input % 9 == 0

    return output;
  }

  // 21. String to int
  static int? exercise21Solution(String input) {
    int? output;
    // 👇 TULIS KODE DI SINI:
    // int.parse(input)

    return output;
  }

  // 22. String to double
  static double? exercise22Solution(String input) {
    double? output;
    // 👇 TULIS KODE DI SINI:
    // double.parse(input)

    return output;
  }

  // 23. Int to string
  static String? exercise23Solution(int input) {
    String? output;
    // 👇 TULIS KODE DI SINI:
    // input.toString()

    return output;
  }

  // 24. Double to string
  static String? exercise24Solution(double input) {
    String? output;
    // 👇 TULIS KODE DI SINI:
    // input.toString()

    return output;
  }

  // 25. Check if string is integer
  static bool? exercise25Solution(String input) {
    bool? output;
    // 👇 TULIS KODE DI SINI:
    // int.tryParse(input) != null

    return output;
  }

  // 26. Check if string is double
  static bool? exercise26Solution(String input) {
    bool? output;
    // 👇 TULIS KODE DI SINI:
    // double.tryParse(input) != null

    return output;
  }

  // 27. Check if string is NOT integer
  static bool? exercise27Solution(String input) {
    bool? output;
    // 👇 TULIS KODE DI SINI:
    // int.tryParse(input) == null

    return output;
  }

  // 28. Check if string is NOT double
  static bool? exercise28Solution(String input) {
    bool? output;
    // 👇 TULIS KODE DI SINI:
    // double.tryParse(input) == null

    return output;
  }

  // 29. Check if number is negative
  static bool? exercise29Solution(int input) {
    bool? output;
    // 👇 TULIS KODE DI SINI:
    // input < 0

    return output;
  }

  // 30. Check if number is negative (true case)
  static bool? exercise30Solution(int input) {
    bool? output;
    // 👇 TULIS KODE DI SINI:
    // input < 0

    return output;
  }

  // 31. Check if number is positive
  static bool? exercise31Solution(int input) {
    bool? output;
    // 👇 TULIS KODE DI SINI:
    // input > 0

    return output;
  }

  // 32. Check if number is positive (false case)
  static bool? exercise32Solution(int input) {
    bool? output;
    // 👇 TULIS KODE DI SINI:
    // input > 0

    return output;
  }

  // 33. Parse comma-separated decimal
  static double? exercise33Solution(String input) {
    double? output;
    // 👇 TULIS KODE DI SINI:
    // Hapus koma, parse ke double

    return output;
  }

  // 34. Parse comma-separated integer
  static int? exercise34Solution(String input) {
    int? output;
    // 👇 TULIS KODE DI SINI:
    // Hapus koma, parse ke int

    return output;
  }

  // 35. Check if string can be parsed to double
  static bool? exercise35Solution(String input) {
    bool? output;
    // 👇 TULIS KODE DI SINI:
    // double.tryParse(input) != null

    return output;
  }
}
