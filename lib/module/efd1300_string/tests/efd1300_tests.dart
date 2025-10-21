import '../exercises/efd1300_exercises.dart';

class TestCase<I, O> {
  final I input;
  final O expected;
  final String? description;
  TestCase({required this.input, required this.expected, this.description});
}

class TestResult {
  final String exerciseName;
  final int exerciseNumber;
  final int passed;
  final int total;
  final bool isPerfect;
  final List<String> errors;
  final List<String> hints;

  TestResult({
    required this.exerciseName,
    required this.exerciseNumber,
    required this.passed,
    required this.total,
    required this.isPerfect,
    required this.errors,
    this.hints = const [],
  });

  double get percentage => total > 0 ? (passed / total) * 100 : 0;
  String get grade {
    if (percentage == 100) return "A+ (Perfect!)";
    if (percentage >= 90) return "A";
    if (percentage >= 80) return "B";
    if (percentage >= 70) return "C";
    if (percentage >= 60) return "D";
    return "F";
  }
}

class Efd1300Tests {
  static TestResult test1() {
    final cases = <TestCase<Map<String, String>, bool?>>[
      TestCase(input: {"p": "JR SUPER 12", "q": "JR"}, expected: true),
      TestCase(input: {"p": "GG FILTER 12", "q": "JR"}, expected: false),
    ];
    int passed = 0;
    final errors = <String>[];
    for (final c in cases) {
      final res =
          Efd1300Exercises.exercise1Solution(c.input['p']!, c.input['q']!);
      if (res == c.expected)
        passed++;
      else
        errors.add("input=${c.input}");
    }
    return TestResult(
        exerciseName: "EFD1300 E1",
        exerciseNumber: 1,
        passed: passed,
        total: cases.length,
        isPerfect: passed == cases.length,
        errors: errors,
        hints: ["Gunakan productName.contains(query)"]);
  }

  static TestResult test2() {
    final cases = <TestCase<String, bool?>>[
      TestCase(input: "", expected: true),
      TestCase(input: "A", expected: false),
    ];
    int passed = 0;
    final errors = <String>[];
    for (final c in cases) {
      final res = Efd1300Exercises.exercise2Solution(c.input);
      if (res == c.expected)
        passed++;
      else
        errors.add("input='${c.input}'");
    }
    return TestResult(
        exerciseName: "EFD1300 E2",
        exerciseNumber: 2,
        passed: passed,
        total: cases.length,
        isPerfect: passed == cases.length,
        errors: errors,
        hints: ["Gunakan .isEmpty"]);
  }

  static TestResult test3() {
    final cases = <TestCase<String, bool?>>[
      TestCase(input: "A", expected: false),
      TestCase(input: "AB", expected: true),
    ];
    int passed = 0;
    final errors = <String>[];
    for (final c in cases) {
      final res = Efd1300Exercises.exercise3Solution(c.input);
      if (res == c.expected)
        passed++;
      else
        errors.add("input='${c.input}'");
    }
    return TestResult(
        exerciseName: "EFD1300 E3",
        exerciseNumber: 3,
        passed: passed,
        total: cases.length,
        isPerfect: passed == cases.length,
        errors: errors,
        hints: ["Gunakan input.length >= 2"]);
  }

  static TestResult test4() {
    final cases = <TestCase<int, String?>>[
      TestCase(input: 23, expected: "0023"),
      TestCase(input: 7, expected: "0007"),
    ];
    int passed = 0;
    final errors = <String>[];
    for (final c in cases) {
      final res = Efd1300Exercises.exercise4Solution(c.input);
      if (res == c.expected)
        passed++;
      else
        errors.add("${c.input}");
    }
    return TestResult(
        exerciseName: "EFD1300 E4",
        exerciseNumber: 4,
        passed: passed,
        total: cases.length,
        isPerfect: passed == cases.length,
        errors: errors,
        hints: ["number.toString().padLeft(4, '0')"]);
  }

  static TestResult test5() {
    final cases = <TestCase<int, String?>>[
      TestCase(input: 27, expected: "00027"),
      TestCase(input: 1, expected: "00001"),
    ];
    int passed = 0;
    final errors = <String>[];
    for (final c in cases) {
      final res = Efd1300Exercises.exercise5Solution(c.input);
      if (res == c.expected)
        passed++;
      else
        errors.add("${c.input}");
    }
    return TestResult(
        exerciseName: "EFD1300 E5",
        exerciseNumber: 5,
        passed: passed,
        total: cases.length,
        isPerfect: passed == cases.length,
        errors: errors,
        hints: ["number.toString().padLeft(5, '0')"]);
  }

  static TestResult test6() {
    final cases = <TestCase<String, bool?>>[
      TestCase(
          input: "denyocr.world@gmail.com",
          expected: true,
          description: "valid"),
      TestCase(input: "invalid@", expected: false, description: "invalid"),
    ];
    int passed = 0;
    final errors = <String>[];
    for (final c in cases) {
      final res = Efd1300Exercises.exercise6Solution(c.input);
      if (res == c.expected)
        passed++;
      else
        errors.add("${c.description}: '${c.input}'");
    }
    return TestResult(
      exerciseName: "EFD1300 E6",
      exerciseNumber: 6,
      passed: passed,
      total: cases.length,
      isPerfect: passed == cases.length,
      errors: errors,
      hints: [
        "Gunakan RegExp.hasMatch(email)",
        "Lihat pola regex pada instruksi",
      ],
    );
  }

  static TestResult test7() {
    final cases = <TestCase<Map<String, dynamic>, bool?>>[
      TestCase(
          input: {"input": "ANDREA", "index": 1, "target": "N"},
          expected: true),
      TestCase(
          input: {"input": "ANDREA", "index": 0, "target": "N"},
          expected: false),
    ];
    int passed = 0;
    final errors = <String>[];
    for (final c in cases) {
      final res = Efd1300Exercises.exercise7Solution(
        c.input['input'] as String,
        c.input['index'] as int,
        c.input['target'] as String,
      );
      if (res == c.expected)
        passed++;
      else
        errors.add(" input=${c.input}");
    }
    return TestResult(
      exerciseName: "EFD1300 E7",
      exerciseNumber: 7,
      passed: passed,
      total: cases.length,
      isPerfect: passed == cases.length,
      errors: errors,
      hints: ["input[index] == target"],
    );
  }

  static TestResult test8() {
    final res = Efd1300Exercises.exercise8Solution("ANDREA");
    final ok = (res == "andrea");
    return TestResult(
      exerciseName: "EFD1300 E8",
      exerciseNumber: 8,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 'andrea', Got: '$res'"],
      hints: ["input.toLowerCase()"],
    );
  }

  static TestResult test9() {
    final res = Efd1300Exercises.exercise9Solution("daniel Goleman");
    final ok = (res == "DANIEL GOLEMAN");
    return TestResult(
      exerciseName: "EFD1300 E9",
      exerciseNumber: 9,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 'DANIEL GOLEMAN', Got: '$res'"],
      hints: ["input.toUpperCase()"],
    );
  }

  static TestResult test10() {
    final res =
        Efd1300Exercises.exercise10Solution("1;GG FILTER 12;250;-", ";");
    final ok = (res?.length == 4);
    return TestResult(
      exerciseName: "EFD1300 E10",
      exerciseNumber: 10,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected length 4"],
      hints: ["line.split(sep)"],
    );
  }

  static TestResult test11() {
    final res = Efd1300Exercises.exercise11Solution("1,GG FILTER 12,250,-");
    final ok = (res?.length == 4);
    return TestResult(
      exerciseName: "EFD1300 E11",
      exerciseNumber: 11,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected length 4"],
      hints: ["line.split(',')"],
    );
  }

  static TestResult test12() {
    final res = Efd1300Exercises.exercise12Solution(
        '{"product_name": "GG FILTER 12","price": 25}');
    final ok = (res != null && res['product_name'] == 'GG FILTER 12');
    return TestResult(
      exerciseName: "EFD1300 E12",
      exerciseNumber: 12,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["product_name tidak sesuai"],
      hints: ["Gunakan jsonDecode(jsonStr)"],
    );
  }

  static TestResult test13() {
    final res = Efd1300Exercises.exercise13Solution("Hello World");
    final ok = (res == "HELLO WORLD");
    return TestResult(
      exerciseName: "EFD1300 E13",
      exerciseNumber: 13,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 'HELLO WORLD', Got: '$res'"],
      hints: ["input.toUpperCase()"],
    );
  }

  static TestResult test14() {
    final res = Efd1300Exercises.exercise14Solution("Hello World");
    final ok = (res == "hello world");
    return TestResult(
      exerciseName: "EFD1300 E14",
      exerciseNumber: 14,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 'hello world', Got: '$res'"],
      hints: ["input.toLowerCase()"],
    );
  }

  static TestResult test15() {
    final res = Efd1300Exercises.exercise15Solution("hello world");
    final ok = (res == "Hello World");
    return TestResult(
      exerciseName: "EFD1300 E15",
      exerciseNumber: 15,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 'Hello World', Got: '$res'"],
      hints: ["Pisah kata, uppercase huruf pertama tiap kata"],
    );
  }

  static TestResult test16() {
    final res = Efd1300Exercises.exercise16Solution("1234");
    final ok = (res == 1234);
    return TestResult(
      exerciseName: "EFD1300 E16",
      exerciseNumber: 16,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 1234, Got: $res"],
      hints: ["int.parse(input)"],
    );
  }

  static TestResult test17() {
    final res = Efd1300Exercises.exercise17Solution("1234.56");
    final ok = (res == 1234.56);
    return TestResult(
      exerciseName: "EFD1300 E17",
      exerciseNumber: 17,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 1234.56, Got: $res"],
      hints: ["double.parse(input)"],
    );
  }

  static TestResult test18() {
    final res = Efd1300Exercises.exercise18Solution("Rp. 1.234,56");
    final ok = (res == 1234.56);
    return TestResult(
      exerciseName: "EFD1300 E18",
      exerciseNumber: 18,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 1234.56, Got: $res"],
      hints: [
        "Hapus semua non-digit selain . dan ,",
        "Ganti '.' jadi '' dan ',' jadi '.' sebelum parse",
      ],
    );
  }

  static TestResult test19() {
    final res = Efd1300Exercises.exercise19Solution(1234.56);
    final ok = (res == "Rp. 1.234,56");
    return TestResult(
      exerciseName: "EFD1300 E19",
      exerciseNumber: 19,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 'Rp. 1.234,56', Got: '$res'"],
      hints: ["Format angka ke rupiah (titik ribuan, koma desimal)"],
    );
  }

  static TestResult test20() {
    final res = Efd1300Exercises.exercise20Solution("1234.56");
    final ok = (res == "Rp. 1.234,56");
    return TestResult(
      exerciseName: "EFD1300 E20",
      exerciseNumber: 20,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 'Rp. 1.234,56', Got: '$res'"],
      hints: ["Parse ke double, lalu format rupiah"],
    );
  }

  static TestResult test21() {
    final res = Efd1300Exercises.exercise21Solution("Hello, World!");
    final ok = (res == true);
    return TestResult(
      exerciseName: "EFD1300 E21",
      exerciseNumber: 21,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected true"],
      hints: ["input.contains('Hello')"],
    );
  }

  static TestResult test22() {
    final res = Efd1300Exercises.exercise22Solution("Hello, World!");
    final ok = (res == "Hello World");
    return TestResult(
      exerciseName: "EFD1300 E22",
      exerciseNumber: 22,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 'Hello World', Got: '$res'"],
      hints: ["Hapus tanda koma atau ganti dengan ''"],
    );
  }

  static TestResult test23() {
    final res = Efd1300Exercises.exercise23Solution("Hello, World!");
    final ok = (res == "Hello,World!");
    return TestResult(
      exerciseName: "EFD1300 E23",
      exerciseNumber: 23,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 'Hello,World!', Got: '$res'"],
      hints: ["Hapus spasi setelah koma"],
    );
  }

  static TestResult test24() {
    final res = Efd1300Exercises.exercise24Solution("Hello, World!");
    final ok = (res == false);
    return TestResult(
      exerciseName: "EFD1300 E24",
      exerciseNumber: 24,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected false"],
      hints: ["Pencarian case-sensitive ('world' != 'World')"],
    );
  }

  static TestResult test25() {
    final res = Efd1300Exercises.exercise25Solution("Hello, World!");
    final ok = (res == true);
    return TestResult(
      exerciseName: "EFD1300 E25",
      exerciseNumber: 25,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected true"],
      hints: ["input.contains('World')"],
    );
  }

  static TestResult test26() {
    final res = Efd1300Exercises.exercise26Solution("Rp. 10.000");
    final ok = (res == 10000);
    return TestResult(
      exerciseName: "EFD1300 E26",
      exerciseNumber: 26,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 10000, Got: $res"],
      hints: ["Hapus non-digit dan parse ke int"],
    );
  }

  static TestResult test27() {
    final res = Efd1300Exercises.exercise27Solution("Rp. 10.000");
    final ok = (res == 10.0);
    return TestResult(
      exerciseName: "EFD1300 E27",
      exerciseNumber: 27,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 10.0, Got: $res"],
      hints: ["Ambil 2 digit terdepan (10) atau bagi 1000 sesuai instruksi"],
    );
  }

  static TestResult test28() {
    final res = Efd1300Exercises.exercise28Solution("Rp. 10.000");
    final ok = (res == "10,000.00");
    return TestResult(
      exerciseName: "EFD1300 E28",
      exerciseNumber: 28,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected '10,000.00', Got: '$res'"],
      hints: [" Format angka menjadi US-style grouping"],
    );
  }

  static TestResult test29() {
    final res = Efd1300Exercises.exercise29Solution("Hello, World!");
    final ok = (res == true);
    return TestResult(
      exerciseName: "EFD1300 E29",
      exerciseNumber: 29,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected true"],
      hints: ["Regex [A-Z]"],
    );
  }

  static TestResult test30() {
    final res = Efd1300Exercises.exercise30Solution("Hello, World!");
    final ok = (res == false);
    return TestResult(
      exerciseName: "EFD1300 E30",
      exerciseNumber: 30,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected false"],
      hints: ["Regex [a-z], validasi hasilnya"],
    );
  }

  static TestResult test31() {
    final res = Efd1300Exercises.exercise31Solution("12,345.67");
    final ok = (res == 12345.67);
    return TestResult(
      exerciseName: "EFD1300 E31",
      exerciseNumber: 31,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 12345.67, Got: $res"],
      hints: ["Hapus koma, parse double"],
    );
  }

  static TestResult test32() {
    final res = Efd1300Exercises.exercise32Solution("Rp. 12.345,67");
    final ok = (res == 12345.67);
    return TestResult(
      exerciseName: "EFD1300 E32",
      exerciseNumber: 32,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 12345.67, Got: $res"],
      hints: ["'.' sebagai pemisah ribuan, ',' desimal"],
    );
  }

  static TestResult test33() {
    final res = Efd1300Exercises.exercise33Solution("USD 12,345.67");
    final ok = (res == 12345.67);
    return TestResult(
      exerciseName: "EFD1300 E33",
      exerciseNumber: 33,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 12345.67, Got: $res"],
      hints: ["Hapus huruf, hapus koma, parse double"],
    );
  }

  static TestResult test34() {
    final res = Efd1300Exercises.exercise34Solution("€12.345,67");
    final ok = (res == 12345.67);
    return TestResult(
      exerciseName: "EFD1300 E34",
      exerciseNumber: 34,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 12345.67, Got: $res"],
      hints: ["Lihat contoh parsing di soal"],
    );
  }

  static TestResult test35() {
    final res = Efd1300Exercises.exercise35Solution("¥12,345.67");
    final ok = (res == 12345.67);
    return TestResult(
      exerciseName: "EFD1300 E35",
      exerciseNumber: 35,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["Expected 12345.67, Got: $res"],
      hints: ["Hapus non-digit kecuali titik, parse"],
    );
  }
}
