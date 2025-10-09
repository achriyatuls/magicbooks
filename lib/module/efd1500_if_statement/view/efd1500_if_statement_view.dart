import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../../../shared/widget/row_label/row_label_validated_efd1500.dart';

class Efd1500IfStatementView extends StatefulWidget {
  const Efd1500IfStatementView({Key? key}) : super(key: key);

  bool exercise1() {
    int number = 5;
    // Tuliskan kode untuk menentukan apakah number adalah bilangan genap atau ganjil
    // Jika angka number adalah genap, maka assign variabel result dengan string "Genap".
    // Jika angka number adalah ganjil, maka assign variabel result dengan string "Ganjil".
    String? result;

    return result == "Ganjil";
  }

  bool exercise2() {
    int num = 10;
    // Tuliskan kode untuk menentukan apakah num adalah bilangan positif, negatif, atau nol
    // Jika num adalah bilangan positif, maka assign variabel result dengan string "Positif".
    // Jika num adalah bilangan negatif, maka assign variabel result dengan string "Negatif".
    // Jika num adalah nol, maka assign variabel result dengan string "Nol".
    String? result;

    return result == "Positif";
  }

  bool exercise3() {
    int num1 = 5;
    int num2 = 10;
    // Tuliskan kode untuk menentukan apakah num1 lebih besar, lebih kecil, atau sama dengan num2
    // Jika num1 lebih besar dari num2, maka assign variabel result dengan string "Lebih besar".
    // Jika num1 lebih kecil dari num2, maka assign variabel result dengan string "Lebih kecil".
    // Jika num1 sama dengan num2, maka assign variabel result dengan string "Sama".
    String? result;

    return result == "Lebih kecil";
  }

  bool exercise4() {
    int score = 80;
    //Tuliskan kode untuk menentukan apakah score merupakan nilai yang baik, sedang atau buruk
    // Nilai yang baik jika score >= 75
    // Nilai yang sedang jika score >= 50 dan score < 75
    // Nilai yang buruk jika score < 50
    String? result;

    return result == "Baik";
  }

  bool exercise5() {
    int score = 60;
    //Tuliskan kode untuk menentukan apakah score merupakan nilai yang baik, sedang atau buruk
    // Nilai yang baik jika score >= 75
    // Nilai yang sedang jika score >= 50 dan score < 75
    // Nilai yang buruk jika score < 50
    String? result;

    return result == "Sedang";
  }

  bool exercise6() {
    int score = 40;
    //Tuliskan kode untuk menentukan apakah score merupakan nilai yang baik, sedang atau buruk
    // Nilai yang baik jika score >= 75
    // Nilai yang sedang jika score >= 50 dan score < 75
    // Nilai yang buruk jika score < 50
    String? result;

    return result == "Buruk";
  }

  bool exercise7() {
    int number = 10;
    //Tuliskan kode untuk menentukan apakah number adalah bilangan bulat atau tidak
    String? result;

    return result == "Bilangan Bulat";
  }

  bool exercise8() {
    int number = 10;
    //Tuliskan kode untuk menentukan apakah number adalah bilangan negatif, positif atau nol
    String? result;

    return result == "Bilangan Positif";
  }

  bool exercise9() {
    int number1 = 10;
    int number2 = 5;
    //Tuliskan kode untuk menentukan apakah number1 lebih besar dari number2 atau tidak
    bool? result;

    return result == true;
  }

  bool exercise10() {
    int number1 = 10;
    int number2 = 5;
    //Tuliskan kode untuk menentukan apakah number1 lebih kecil dari number2 atau tidak
    bool? result;

    return result == false;
  }

  bool exercise11() {
    DateTime now = DateTime.now();
    //Tuliskan kode untuk menentukan apakah sekarang adalah hari Minggu
    bool? isSunday;
    return isSunday == true;
  }

  bool exercise12() {
    DateTime birthday = DateTime(1995, 8, 17);
    //Tuliskan kode untuk menentukan usia dari birthday
    int? age;
    return age == 27;
  }

  bool exercise13() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk menentukan apakah date adalah tanggal 1 Januari 2022
    bool isJanuaryFirst = false;

    return isJanuaryFirst == true;
  }

  bool exercise14() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk menentukan apakah date adalah hari Minggu
    bool isSunday = false;

    return isSunday == true;
  }

  bool exercise15() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk menentukan apakah date adalah hari Sabtu
    bool? isSaturday;

    return isSaturday == false;
  }

  bool exercise16() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk menentukan apakah date adalah hari Jumat
    bool? isFriday;

    return isFriday == false;
  }

  bool exercise17() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk menentukan apakah date adalah hari Kamis
    bool? isThursday;

    return isThursday == false;
  }

  bool exercise18() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk menentukan apakah date adalah hari Rabu
    bool? isWednesday;
    return isWednesday == false;
  }

  bool exercise19() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk menentukan apakah date adalah hari Selasa
    bool? isTuesday;
    return isTuesday == false;
  }

  bool exercise20() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk menentukan apakah date adalah hari Senin
    bool isMonday = true;
    return isMonday == false;
  }

  bool exercise21() {
    var numbers = [1, 2, 3, 4, 5];
    // Tuliskan kode untuk menentukan apakah ada angka 3 dalam list numbers
    bool hasThree = false;

    return hasThree == true;
  }

  bool exercise22() {
    var numbers = [1, 2, 3, 4, 5];
    // Tuliskan kode untuk menentukan apakah semua angka dalam list numbers adalah bilangan genap
    bool allEven = true;

    return allEven == false;
  }

  bool exercise23() {
    var numbers = [1, 2, 3, 4, 5];
    // Tuliskan kode untuk menentukan apakah ada angka yang lebih besar dari 5 dalam list numbers
    bool hasGreaterThanFive = false;

    return hasGreaterThanFive == true;
  }

  bool exercise24() {
    var numbers = [1, 2, 3, 4, 5];
    // Tuliskan kode untuk menentukan apakah ada angka yang kurang dari 0 dalam list numbers
    bool hasLessThanZero = false;

    return hasLessThanZero == true;
  }

  bool exercise25() {
    var numbers = [1, 2, 3, 4, 5];
    // Tuliskan kode untuk menentukan apakah jumlah angka ganjil dalam list numbers sama dengan jumlah angka genap
    bool oddCountEqualEvenCount = false;

    return oddCountEqualEvenCount == true;
  }

  bool exercise26() {
    var numbers = [1, 2, 3, 4, 5];
    // Tuliskan kode untuk menentukan apakah angka terbesar dalam list numbers adalah 5
    bool largestIsFive = false;

    return largestIsFive == true;
  }

  bool exercise27() {
    var numbers = [1, 2, 3, 4, 5];
    // Tuliskan kode untuk menentukan apakah angka terkecil dalam list numbers adalah 1
    bool smallestIsOne = false;

    return smallestIsOne == true;
  }

  bool exercise28() {
    var numbers = [1, 2, 3, 4, 5];
    // Tuliskan kode untuk menentukan apakah jumlah angka dalam list numbers adalah 5
    bool countIsFive = false;

    return countIsFive == true;
  }

  bool exercise29() {
    var numbers = [1, 2, 3, 4, 5];
    // Tuliskan kode untuk menentukan apakah ada angka yang sama dalam list numbers
    bool hasDuplicate = false;

    return hasDuplicate == true;
  }

  bool exercise30() {
    var number = 5;
    var result;
    // Tuliskan kode untuk menentukan apakah number adalah bilangan negatif atau positif atau nol
    // Jika number adalah negatif, maka assign result dengan string "Negatif"
    // Jika number adalah positif, maka assign result dengan string "Positif"
    // Jika number adalah 0, maka assign result dengan string "Nol"

    return result == "Positif";
  }

  bool exercise31() {
    int num1 = 5;
    int num2 = 10;
    // Tuliskan kode untuk menentukan apakah num1 lebih besar dari 0 dan num2 lebih besar dari 5
    bool? result;

    return result == true;
  }

  bool exercise32() {
    int num1 = 5;
    int num2 = 10;
    // Tuliskan kode untuk menentukan apakah num1 lebih besar dari 0 atau num2 lebih besar dari 15
    bool? result;

    return result == true;
  }

  bool exercise33() {
    int num1 = 5;
    int num2 = 10;
    // Tuliskan kode untuk menentukan apakah num1 lebih besar dari 0 atau num2 lebih kecil dari 5
    bool? result;

    return result == true;
  }

  bool exercise34() {
    int num1 = 5;
    int num2 = 10;
    // Tuliskan kode untuk menentukan apakah num1 lebih besar dari 0 dan num2 lebih kecil dari 5
    bool? result;

    return result == false;
  }

  bool exercise35() {
    int num1 = 5;
    int num2 = 10;
    // Tuliskan kode untuk menentukan apakah num1 lebih kecil dari 0 atau num2 lebih besar dari 5
    bool? result;

    return result == true;
  }

  Widget build(context, Efd1500IfStatementController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: const Color(0xFFE5D9F2),
      appBar: AppBar(
        title: const Text("FbkDartIfStatement"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics),
            tooltip: "View Statistics",
            onPressed: () {
              final stats = Efd1500Validator.getOverallStats();
              _showOverallStatsDialogEfd1500(context, stats);
            },
          ),
          IconButton(
            icon: const Icon(Icons.play_arrow),
            tooltip: "Run All Tests",
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Row(children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 12),
                    Text("Running Tests...")
                  ]),
                  content: Text("Please wait while we validate all exercises."),
                ),
              );
              Future.delayed(
                  const Duration(seconds: 1), () => Navigator.pop(context));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoBanner(),
              const SizedBox(height: 16),
              _buildQuickStatsCard(),
              const SizedBox(height: 16),
              _buildInstructionsCard(),
              const SizedBox(height: 16),
              const Text("📝 Exercise List (35 Exercises)",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ...List.generate(35,
                  (i) => _buildExerciseCard(rowLabelValidatedEfd1500(i + 1))),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseCard(Widget child) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: child,
      ),
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.purple.shade400]),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.info_outline, color: Colors.white),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "Sistem Validasi Aktif! Tap exercise untuk melihat detail test results.",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStatsCard() {
    final stats = Efd1500Validator.getOverallStats();
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Quick Stats",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    stats.overallGrade,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                    child: _buildStatItem(
                        "Perfect",
                        "${stats.perfectExercises}",
                        Colors.green,
                        Icons.check_circle)),
                Expanded(
                    child: _buildStatItem(
                        "Partial",
                        "${stats.partialExercises}",
                        Colors.orange,
                        Icons.pending)),
                Expanded(
                    child: _buildStatItem("Failed", "${stats.failedExercises}",
                        Colors.red, Icons.cancel)),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Overall Progress",
                        style: TextStyle(fontSize: 12)),
                    Text(
                      "${stats.testPercentage.toStringAsFixed(1)}%",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: stats.testPercentage / 100,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    stats.testPercentage >= 70 ? Colors.green : Colors.orange,
                  ),
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
      String label, String value, Color color, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: color),
        ),
        Text(label,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
      ],
    );
  }

  Widget _buildInstructionsCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.school, color: Colors.purple),
                SizedBox(width: 8),
                Text("How to Use",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            _numberedItem(1,
                "Open file: lib/module/efd1500_if_statement/exercises/efd1500_exercises.dart"),
            _numberedItem(2,
                "Write your code in the designated area inside each exerciseXSolution(...)."),
            _numberedItem(3, "Save the file, then come back to this page"),
            _numberedItem(4,
                "Tap an exercise to see detailed test results (passed/failed, hints)"),
            _numberedItem(5,
                "Use the Run All Tests button in the AppBar to validate everything at once"),
            _numberedItem(
                6, "Aim for all tests to pass to earn the green checkmark!"),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.warning_amber_rounded, color: Colors.amber),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Tip: You CANNOT cheat by just returning true. Multiple test cases validate your logic.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _numberedItem(int number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.purple,
            child: Text(
              "$number",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  void _showOverallStatsDialogEfd1500(
      BuildContext context, Efd1500OverallStats stats) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.analytics, color: Colors.purple),
            SizedBox(width: 8),
            Text("Overall Statistics"),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade400, Colors.purple.shade600],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Text("Overall Grade",
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                    const SizedBox(height: 8),
                    Text(stats.overallGrade,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text("${stats.testPercentage.toStringAsFixed(1)}%",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildStatRow(
                  "Total Exercises", "${stats.totalExercises}", Icons.list_alt),
              _buildStatRow("Perfect Exercises", "${stats.perfectExercises}",
                  Icons.check_circle, Colors.green),
              _buildStatRow("Partial Exercises", "${stats.partialExercises}",
                  Icons.pending, Colors.orange),
              _buildStatRow("Failed Exercises", "${stats.failedExercises}",
                  Icons.cancel, Colors.red),
              const Divider(height: 24),
              _buildStatRow(
                  "Total Tests", "${stats.totalTests}", Icons.assignment),
              _buildStatRow("Passed Tests", "${stats.passedTests}", Icons.check,
                  Colors.green),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, String value, IconData icon,
      [Color? color]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: color ?? Colors.grey),
              const SizedBox(width: 8),
              Text(label),
            ],
          ),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }

  @override
  State<Efd1500IfStatementView> createState() => Efd1500IfStatementController();
}
