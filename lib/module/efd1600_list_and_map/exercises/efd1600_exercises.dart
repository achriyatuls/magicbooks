// LEMBAR KERJA SISWA - EFD1600 LIST AND MAP
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
class Efd1600Exercises {
  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 1: Total Penjualan (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung total penjualan dari List sales
  // - HINT: Gunakan for loop untuk menjumlahkan semua nilai

  static bool exercise1() {
    List<double> sales = [12.5, 20.0, 15.0, 10.0, 5.0];
    double? total;

    // TULIS KODE DI SINI:

    return total == 62.5; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 2: Average Penjualan (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung rata-rata penjualan dari List sales
  // - HINT: Total dibagi dengan sales.length

  static bool exercise2() {
    List<double> sales = [12.5, 20.0, 15.0, 10.0, 5.0];
    double? average = 0;

    // TULIS KODE DI SINI:

    return average == 12.5; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 3: Nilai Tertinggi (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cari nilai tertinggi dari List numbers
  // - HINT: Gunakan .reduce() atau loop manual

  static bool exercise3() {
    List<int> numbers = [1, 2, 3, 4, 5];
    int? highest = 0;

    // TULIS KODE DI SINI:

    return highest == 5; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 4: Nilai Terendah (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cari nilai terendah dari List numbers
  // - HINT: Gunakan .reduce() atau loop manual

  static bool exercise4() {
    List<int> numbers = [1, 2, 3, 4, 5];
    int? lowest = 0;

    // TULIS KODE DI SINI:

    return lowest == 1; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 5: Jumlah Angka Genap (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung jumlah total dari angka genap saja
  // - HINT: Gunakan for loop dan cek dengan % 2 == 0

  static bool exercise5() {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    int? even = 0;

    // TULIS KODE DI SINI:

    return even == 30; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 6: Jumlah Angka Ganjil (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung jumlah total dari angka ganjil saja
  // - HINT: Gunakan for loop dan cek dengan % 2 != 0

  static bool exercise6() {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    int? odd = 0;

    // TULIS KODE DI SINI:

    return odd == 25; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 7: Angka Terbesar (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cari angka terbesar dari List
  // - HINT: Bisa gunakan .reduce((a,b) => a > b ? a : b)

  static bool exercise7() {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    int? largest = 0;

    // TULIS KODE DI SINI:

    return largest == 10; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 8: Angka Terkecil (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cari angka terkecil dari List
  // - HINT: Bisa gunakan .reduce((a,b) => a < b ? a : b)

  static bool exercise8() {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    int? smallest = 0;

    // TULIS KODE DI SINI:

    return smallest == 1; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 9: Count Above 5 (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung berapa banyak angka yang lebih besar dari 5
  // - HINT: Gunakan .where((n) => n > 5).length

  static bool exercise9() {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    int? above = 0;

    // TULIS KODE DI SINI:

    return above == 5; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 10: Count Below 5 (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung berapa banyak angka yang lebih kecil dari 5
  // - HINT: Gunakan .where((n) => n < 5).length

  static bool exercise10() {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    int? below = 0;

    // TULIS KODE DI SINI:

    return below == 4; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 11: String Starts With (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah ada buah yang dimulai dengan huruf "e"
  // - HINT: Gunakan .any((f) => f.startsWith('e'))

  static bool exercise11() {
    List<String> fruits = ["apple", "banana", "cherry", "date", "elderberry"];
    bool? result;

    // TULIS KODE DI SINI:

    return result == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 12: Check Multiple of 10 (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah semua angka adalah kelipatan 10
  // - HINT: Gunakan .every((n) => n % 10 == 0)

  static bool exercise12() {
    List<int> numbers = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
    bool? result;

    // TULIS KODE DI SINI:

    return result == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 13: Check String Length (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah ada mobil yang namanya memiliki 5 huruf
  // - HINT: Gunakan .any((c) => c.length == 5)

  static bool exercise13() {
    List<String> cars = ["Audi", "BMW", "Chevrolet", "Dodge", "Ferrari"];
    bool? result;

    // TULIS KODE DI SINI:

    return result == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 14: Check Temperature Value (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah ada suhu yang sama dengan 40.0
  // - HINT: Gunakan .contains(40.0)

  static bool exercise14() {
    List<double> temperatures = [32.0, 35.6, 37.2, 39.8, 40.0];
    bool? result;

    // TULIS KODE DI SINI:

    return result == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 15: Check Animal Name Length (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah ada hewan dengan nama 5 huruf
  // - HINT: Gunakan .any((a) => a.length == 5)

  static bool exercise15() {
    List<String> animals = ["cat", "dog", "elephant", "fish", "giraffe"];
    bool? result;

    // TULIS KODE DI SINI:

    return result == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 16: Check First Letter (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah ada nama yang dimulai dengan huruf "J"
  // - HINT: Gunakan .any((n) => n.startsWith('J'))

  static bool exercise16() {
    List<String> names = ["John", "Jane", "Jim", "Jenny", "Jake"];
    bool? result;

    // TULIS KODE DI SINI:

    return result == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 17: Check Divisible by 7 (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah ada angka yang habis dibagi 7
  // - HINT: Gunakan .any((n) => n % 7 == 0)

  static bool exercise17() {
    List<int> numbers = [3, 7, 12, 24, 35, 48, 63, 80];
    bool? result;

    // TULIS KODE DI SINI:

    return result == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 18: Check Fibonacci (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah ada angka fibonacci dalam list
  // - HINT: Semua angka di list ini adalah fibonacci, gunakan .isNotEmpty

  static bool exercise18() {
    List<int> numbers = [3, 5, 8, 13, 21, 34, 55, 89];
    bool? result;

    // TULIS KODE DI SINI:

    return result == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 19: Check Same Length (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah ada kata yang memiliki jumlah huruf yang sama
  // - HINT: Bandingkan length dari setiap kata

  static bool exercise19() {
    List<String> words = ["apple", "banana", "cherry", "date", "elderberry"];
    bool? result;

    // TULIS KODE DI SINI:

    return result == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 20: Check Prime Number (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah ada bilangan prima dalam list
  // - HINT: Ada bilangan prima seperti 2, 3, 5, 7

  static bool exercise20() {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    bool? result;

    // TULIS KODE DI SINI:

    return result == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 21: Check Salary >= 9000 (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah ada karyawan dengan gaji >= 9000
  // - HINT: Gunakan .any((e) => e["salary"] >= 9000)

  static bool exercise21() {
    List<Map<String, dynamic>> employeeSalaries = [
      {"name": "John", "salary": 5000},
      {"name": "Jane", "salary": 6000},
      {"name": "Jim", "salary": 7000},
      {"name": "Jake", "salary": 8000},
      {"name": "Jerry", "salary": 9000},
    ];
    bool? result;

    // TULIS KODE DI SINI:

    return result == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 22: Total Salary (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung total gaji semua karyawan
  // - HINT: Loop dan jumlahkan e["salary"]

  static bool exercise22() {
    List<Map<String, dynamic>> employeeSalaries = [
      {"name": "John", "salary": 5000},
      {"name": "Jane", "salary": 6000},
      {"name": "Jim", "salary": 7000},
      {"name": "Jake", "salary": 8000},
      {"name": "Jerry", "salary": 9000},
    ];
    double? total;

    // TULIS KODE DI SINI:

    return total == 35000; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 23: Lowest Salary Name (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cari nama karyawan dengan gaji terendah
  // - HINT: Loop dan bandingkan salary

  static bool exercise23() {
    List<Map<String, dynamic>> employeeSalaries = [
      {"name": "John", "salary": 5000},
      {"name": "Jane", "salary": 6000},
      {"name": "Jim", "salary": 7000},
      {"name": "Jake", "salary": 8000},
      {"name": "Jerry", "salary": 9000},
    ];
    String? result;

    // TULIS KODE DI SINI:

    return result == "John"; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 24: Highest Salary Name (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cari nama karyawan dengan gaji tertinggi
  // - HINT: Loop dan bandingkan salary

  static bool exercise24() {
    List<Map<String, dynamic>> employeeSalaries = [
      {"name": "John", "salary": 5000},
      {"name": "Jane", "salary": 6000},
      {"name": "Jim", "salary": 7000},
      {"name": "Jake", "salary": 8000},
      {"name": "Jerry", "salary": 9000},
    ];
    String? result;

    // TULIS KODE DI SINI:

    return result == "Jerry"; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 25: Check Same Salary (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah ada karyawan dengan gaji yang sama
  // - HINT: Gunakan Set untuk cek duplikat

  static bool exercise25() {
    List<Map<String, dynamic>> employeeSalaries = [
      {"name": "John", "salary": 5000},
      {"name": "Jane", "salary": 6000},
      {"name": "Jim", "salary": 7000},
      {"name": "Jake", "salary": 8000},
      {"name": "Jerry", "salary": 9000},
    ];
    bool? result;

    // TULIS KODE DI SINI:

    return result == false; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 26: Check Salary 6000 (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah ada karyawan dengan gaji 6000
  // - HINT: Gunakan .any((e) => e["salary"] == 6000)

  static bool exercise26() {
    List<Map<String, dynamic>> employeeSalaries = [
      {"name": "John", "salary": 5000},
      {"name": "Jane", "salary": 6000},
      {"name": "Jim", "salary": 4500},
      {"name": "Jack", "salary": 6000},
      {"name": "Jill", "salary": 5500},
    ];
    bool? result;

    // TULIS KODE DI SINI:

    return result == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 27: Total Salary (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung total gaji karyawan

  static bool exercise27() {
    List<Map<String, dynamic>> employeeSalaries = [
      {"name": "John", "salary": 5000},
      {"name": "Jane", "salary": 6000},
      {"name": "Jim", "salary": 4500},
      {"name": "Jack", "salary": 6000},
      {"name": "Jill", "salary": 5500},
    ];
    double? totalSalary = 0;

    // TULIS KODE DI SINI:

    return totalSalary == 27000; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 28: Highest Salary (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cari gaji tertinggi

  static bool exercise28() {
    List<Map<String, dynamic>> employeeSalaries = [
      {"name": "John", "salary": 5000},
      {"name": "Jane", "salary": 6000},
      {"name": "Jim", "salary": 4500},
      {"name": "Jack", "salary": 6000},
      {"name": "Jill", "salary": 5500},
    ];
    double? highestSalary = 0;

    // TULIS KODE DI SINI:

    return highestSalary == 6000; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 29: Lowest Salary (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cari gaji terendah

  static bool exercise29() {
    List<Map<String, dynamic>> employeeSalaries = [
      {"name": "John", "salary": 5000},
      {"name": "Jane", "salary": 6000},
      {"name": "Jim", "salary": 4500},
      {"name": "Jack", "salary": 6000},
      {"name": "Jill", "salary": 5500},
    ];
    double? lowestSalary = 0;

    // TULIS KODE DI SINI:

    return lowestSalary == 4500; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 30: Salary Above 6000 (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cek apakah ada gaji di atas 6000

  static bool exercise30() {
    List<Map<String, dynamic>> employeeSalaries = [
      {"name": "John", "salary": 5000},
      {"name": "Jane", "salary": 6000},
      {"name": "Jim", "salary": 7000}
    ];
    bool? result;

    // TULIS KODE DI SINI:

    return result == true; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 31: Average Salary (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung rata-rata gaji karyawan

  static bool exercise31() {
    List<Map<String, dynamic>> employeeSalaries = [
      {"name": "John", "salary": 5000},
      {"name": "Jane", "salary": 6000},
      {"name": "Jim", "salary": 7000}
    ];
    double? average;

    // TULIS KODE DI SINI:

    return average == 6000; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 32: Highest Paid Employee Name (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cari nama karyawan dengan gaji tertinggi

  static bool exercise32() {
    List<Map<String, dynamic>> employeeSalaries = [
      {"name": "John", "salary": 5000},
      {"name": "Jane", "salary": 6000},
      {"name": "Jim", "salary": 7000}
    ];
    String? name;

    // TULIS KODE DI SINI:

    return name == "Jim"; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 33: Lowest Paid Employee Name (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Cari nama karyawan dengan gaji terendah

  static bool exercise33() {
    List<Map<String, dynamic>> employeeSalaries = [
      {"name": "John", "salary": 5000},
      {"name": "Jane", "salary": 6000},
      {"name": "Jim", "salary": 7000}
    ];
    String? name;

    // TULIS KODE DI SINI:

    return name == "John"; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 34: Add New Employee (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Tambahkan karyawan baru dengan nama 'Jack' dan gaji 8000
  // - HINT: Gunakan .add()

  static bool exercise34() {
    List<Map<String, dynamic>> employeeSalaries = [
      {"name": "John", "salary": 5000},
      {"name": "Jane", "salary": 6000},
      {"name": "Jim", "salary": 7000}
    ];

    // TULIS KODE DI SINI:

    return employeeSalaries.length == 4 &&
        employeeSalaries[3]["name"] == "Jack" &&
        employeeSalaries[3]["salary"] == 8000; // ← JANGAN UBAH BARIS INI!
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // EXERCISE 35: Total Salary with Position (BASIC)
  // ═══════════════════════════════════════════════════════════════════════════
  // INSTRUKSI:
  // - Hitung total gaji karyawan

  static bool exercise35() {
    List<Map<String, dynamic>> employeeSalaries = [
      {"name": "John", "salary": 5000, "position": "Manager"},
      {"name": "Jane", "salary": 4000, "position": "Team Lead"},
      {"name": "Jim", "salary": 3500, "position": "Developer"},
      {"name": "Jack", "salary": 3000, "position": "QA"},
      {"name": "Jill", "salary": 2500, "position": "Intern"},
    ];
    int? totalSalary;

    // TULIS KODE DI SINI:

    return totalSalary == 18000;
  }
}
