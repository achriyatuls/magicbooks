import '../tests/efd1700_tests.dart';

class Efd1700Validator {
  /// Run test untuk exercise tertentu
  static TestResult runTest(int exerciseNumber) {
    switch (exerciseNumber) {
      case 1:
        return Efd1700Tests.testExercise1();
      case 2:
        return Efd1700Tests.testExercise2();
      case 3:
        return Efd1700Tests.testExercise3();
      case 4:
        return Efd1700Tests.testExercise4();
      case 5:
        return Efd1700Tests.testExercise5();
      case 6:
        return Efd1700Tests.testExercise6();
      case 7:
        return Efd1700Tests.testExercise7();
      case 8:
        return Efd1700Tests.testExercise8();
      case 9:
        return Efd1700Tests.testExercise9();
      case 10:
        return Efd1700Tests.testExercise10();
      case 11:
        return Efd1700Tests.testExercise11();
      case 12:
        return Efd1700Tests.testExercise12();
      case 13:
        return Efd1700Tests.testExercise13();
      case 14:
        return Efd1700Tests.testExercise14();
      case 15:
        return Efd1700Tests.testExercise15();
      case 16:
        return Efd1700Tests.testExercise16();
      case 17:
        return Efd1700Tests.testExercise17();
      case 18:
        return Efd1700Tests.testExercise18();
      case 19:
        return Efd1700Tests.testExercise19();
      case 20:
        return Efd1700Tests.testExercise20();
      case 21:
        return Efd1700Tests.testExercise21();
      case 22:
        return Efd1700Tests.testExercise22();
      case 23:
        return Efd1700Tests.testExercise23();
      case 24:
        return Efd1700Tests.testExercise24();
      case 25:
        return Efd1700Tests.testExercise25();
      case 26:
        return Efd1700Tests.testExercise26();
      case 27:
        return Efd1700Tests.testExercise27();
      case 28:
        return Efd1700Tests.testExercise28();
      case 29:
        return Efd1700Tests.testExercise29();
      case 30:
        return Efd1700Tests.testExercise30();
      case 31:
        return Efd1700Tests.testExercise31();
      case 32:
        return Efd1700Tests.testExercise32();
      case 33:
        return Efd1700Tests.testExercise33();
      case 34:
        return Efd1700Tests.testExercise34();
      default:
        throw Exception("Exercise $exerciseNumber not found");
    }
  }

  /// Run semua tests
  static Future<List<TestResult>> runAllTests() async {
    List<TestResult> results = [];

    for (int i = 1; i <= 34; i++) {
      try {
        results.add(runTest(i));
      } catch (e) {
        print("Error running test $i: $e");
      }
    }

    return results;
  }

  /// Get overall statistics
  static Map<String, dynamic> getOverallStats() {
    List<TestResult> allResults = [];

    for (int i = 1; i <= 34; i++) {
      try {
        allResults.add(runTest(i));
      } catch (e) {
        print("Error in exercise $i: $e");
      }
    }

    int totalExercises = allResults.length;
    int completedExercises = allResults.where((r) => r.isPerfect).length;
    int totalTests = allResults.fold(0, (sum, r) => sum + r.total);
    int passedTests = allResults.fold(0, (sum, r) => sum + r.passed);

    double completionRate =
        totalExercises > 0 ? (completedExercises / totalExercises) * 100 : 0;
    double successRate = totalTests > 0 ? (passedTests / totalTests) * 100 : 0;

    // Calculate grade
    String grade;
    if (completionRate == 100) {
      grade = "A+ (Perfect!)";
    } else if (completionRate >= 90) {
      grade = "A";
    } else if (completionRate >= 80) {
      grade = "B";
    } else if (completionRate >= 70) {
      grade = "C";
    } else if (completionRate >= 60) {
      grade = "D";
    } else {
      grade = "F";
    }

    return {
      'totalExercises': totalExercises,
      'completedExercises': completedExercises,
      'totalTests': totalTests,
      'passedTests': passedTests,
      'completionRate': completionRate,
      'successRate': successRate,
      'grade': grade,
      'results': allResults,
    };
  }
}
