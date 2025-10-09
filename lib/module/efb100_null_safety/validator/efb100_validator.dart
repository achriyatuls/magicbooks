import '../tests/efb100_tests.dart';

class Efb100Validator {
  static TestResult runTest(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        return Efb100Tests.test1();
      case 2:
        return Efb100Tests.test2();
      case 3:
        return Efb100Tests.test3();
      case 4:
        return Efb100Tests.test4();
      case 5:
        return Efb100Tests.test5();
      case 6:
        return Efb100Tests.test6();
      case 7:
        return Efb100Tests.test7();
      case 8:
        return Efb100Tests.test8();
      case 9:
        return Efb100Tests.test9();
      case 10:
        return Efb100Tests.test10();
      case 11:
        return Efb100Tests.test11();
      case 12:
        return Efb100Tests.test12();
      case 13:
        return Efb100Tests.test13();
      case 14:
        return Efb100Tests.test14();
      case 15:
        return Efb100Tests.test15();
      case 16:
        return Efb100Tests.test16();
      case 17:
        return Efb100Tests.test17();
      case 18:
        return Efb100Tests.test18();
      case 19:
        return Efb100Tests.test19();
      case 20:
        return Efb100Tests.test20();
      case 21:
        return Efb100Tests.test21();
      case 22:
        return Efb100Tests.test22();
      case 23:
        return Efb100Tests.test23();
      case 24:
        return Efb100Tests.test24();
      case 25:
        return Efb100Tests.test25();
      case 26:
        return Efb100Tests.test26();
      case 27:
        return Efb100Tests.test27();
      case 28:
        return Efb100Tests.test28();
      default:
        return TestResult(
          exerciseName: "Exercise $exerciseNumber",
          exerciseNumber: exerciseNumber,
          passed: 0,
          total: 1,
          isPerfect: false,
          errors: ["⚠️ Test untuk exercise ini belum diimplementasi"],
        );
    }
  }

  static Map<int, TestResult> runAllTests() {
    final results = <int, TestResult>{};
    final implemented = List<int>.generate(28, (i) => i + 1);
    for (final n in implemented) {
      results[n] = runTest(n);
    }
    return results;
  }
}
