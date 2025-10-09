import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../../../shared/widget/row_label/row_label_validated_efd1400.dart';

class Efd1400NumberView extends StatefulWidget {
  const Efd1400NumberView({Key? key}) : super(key: key);

  bool? exercise1() {
    int? number;
    //Uncomment kode dibawah
    //Perbaiki error-nya!
    //Kali ini, jika String yang di input tidak valid,
    //Kita akan membuat nilai number menjadi 0
    //Gunakan .tryParse !

    /*
    number = int.parse("23a") ;
    */

    return number == 0;
  }

  bool? exercise2() {
    int? number;
    //Uncomment kode dibawah
    //Perbaiki error-nya!
    //Kali ini, jika String yang di input tidak valid,
    //Kita akan membuang semua non-numeric Character dengan Regex
    //Gunakan .replaceAll(RegExp(r'[^0-9]+'), '')

    /*
    number = int.parse("23a") ;
    */
    return number == 23;
  }

  bool? exercise3() {
    double? number;
    //Uncomment kode dibawah
    //Perbaiki error-nya!
    //[TIPS] Hover mouse ke method parse
    //Apakah tipe data yang seharusnya di input?
    //Perbaiki tipe data-nya agar kode ini bekerja!

    /*
    number = double.parse(29.23);
    */
    return number == 29.23;
  }

  bool? exercise4() {
    double? number;
    //Uncomment kode dibawah
    //Perbaiki error-nya!
    //[TIPS] Gunakan .tryParse
    //Jika error setting nilainya ke 0
    /*
    number = double.parse("29.23a");
    */
    return number == 0;
  }

  bool? exercise5() {
    //Uncomment kode di bawah
    //Kode-nya akan error karena kita memasukkan variabel integer
    //sebagai Parameter
    //Sedangkan function getTotal hanya menerima double!
    //Perbaiki deklarasi ketiga variable ini menjadi double!
    int total = 0;
    int qty = 2;
    int price = 100;
    /*
    total = getTotal(qty, price);
    */
    return total != 0;
  }

  //Kode ini tidak perlu di ubah
  double getTotal(double price, double qty) {
    return price * qty;
  }

  bool? exercise6() {
    int total = 0;
    //Uncomment kode di bawah
    //Kode tersebut akan error, karena hasil pembagian adalah double
    //Sedangkan variabel total adalah integer.
    //Perbaiki tipe data dari total!
    /*
    total = 23 / 2;
    */
    return total != 0;
  }

  bool? exercise7() {
    double price = 2500.2521;
    //Kita ingin membuat nilai price menjadi 2500.25
    //Ini bisa dilakukan dengan .toStringAsFixed(2)
    //Perbaiki kode return di bawah, agar nilainya adalah 2500.25!
    //[TIPS] - .toStringAsFixed(2) adalah method yang dimiliki variabel double
    //Bukan String!
    return price.toString() == "2500.25";
  }

  bool? exercise8() {
    int id = 1001;
    //Kita ingin membuat nilai id menjadi 00001001 (String)
    //Gunakan .padLeft(8, "0") pada return dibawah ini
    return id.toString() == "00001001";
  }

  bool? exercise9() {
    int input = 25000;
    //Atur nilai formattedInput menjadi Rp25.000.
    //Gunakan Regex berikut
    /*
      .replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => "${match[1]}.")
    */
    //Tambahkan "Rp" di depannya:
    String formattedInput = "";
    return formattedInput == "Rp25.000";
  }

  bool? exercise10() {
    int input = 2250;
    //Atur nilai formattedInput menjadi $2.250
    //Gunakan Regex berikut
    /*
      .replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => "${match[1]}.")
    */
    //Tambahkan "\$" di depannya:
    //[Tips] Untuk menampilkan Dollar di String, kamu harus menggunakan \$ bukan $
    String formattedInput = "";
    return formattedInput == "\$2.250";
  }

  bool? exercise11() {
    double number = 23.89;
    //Bulatkan number ke atas, menggunakan .ceil
    return number == 24;
  }

  bool? exercise12() {
    double number = 23.39;
    //Bulatkan number ke bawah, menggunakan .floor
    return number == 23;
  }

  bool exercise13() {
    int input = 12345;
    // Tuliskan kode untuk memverifikasi apakah input adalah bilangan genap
    bool? output;

    return output == false;
  }

  bool exercise14() {
    double input = 12345.6789;
    // Tuliskan kode untuk membulatkan input ke 2 angka di belakang koma
    double? output;

    return output == 12345.68;
  }

  bool exercise15() {
    int input = 123456;
    // Tuliskan kode untuk memverifikasi apakah input adalah bilangan bulat yang habis dibagi 3
    bool? output;

    return output == false;
  }

  bool exercise16() {
    int input = 123456;
    // Tuliskan kode untuk memverifikasi apakah input adalah bilangan bulat yang habis dibagi 6
    bool? output;

    return output == true;
  }

  bool exercise17() {
    int a = 10;
    int b = 20;
    // Tuliskan kode untuk menukar nilai a dan b
    int? c;
    int? d;

    return c == 20 && d == 10;
  }

  bool exercise18() {
    int input = 12345;
    // Tuliskan kode untuk memverifikasi apakah input adalah bilangan prima
    bool? output;

    return output == false;
  }

  bool exercise19() {
    double input = 12345.6789;
    // Tuliskan kode untuk membulatkan input ke 1 angka di belakang koma
    double? output;

    return output == 12345.7;
  }

  bool exercise20() {
    int input = 123456;
    // Tuliskan kode untuk memverifikasi apakah input adalah bilangan bulat yang habis dibagi 9
    bool? output;

    return output == true;
  }

  bool exercise21() {
    String input = "12345";
// Tuliskan kode untuk mengkonversi input menjadi integer
    int? output;

    return output == 12345;
  }

  bool exercise22() {
    String input = "12.345";
// Tuliskan kode untuk mengkonversi input menjadi double
    double? output;

    return output == 12.345;
  }

  bool exercise23() {
    int input = 12345;
// Tuliskan kode untuk mengkonversi input menjadi string
    String? output;

    return output == "12345";
  }

  bool exercise24() {
    double input = 12345.678;
// Tuliskan kode untuk mengkonversi input menjadi string
    String? output;

    return output == "12345.678";
  }

  bool exercise25() {
    String input = "12345";
// Tuliskan kode untuk memverifikasi apakah input merupakan bilangan bulat
    bool? output;

    return output == true;
  }

  bool exercise26() {
    String input = "12345.678";
// Tuliskan kode untuk memverifikasi apakah input merupakan bilangan riil
    bool? output;

    return output == true;
  }

  bool exercise27() {
    String input = "abcde";
// Tuliskan kode untuk memverifikasi apakah input merupakan bilangan bulat
    bool? output;

    return output == false;
  }

  bool exercise28() {
    String input = "abcde";
// Tuliskan kode untuk memverifikasi apakah input merupakan bilangan riil
    bool? output;

    return output == false;
  }

  bool exercise29() {
    int input = 12345;
// Tuliskan kode untuk memverifikasi apakah input merupakan bilangan negatif
    bool? output;

    return output == false;
  }

  bool exercise30() {
    int input = -12345;
// Tuliskan kode untuk memverifikasi apakah input merupakan bilangan negatif
    bool? output;

    return output == true;
  }

  bool exercise31() {
    int input = 12345;
// Tuliskan kode untuk memverifikasi apakah input merupakan bilangan positif
    bool? output;

    return output == true;
  }

  bool exercise32() {
    int input = -12345;
// Tuliskan kode untuk memverifikasi apakah input merupakan bilangan positif
    bool? output;

    return output == false;
  }

  bool exercise33() {
    String input = "1,000.50";
    // Tuliskan kode untuk mengubah input menjadi double
    double? output;

    return output == 1000.5;
  }

  bool exercise34() {
    String input = "100,000";
    // Tuliskan kode untuk mengubah input menjadi int
    int? output;

    return output == 100000;
  }

  bool exercise35() {
    String input = "100.5";
    // Tuliskan kode untuk memverifikasi apakah input bisa dikonversi ke double
    bool? output;

    return output == true;
  }

  Widget build(context, Efd1400NumberController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: const Color(0xFFE5D9F2),
      appBar: AppBar(
        title: const Text("FbkDartNumber"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics),
            tooltip: "View Statistics",
            onPressed: () {
              final stats = Efd1400Validator.getOverallStats();
              _showOverallStatsDialogEfd1400(stats);
            },
          ),
          IconButton(
            icon: const Icon(Icons.play_arrow),
            tooltip: "Run All Tests",
            onPressed: () {
              _showRunAllTestsDialog(context);
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
              // Info Banner
              _buildInfoBanner(),
              const SizedBox(height: 16),

              // Quick Stats Card
              _buildQuickStatsCard(),
              const SizedBox(height: 16),

              // Instructions (moved just below Quick Stats)
              _buildInstructionsCard(),
              const SizedBox(height: 16),

              // Exercise List
              _buildSectionTitle("📝 Exercise List (35 Exercises)"),
              const SizedBox(height: 8),
              _buildExerciseCard(rowLabelValidatedEfd1400(1)),
              _buildExerciseCard(rowLabelValidatedEfd1400(2)),
              _buildExerciseCard(rowLabelValidatedEfd1400(3)),
              _buildExerciseCard(rowLabelValidatedEfd1400(4)),
              _buildExerciseCard(rowLabelValidatedEfd1400(5)),
              _buildExerciseCard(rowLabelValidatedEfd1400(6)),
              _buildExerciseCard(rowLabelValidatedEfd1400(7)),
              _buildExerciseCard(rowLabelValidatedEfd1400(8)),
              _buildExerciseCard(rowLabelValidatedEfd1400(9)),
              _buildExerciseCard(rowLabelValidatedEfd1400(10)),
              _buildExerciseCard(rowLabelValidatedEfd1400(11)),
              _buildExerciseCard(rowLabelValidatedEfd1400(12)),
              _buildExerciseCard(rowLabelValidatedEfd1400(13)),
              _buildExerciseCard(rowLabelValidatedEfd1400(14)),
              _buildExerciseCard(rowLabelValidatedEfd1400(15)),
              _buildExerciseCard(rowLabelValidatedEfd1400(16)),
              _buildExerciseCard(rowLabelValidatedEfd1400(17)),
              _buildExerciseCard(rowLabelValidatedEfd1400(18)),
              _buildExerciseCard(rowLabelValidatedEfd1400(19)),
              _buildExerciseCard(rowLabelValidatedEfd1400(20)),
              _buildExerciseCard(rowLabelValidatedEfd1400(21)),
              _buildExerciseCard(rowLabelValidatedEfd1400(22)),
              _buildExerciseCard(rowLabelValidatedEfd1400(23)),
              _buildExerciseCard(rowLabelValidatedEfd1400(24)),
              _buildExerciseCard(rowLabelValidatedEfd1400(25)),
              _buildExerciseCard(rowLabelValidatedEfd1400(26)),
              _buildExerciseCard(rowLabelValidatedEfd1400(27)),
              _buildExerciseCard(rowLabelValidatedEfd1400(28)),
              _buildExerciseCard(rowLabelValidatedEfd1400(29)),
              _buildExerciseCard(rowLabelValidatedEfd1400(30)),
              _buildExerciseCard(rowLabelValidatedEfd1400(31)),
              _buildExerciseCard(rowLabelValidatedEfd1400(32)),
              _buildExerciseCard(rowLabelValidatedEfd1400(33)),
              _buildExerciseCard(rowLabelValidatedEfd1400(34)),
              _buildExerciseCard(rowLabelValidatedEfd1400(35)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final stats = Efd1400Validator.getOverallStats();
          _showOverallStatsDialogEfd1400(stats);
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
          colors: [Colors.blue.shade400, Colors.purple.shade400],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.info_outline, color: Colors.white),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "Sistem Validasi Aktif! Tap exercise untuk melihat detail test results.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStatsCard() {
    final stats = Efd1400Validator.getOverallStats();
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Quick Stats",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    stats.overallGrade,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                Text(
                  "How to Use",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _numberedItem(1,
                "Open file: lib/module/efd1400_number/exercises/efd1400_exercises.dart"),
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

  void _showRunAllTestsDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        title: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 16),
            Text("Running Tests..."),
          ],
        ),
        content: Text("Please wait while we validate all exercises."),
      ),
    );
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context);
      final stats = Efd1400Validator.getOverallStats();
      _showOverallStatsDialogEfd1400(stats);
    });
  }

  void _showOverallStatsDialogEfd1400(Efd1400OverallStats stats) {
    showDialog(
      context: Get.currentContext,
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
                    Text(
                      stats.overallGrade,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${stats.testPercentage.toStringAsFixed(1)}%",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
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
  State<Efd1400NumberView> createState() => Efd1400NumberController();
}
