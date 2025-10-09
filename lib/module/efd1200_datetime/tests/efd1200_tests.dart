import 'package:intl/intl.dart';
import '../exercises/efd1200_exercises.dart';

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

class Efd1200Tests {
  static TestResult test1() {
    final date = DateTime(2023, 8, 1);
    final res = Efd1200Exercises.exercise1Solution(date);
    final ok = (res == "2023-08-01");
    return TestResult(
      exerciseName: "EFD1200 E1: Format Date",
      exerciseNumber: 1,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected '2023-08-01', Got: '$res'"],
      hints: ["💡 DateFormat('yyyy-MM-dd').format(date)"],
    );
  }

  static TestResult test2() {
    final date = DateTime(2023, 8, 1, 20, 21);
    final res = Efd1200Exercises.exercise2Solution(date);
    final ok = (res == "2023-08-01 20:21");
    return TestResult(
      exerciseName: "EFD1200 E2: Format DateTime",
      exerciseNumber: 2,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected '2023-08-01 20:21', Got: '$res'"],
      hints: ["💡 DateFormat('yyyy-MM-dd kk:mm').format(date)"],
    );
  }

  static TestResult test3() {
    final date = DateTime(2023, 8, 15);
    final res = Efd1200Exercises.exercise3Solution(date);
    final ok = (res == 15);
    return TestResult(
      exerciseName: "EFD1200 E3: Get Day",
      exerciseNumber: 3,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 15, Got: $res"],
      hints: ["💡 date.day"],
    );
  }

  static TestResult test4() {
    final date = DateTime(2023, 8, 1);
    final res = Efd1200Exercises.exercise4Solution(date);
    final ok = (res == 8);
    return TestResult(
      exerciseName: "EFD1200 E4: Get Month",
      exerciseNumber: 4,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 8, Got: $res"],
      hints: ["💡 date.month"],
    );
  }

  static TestResult test5() {
    final date = DateTime(2023, 8, 1);
    final res = Efd1200Exercises.exercise5Solution(date);
    final ok = (res == 2023);
    return TestResult(
      exerciseName: "EFD1200 E5: Get Year",
      exerciseNumber: 5,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 2023, Got: $res"],
      hints: ["💡 date.year"],
    );
  }

  static TestResult test6() {
    final date = DateTime(2023, 8, 1, 15, 30);
    final res = Efd1200Exercises.exercise6Solution(date);
    final ok = (res == "15:30");
    return TestResult(
      exerciseName: "EFD1200 E6: Format Time",
      exerciseNumber: 6,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected '15:30', Got: '$res'"],
      hints: ["💡 DateFormat('kk:mm').format(date)"],
    );
  }

  static TestResult test7() {
    final now = DateTime.now();
    final expected = DateFormat("yyyy-MM-dd").format(now);
    final res = Efd1200Exercises.exercise7Solution(now);
    final ok = (res == expected);
    return TestResult(
      exerciseName: "EFD1200 E7: Format Current Date",
      exerciseNumber: 7,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected '$expected', Got: '$res'"],
      hints: ["💡 DateFormat('yyyy-MM-dd').format(date)"],
    );
  }

  static TestResult test8() {
    final now = DateTime.now();
    final res = Efd1200Exercises.exercise8Solution(now);
    // Check format only (not exact time)
    final ok = res != null && RegExp(r'^\d{2}:\d{2}:\d{2}$').hasMatch(res);
    return TestResult(
      exerciseName: "EFD1200 E8: Format Current Time",
      exerciseNumber: 8,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected format 'kk:mm:ss', Got: '$res'"],
      hints: ["💡 DateFormat('kk:mm:ss').format(date)"],
    );
  }

  static TestResult test9() {
    final start = DateTime(2023, 8, 1);
    final end = DateTime(2023, 9, 1);
    final res = Efd1200Exercises.exercise9Solution(start, end);
    final ok = (res == 31);
    return TestResult(
      exerciseName: "EFD1200 E9: Difference in Days",
      exerciseNumber: 9,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 31, Got: $res"],
      hints: ["💡 endAt.difference(startAt).inDays"],
    );
  }

  static TestResult test10() {
    final date = DateTime(2023, 8, 1);
    final res = Efd1200Exercises.exercise10Solution(date);
    final ok = (res == "Tuesday, 1 Aug 2023");
    return TestResult(
      exerciseName: "EFD1200 E10: Format Full Date",
      exerciseNumber: 10,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 'Tuesday, 1 Aug 2023', Got: '$res'"],
      hints: ["💡 DateFormat('EEEE, d MMM y').format(date)"],
    );
  }

  static TestResult test11() {
    final date = DateTime(2023, 8, 1);
    final res = Efd1200Exercises.exercise11Solution(date, 5);
    final ok = (res?.day == 6 && res?.month == 8);
    return TestResult(
      exerciseName: "EFD1200 E11: Add Days",
      exerciseNumber: 11,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected day=6, month=8"],
      hints: ["💡 date.add(Duration(days: days))"],
    );
  }

  static TestResult test12() {
    final date = DateTime(2023, 8, 10);
    final res = Efd1200Exercises.exercise12Solution(date, 5);
    final ok = (res?.day == 5 && res?.month == 8);
    return TestResult(
      exerciseName: "EFD1200 E12: Subtract Days",
      exerciseNumber: 12,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected day=5, month=8"],
      hints: ["💡 date.subtract(Duration(days: days))"],
    );
  }

  static TestResult test13() {
    final res = Efd1200Exercises.exercise13Solution("2023-08-01");
    final ok = (res?.year == 2023 && res?.month == 8 && res?.day == 1);
    return TestResult(
      exerciseName: "EFD1200 E13: Parse String",
      exerciseNumber: 13,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Failed to parse '2023-08-01'"],
      hints: ["💡 DateTime.parse(dateStr)"],
    );
  }

  static TestResult test14() {
    final date = DateTime(2023, 8, 1);
    final res = Efd1200Exercises.exercise14Solution(date);
    final ok = (res == "Tuesday");
    return TestResult(
      exerciseName: "EFD1200 E14: Get Weekday Name",
      exerciseNumber: 14,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 'Tuesday', Got: '$res'"],
      hints: ["💡 DateFormat('EEEE').format(date)"],
    );
  }

  static TestResult test15() {
    final date = DateTime(2023, 8, 1);
    final res = Efd1200Exercises.exercise15Solution(date);
    final ok = (res == "August");
    return TestResult(
      exerciseName: "EFD1200 E15: Get Month Name",
      exerciseNumber: 15,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 'August', Got: '$res'"],
      hints: ["💡 DateFormat('MMMM').format(date)"],
    );
  }

  static TestResult test16() {
    final date = DateTime(2023, 8, 1);
    final res = Efd1200Exercises.exercise16Solution(date);
    final ok = (res == "01/08/2023");
    return TestResult(
      exerciseName: "EFD1200 E16: Format dd/MM/yyyy",
      exerciseNumber: 16,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected '01/08/2023', Got: '$res'"],
      hints: ["💡 DateFormat('dd/MM/yyyy').format(date)"],
    );
  }

  static TestResult test17() {
    final date = DateTime(2023, 8, 1, 15, 30);
    final res = Efd1200Exercises.exercise17Solution(date);
    final ok = (res == 15);
    return TestResult(
      exerciseName: "EFD1200 E17: Get Hour",
      exerciseNumber: 17,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 15, Got: $res"],
      hints: ["💡 date.hour"],
    );
  }

  static TestResult test18() {
    final date = DateTime(2023, 8, 1, 15, 30);
    final res = Efd1200Exercises.exercise18Solution(date);
    final ok = (res == 30);
    return TestResult(
      exerciseName: "EFD1200 E18: Get Minute",
      exerciseNumber: 18,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 30, Got: $res"],
      hints: ["💡 date.minute"],
    );
  }

  static TestResult test19() {
    final date = DateTime(2023, 8, 1, 15, 30, 45);
    final res = Efd1200Exercises.exercise19Solution(date);
    final ok = (res == 45);
    return TestResult(
      exerciseName: "EFD1200 E19: Get Second",
      exerciseNumber: 19,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 45, Got: $res"],
      hints: ["💡 date.second"],
    );
  }

  static TestResult test20() {
    final now = DateTime.now();
    final res = Efd1200Exercises.exercise20Solution(now);
    final ok = (res == true);
    return TestResult(
      exerciseName: "EFD1200 E20: Is Today",
      exerciseNumber: 20,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected true for today's date"],
      hints: ["💡 Bandingkan year, month, day dengan DateTime.now()"],
    );
  }

  static TestResult test21() {
    final past = DateTime(2020, 1, 1);
    final res = Efd1200Exercises.exercise21Solution(past);
    final ok = (res == true);
    return TestResult(
      exerciseName: "EFD1200 E21: Is Past",
      exerciseNumber: 21,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected true for past date"],
      hints: ["💡 date.isBefore(DateTime.now())"],
    );
  }

  static TestResult test22() {
    final future = DateTime(2030, 1, 1);
    final res = Efd1200Exercises.exercise22Solution(future);
    final ok = (res == true);
    return TestResult(
      exerciseName: "EFD1200 E22: Is Future",
      exerciseNumber: 22,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected true for future date"],
      hints: ["💡 date.isAfter(DateTime.now())"],
    );
  }

  static TestResult test23() {
    final start = DateTime(2023, 8, 1, 10, 0);
    final end = DateTime(2023, 8, 1, 15, 0);
    final res = Efd1200Exercises.exercise23Solution(start, end);
    final ok = (res == 5);
    return TestResult(
      exerciseName: "EFD1200 E23: Difference in Hours",
      exerciseNumber: 23,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 5, Got: $res"],
      hints: ["💡 endAt.difference(startAt).inHours"],
    );
  }

  static TestResult test24() {
    final start = DateTime(2023, 8, 1, 10, 0);
    final end = DateTime(2023, 8, 1, 10, 30);
    final res = Efd1200Exercises.exercise24Solution(start, end);
    final ok = (res == 30);
    return TestResult(
      exerciseName: "EFD1200 E24: Difference in Minutes",
      exerciseNumber: 24,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 30, Got: $res"],
      hints: ["💡 endAt.difference(startAt).inMinutes"],
    );
  }

  static TestResult test25() {
    final date = DateTime(2023, 8, 1);
    final res = Efd1200Exercises.exercise25Solution(date);
    final ok = (res == "Aug 1, 2023");
    return TestResult(
      exerciseName: "EFD1200 E25: Format MMM d, yyyy",
      exerciseNumber: 25,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 'Aug 1, 2023', Got: '$res'"],
      hints: ["💡 DateFormat('MMM d, yyyy').format(date)"],
    );
  }

  static TestResult test26() {
    final date = DateTime(2023, 8, 1, 10, 0);
    final res = Efd1200Exercises.exercise26Solution(date, 3);
    final ok = (res?.hour == 13);
    return TestResult(
      exerciseName: "EFD1200 E26: Add Hours",
      exerciseNumber: 26,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected hour=13"],
      hints: ["💡 date.add(Duration(hours: hours))"],
    );
  }

  static TestResult test27() {
    final date = DateTime(2023, 8, 1, 10, 0);
    final res = Efd1200Exercises.exercise27Solution(date, 3);
    final ok = (res?.hour == 7);
    return TestResult(
      exerciseName: "EFD1200 E27: Subtract Hours",
      exerciseNumber: 27,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected hour=7"],
      hints: ["💡 date.subtract(Duration(hours: hours))"],
    );
  }

  static TestResult test28() {
    final date = DateTime(2023, 8, 1);
    final res = Efd1200Exercises.exercise28Solution(date);
    final ok = (res == date.millisecondsSinceEpoch);
    return TestResult(
      exerciseName: "EFD1200 E28: Get Milliseconds",
      exerciseNumber: 28,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Milliseconds mismatch"],
      hints: ["💡 date.millisecondsSinceEpoch"],
    );
  }

  static TestResult test29() {
    final millis = DateTime(2023, 8, 1).millisecondsSinceEpoch;
    final res = Efd1200Exercises.exercise29Solution(millis);
    final ok = (res?.year == 2023 && res?.month == 8 && res?.day == 1);
    return TestResult(
      exerciseName: "EFD1200 E29: From Milliseconds",
      exerciseNumber: 29,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Failed to create date from milliseconds"],
      hints: ["💡 DateTime.fromMillisecondsSinceEpoch(milliseconds)"],
    );
  }

  static TestResult test30() {
    final date = DateTime(2023, 8, 1); // Tuesday = 2
    final res = Efd1200Exercises.exercise30Solution(date);
    final ok = (res == 2);
    return TestResult(
      exerciseName: "EFD1200 E30: Get Weekday Number",
      exerciseNumber: 30,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected 2 (Tuesday), Got: $res"],
      hints: ["💡 date.weekday"],
    );
  }

  static TestResult test31() {
    final date1 = DateTime(2023, 8, 1, 10, 30);
    final date2 = DateTime(2023, 8, 1, 15, 45);
    final res = Efd1200Exercises.exercise31Solution(date1, date2);
    final ok = (res == true);
    return TestResult(
      exerciseName: "EFD1200 E31: Same Day Check",
      exerciseNumber: 31,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected true for same day"],
      hints: ["💡 Bandingkan year, month, day"],
    );
  }

  static TestResult test32() {
    final date = DateTime(2023, 8, 15);
    final res = Efd1200Exercises.exercise32Solution(date);
    final ok = (res?.day == 1 && res?.month == 8);
    return TestResult(
      exerciseName: "EFD1200 E32: First Day of Month",
      exerciseNumber: 32,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected day=1, month=8"],
      hints: ["💡 DateTime(date.year, date.month, 1)"],
    );
  }

  static TestResult test33() {
    final date = DateTime(2023, 8, 15);
    final res = Efd1200Exercises.exercise33Solution(date);
    final ok = (res?.day == 31 && res?.month == 8);
    return TestResult(
      exerciseName: "EFD1200 E33: Last Day of Month",
      exerciseNumber: 33,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected day=31, month=8"],
      hints: ["💡 DateTime(date.year, date.month + 1, 0)"],
    );
  }

  static TestResult test34() {
    final date = DateTime.now().subtract(Duration(days: 2));
    final res = Efd1200Exercises.exercise34Solution(date);
    // Just check if it returns something
    final ok = (res != null && res.isNotEmpty);
    return TestResult(
      exerciseName: "EFD1200 E34: Relative Time",
      exerciseNumber: 34,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ Expected non-empty relative time string"],
      hints: ["💡 Hitung selisih dengan DateTime.now()"],
    );
  }

  static TestResult test35() {
    final res2020 = Efd1200Exercises.exercise35Solution(2020);
    final res2021 = Efd1200Exercises.exercise35Solution(2021);
    final ok = (res2020 == true && res2021 == false);
    return TestResult(
      exerciseName: "EFD1200 E35: Leap Year Check",
      exerciseNumber: 35,
      passed: ok ? 1 : 0,
      total: 1,
      isPerfect: ok,
      errors: ok ? [] : ["❌ 2020 is leap, 2021 is not"],
      hints: ["💡 (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)"],
    );
  }
}
