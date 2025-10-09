import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import 'package:intl/intl.dart';
import '../../../shared/widget/row_label/row_label_validated_efd1200.dart';

class Efd1200DatetimeView extends StatefulWidget {
  const Efd1200DatetimeView({Key? key}) : super(key: key);

  bool? exercise1() {
    DateTime date = DateTime(2023, 8, 1);
    //Ubah tanggal di atas menjadi 2023-08-01
    //Gunakan DateFormat dari package intl
    //Gunakan format ini: yyyy-MM-dd
    //Masukkan nilainya ke variable datef
    String datef = "";
    return datef == "2023-08-01";
  }

  bool? exercise2() {
    DateTime date = DateTime(2023, 8, 1, 20, 21);
    //Ubah tanggal di atas menjadi 2023-08-01 20:21
    //Gunakan DateFormat dari package intl
    //Gunakan format ini: yyyy-MM-dd kk:mm
    //Masukkan nilainya ke variable datef
    String datef = "";
    return datef == "2023-08-01 20:21";
  }

  bool? exercise3() {
    DateTime date = DateTime(2023, 8, 1, 20, 21);
    //Ambil hari dari variabel date
    //Gunakan .day
    int day = 0;
    return day == 1;
  }

  bool? exercise4() {
    DateTime date = DateTime(2023, 8, 1, 20, 21);
    //Ambil bulan dari variabel date
    //Gunakan .month
    int day = 0;
    return day == 8;
  }

  bool? exercise5() {
    DateTime date = DateTime(2023, 8, 1, 20, 21);
    //Ambil tahun dari variabel date
    //Gunakan .year
    int day = 0;
    return day == 2023;
  }

  bool? exercise6() {
    DateTime date = DateTime(2023, 8, 1, 15, 30);
    //Ambil jam dan menit dari DateTime date.
    //Gunakan DateFormat dengan format kk:ss
    //Masukkan nialinya ke variable time
    String time = "";
    return time == "15:30";
  }

  bool? exercise7() {
    DateTime date = DateTime.now();
    //Ubah tanggal di atas menjadi hari ini
    //Gunakan DateFormat dari package intl
    //Gunakan format ini: yyyy-MM-dd
    //Masukkan nilainya ke variable datef
    String datef = "";
    return datef == DateFormat("yyyy-MM-dd").format(DateTime.now());
  }

  bool? exercise8() {
    DateTime date = DateTime.now();
    //Ambil jam, menit, dan detik saat ini dari DateTime date.
    //Gunakan DateFormat dengan format kk:mm:ss
    //Masukkan nilainya ke variable time
    String time = "";
    return time == DateFormat("kk:mm:ss").format(DateTime.now());
  }

  bool? exercise9() {
    DateTime startAt = DateTime(2023, 8, 1, 15, 30);
    DateTime endAt = DateTime(2023, 9, 1, 15, 30);
    //Ambil selisih hari antara startAt dan endAt
    //Gunakan .difference
    //Contoh: endAt.difference(startAt).inDays;
    //Assign nilainya ke variable diff
    int diff = 0;
    return diff == 31;
  }

  bool? exercise10() {
    DateTime date = DateTime(2023, 8, 1, 15, 30);
    //Ubah format tanggal variable date menjadi:
    //Tuesday, 1 Aug 2023
    //Gunakan DateFormat : EEEE, d MMM y
    //Assign ke variable datef
    String datef = "";
    return datef == "Tuesday, 1 Aug 2023";
  }

  bool exercise11() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk mengubah format tanggal menjadi "1 Januari 2022"
    String? output;

    return output == "1 Januari 2022";
  }

  bool exercise12() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk mengubah format tanggal menjadi "Senin, 1 Januari 2022"
    String? output;

    return output == "Senin, 1 Januari 2022";
  }

  bool exercise13() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk mengubah format tanggal menjadi "Senin, 1 Jan 2022"
    String? output;

    return output == "Senin, 1 Jan 2022";
  }

  bool exercise14() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk mengubah format tanggal menjadi "Sen, 1 Jan 2022"
    String? output;

    return output == "Sen, 1 Jan 2022";
  }

  bool exercise15() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk mengubah format tanggal menjadi "1/1/22"
    String? output;

    return output == "1/1/22";
  }

  bool exercise16() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk mengubah format tanggal menjadi "1-1-22"
    String? output;

    return output == "1-1-22";
  }

  bool exercise17() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk mengubah format tanggal menjadi "2022-01-01"
    String? output;

    return output == "2022-01-01";
  }

  bool exercise18() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk mengubah format tanggal menjadi "2022.01.01"
    String? output;

    return output == "2022.01.01";
  }

  bool exercise19() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk mengubah format tanggal menjadi "2022/01/01"
    String? output;

    return output == "2022/01/01";
  }

  bool exercise20() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk mengubah format tanggal menjadi "2022 01 01"
    String? output;

    return output == "2022 01 01";
  }

  bool exercise21() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk menambahkan 1 hari pada date
    var result = date;

    return result.day == 2 && result.month == 1 && result.year == 2022;
  }

  bool exercise22() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk mengurangi 1 hari pada date
    var result = date;

    return result.day == 31 && result.month == 12 && result.year == 2021;
  }

  bool exercise23() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk menambahkan 1 bulan pada date
    var result = date;

    return result.day == 1 && result.month == 2 && result.year == 2022;
  }

  bool exercise24() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk mengurangi 1 bulan pada date
    var result = date;

    return result.day == 1 && result.month == 12 && result.year == 2021;
  }

  bool exercise25() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk menambahkan 1 tahun pada date
    var result = date;

    return result.day == 1 && result.month == 1 && result.year == 2023;
  }

  bool exercise26() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk mengurangi 1 tahun pada date
    var result = date;

    return result.day == 1 && result.month == 1 && result.year == 2021;
  }

  bool exercise27() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk menambahkan 5 hari pada date
    var result = date;

    return result.day == 6 && result.month == 1 && result.year == 2022;
  }

  bool exercise28() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk mengurangi 5 hari pada date
    var result = date;

    return result.day == 27 && result.month == 12 && result.year == 2021;
  }

  bool exercise29() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk menambahkan 2 bulan pada date
    var result = date;

    return result.day == 1 && result.month == 3 && result.year == 2022;
  }

  bool exercise30() {
    var date = DateTime(2022, 1, 1);
    // Tuliskan kode untuk mengurangi 2 bulan pada date
    var result = date;

    return result.day == 1 && result.month == 11 && result.year == 2021;
  }

  bool exercise31() {
    var date1 = DateTime(2022, 1, 1);
    var date2 = DateTime(2022, 1, 2);
    // Tuliskan kode untuk menentukan selisih hari antara date1 dan date2
    int? difference;

    return difference == 1;
  }

  bool exercise32() {
    var date1 = DateTime(2022, 1, 1);
    var date2 = DateTime(2023, 1, 1);
    // Tuliskan kode untuk menentukan selisih tahun antara date1 dan date2
    int? difference;

    return difference == 1;
  }

  bool exercise33() {
    var date1 = DateTime(2022, 1, 1);
    var date2 = DateTime(2022, 2, 1);
    // Tuliskan kode untuk menentukan selisih bulan antara date1 dan date2
    int? difference;

    return difference == 1;
  }

  bool exercise34() {
    var date1 = DateTime(2022, 1, 1);
    var date2 = DateTime(2022, 1, 2);
    // Tuliskan kode untuk menentukan selisih minggu antara date1 dan date2
    int? difference;

    return difference == 1;
  }

  bool exercise35() {
    var date1 = DateTime(2022, 1, 1);
    var date2 = DateTime(2022, 1, 1, 5, 0, 0);
    // Tuliskan kode untuk menentukan selisih jam antara date1 dan date2
    int? difference;

    return difference == 5;
  }

  Widget build(context, Efd1200DatetimeController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: const Color(0xFFE5D9F2),
      appBar: AppBar(
        title: const Text("FbkDartDatetime"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics),
            tooltip: "View Statistics",
            onPressed: () {
              final stats = Efd1200Validator.getOverallStats();
              _showOverallStatsDialog(stats);
            },
          ),
          IconButton(
            icon: const Icon(Icons.play_arrow),
            tooltip: "Run All Tests",
            onPressed: () => _showRunAllTestsDialog(context),
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
                  (i) => _buildExerciseCard(rowLabelValidatedEfd1200(i + 1))),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final stats = Efd1200Validator.getOverallStats();
          _showOverallStatsDialog(stats);
        },
        icon: const Icon(Icons.assessment),
        label: const Text("View Stats"),
        backgroundColor: Colors.purple,
      ),
    );
  }

  Widget _buildExerciseCard(Widget child) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
    final stats = Efd1200Validator.getOverallStats();
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
                  child: Text(stats.overallGrade,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
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
                    Text("${stats.testPercentage.toStringAsFixed(1)}%",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: stats.testPercentage / 100,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      stats.testPercentage >= 70
                          ? Colors.green
                          : Colors.orange),
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
        Text(value,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: color)),
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
                "Open file: lib/module/efd1200_datetime/exercises/efd1200_exercises.dart"),
            _numberedItem(2,
                "Write your code in the designated area inside each exerciseXSolution(...)"),
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
            child: Text("$number",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  void _showRunAllTestsDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        title: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 16),
            Text("Running Tests...")
          ],
        ),
        content: Text("Please wait while we validate all exercises."),
      ),
    );
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context);
      final stats = Efd1200Validator.getOverallStats();
      _showOverallStatsDialog(stats);
    });
  }

  void _showOverallStatsDialog(Efd1200OverallStats stats) {
    showDialog(
      context: Get.currentContext,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.analytics, color: Colors.purple),
            SizedBox(width: 8),
            Text("Overall Statistics")
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
                      colors: [Colors.purple.shade400, Colors.purple.shade600]),
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
              child: const Text("Close"))
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
          Text(value,
              style: TextStyle(fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  @override
  State<Efd1200DatetimeView> createState() => Efd1200DatetimeController();
}
