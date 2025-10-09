import 'package:flutter/material.dart';
import 'package:magicbook/core.dart';
import '../../../shared/widget/row_label/row_label_validated_efd1300.dart';

class Efd1300StringView extends StatefulWidget {
  const Efd1300StringView({Key? key}) : super(key: key);

  bool? exercise1() {
    bool isValid = false;
    String productName = "JR SUPER 12";
    String query = "JR";

    //Perbaiki condition pada statement dibawah.
    //Seharusnya condition-nya adalah ketika:
    //productName mengandung kata2 yang ada pada variabel query!
    //[Tips] Gunakan .contains
    if (productName != productName) {
      isValid = true;
    }
    return isValid;
  }

  bool? exercise2() {
    bool isEmpty = false;
    String productName = "";
    String query = "JR";

    //Perbaiki condition pada statement dibawah.
    //Seharusnya condition-nya adalah ketika:
    //productName kosong
    //[Tips] Gunakan .isEmpty
    if (productName != productName) {
      isEmpty = true;
    }
    return isEmpty;
  }

  bool? exercise3() {
    bool isValid = false;
    String productName = "GG FILTER 12";
    String query = "JR";

    //Perbaiki condition pada statement dibawah.
    //Seharusnya condition-nya adalah ketika:
    //productName minimal memilki 2 karakter atau lebih
    //[Tips] Gunakan .length, dan >= 2
    if (productName == "") {
      isValid = true;
    }
    return isValid;
  }

  bool? exercise4() {
    bool isValid = false;
    int number = 23;
    String code = "";
    //Ubah angka 23 menjadi String "0023"
    //Gunakan .toString().padLeft(4,"0")!
    return code == "0023";
  }

  bool? exercise5() {
    bool isValid = false;
    int number = 27;
    String code = "";
    //Ubah angka 27 menjadi String "00027"
    //Gunakan .toString().padLeft(5,"0")!
    return code == "00027";
  }

  bool? exercise6() {
    String email = "denyocr.world@gmail.com";
    bool isValid = false;

    //Cek nilai email, apakah email yang valid atau tidak
    //Gunakan Regex di bawah ini:
    //Gunakan fungsi .hasMatch pada Regex!
    /*
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\.[a-zA-Z]+$',
    );
    */
    return isValid;
  }

  bool? exercise7() {
    String firstName = "ANDREA";
    //Index pada statement ini salah
    //Seharusnya index-nya adalah index dari huruf N pada text di atas
    //Perbaiki index-nya!
    bool isValid = firstName[0] == "N";
    return isValid;
  }

  bool? exercise8() {
    String firstName = "ANDREA";
    //Ubah semua text di atas menjadi lowercase semua
    //Gunakan .toLowerCase !
    return firstName == "andrea";
  }

  bool? exercise9() {
    String firstName = "daniel Goleman";
    //Ubah semua text di atas menjadi lowercase semua
    //Gunakan .toUpperCase !
    return firstName == "DANIEL GOLEMAN";
  }

  bool? exercise10() {
    List arr = [];
    String line = "1;GG FILTER 12;250;-";
    //Split string di atas berdasarkan ; dan tampung di dalam arr!
    //Gunakan .split !
    return arr.length == 4;
  }

  bool? exercise11() {
    List arr = [];
    String line = "1,GG FILTER 12,250,-";
    //Split string di atas berdasarkan ; dan tampung di dalam arr!
    //Gunakan .split !
    return arr.length == 4;
  }

  bool? exercise12() {
    Map product = {};
    String str = '{"product_name": "GG FILTER 12","price": 25}';
    //Ubah String di atas menjadi Map di Dart
    //Dan tampung pada variabel product
    //Gunakan jsonDecode!!!
    return product['product_name'] == 'GG FILTER 12';
  }

  bool exercise13() {
    String input = "Hello World";
    // Tuliskan kode untuk mengubah input menjadi huruf besar
    String? output;

    return output == "HELLO WORLD";
  }

  bool exercise14() {
    String input = "Hello World";
    // Tuliskan kode untuk mengubah input menjadi huruf kecil
    String? output;

    return output == "hello world";
  }

  bool exercise15() {
    String input = "Hello World";
    // Tuliskan kode untuk mengubah input menjadi judul case
    String? output;

    return output == "Hello World";
  }

  bool exercise16() {
    String input = "1234";
    // Tuliskan kode untuk mengubah input menjadi angka
    int? output;

    return output == 1234;
  }

  bool exercise17() {
    String input = "1234.56";
    // Tuliskan kode untuk mengubah input menjadi double
    double? output;

    return output == 1234.56;
  }

  bool exercise18() {
    String input = "Rp. 1.234,56";
    // Tuliskan kode untuk mengubah input menjadi double tanpa simbol mata uang
    double? output;

    return output == 1234.56;
  }

  bool exercise19() {
    double input = 1234.56;
    // Tuliskan kode untuk mengubah input menjadi String dengan format currency
    String? output;

    return output == "Rp. 1.234,56";
  }

  bool exercise20() {
    String input = "1234.56";
    // Tuliskan kode untuk mengubah input menjadi String dengan format currency
    String? output;

    return output == "Rp. 1.234,56";
  }

  bool exercise21() {
    String input = "Hello, World!";
    // Tuliskan kode untuk memverifikasi apakah input berisi kata "Hello"
    bool? output;

    return output == true;
  }

  bool exercise22() {
    String input = "Hello, World!";
    // Tuliskan kode untuk mengubah input menjadi "Hello World"
    String? output;

    return output == "Hello World";
  }

  bool exercise23() {
    String input = "Hello, World!";
    // Tuliskan kode untuk mengubah input menjadi "Hello,World!"
    String? output;

    return output == "Hello,World!";
  }

  bool exercise24() {
    String input = "Hello, World!";
    // Tuliskan kode untuk memverifikasi apakah input berisi kata "world"
    bool? output;

    return output == false;
  }

  bool exercise25() {
    String input = "Hello, World!";
    // Tuliskan kode untuk memverifikasi apakah input berisi kata "World"
    bool? output;

    return output == true;
  }

  bool exercise26() {
    String input = "Rp. 10.000";
    // Tuliskan kode untuk mengubah input menjadi 10000
    int? output;

    return output == 10000;
  }

  bool exercise27() {
    String input = "Rp. 10.000";
    // Tuliskan kode untuk mengubah input menjadi 10.000
    double? output;

    return output == 10.000;
  }

  bool exercise28() {
    String input = "Rp. 10.000";
    // Tuliskan kode untuk mengubah input menjadi 10,000.00
    String? output;

    return output == "10,000.00";
  }

  bool exercise29() {
    String input = "Hello, World!";
    // Tuliskan kode untuk memverifikasi apakah input berisi huruf besar
    bool? output;

    return output == true;
  }

  bool exercise30() {
    String input = "Hello, World!";
    // Tuliskan kode untuk memverifikasi apakah input berisi huruf kecil
    bool? output;

    return output == false;
  }

  bool exercise31() {
    String input = "12,345.67";
    // Tuliskan kode untuk mengkonversi input menjadi double
    double? output;

    return output == 12345.67;
  }

  bool exercise32() {
    String input = "Rp. 12.345,67";
    // Tuliskan kode untuk mengkonversi input menjadi double
    double? output;

    return output == 12345.67;
  }

  bool exercise33() {
    String input = "USD 12,345.67";
    // Tuliskan kode untuk mengkonversi input menjadi double
    double? output;

    return output == 12345.67;
  }

  bool exercise34() {
    String input = "€12.345,67";
    // Tuliskan kode untuk mengkonversi input menjadi double
    String cleanInput = input.replaceAll(RegExp(r'[^0-9,]'), '');
    cleanInput = cleanInput.replaceAll(",", ".");
    double? output = double.parse(cleanInput);

    return output == 12345.67;
  }

  bool exercise35() {
    String input = "¥12,345.67";
    // Tuliskan kode untuk mengkonversi input menjadi double
    String cleanInput = input.replaceAll(RegExp(r'[^0-9.]'), '');
    double? output = double.parse(cleanInput);

    return output == 12345.67;
  }

  Widget build(context, Efd1300StringController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: const Color(0xFFE5D9F2),
      appBar: AppBar(
        title: const Text("FbkDartString"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics),
            tooltip: "View Statistics",
            onPressed: () {
              final stats = Efd1300Validator.getOverallStats();
              _showOverallStatsDialogEfd1300(stats);
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
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildInfoBanner(),
              const SizedBox(height: 16),
              _buildQuickStatsCard(),
              const SizedBox(height: 16),
              _buildInstructionsCard(),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "📝 Exercise List (35 Exercises)",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              _buildExerciseCard(rowLabelValidatedEfd1300(1)),
              _buildExerciseCard(rowLabelValidatedEfd1300(2)),
              _buildExerciseCard(rowLabelValidatedEfd1300(3)),
              _buildExerciseCard(rowLabelValidatedEfd1300(4)),
              _buildExerciseCard(rowLabelValidatedEfd1300(5)),
              _buildExerciseCard(rowLabelValidatedEfd1300(6)),
              _buildExerciseCard(rowLabelValidatedEfd1300(7)),
              _buildExerciseCard(rowLabelValidatedEfd1300(8)),
              _buildExerciseCard(rowLabelValidatedEfd1300(9)),
              _buildExerciseCard(rowLabelValidatedEfd1300(10)),
              _buildExerciseCard(rowLabelValidatedEfd1300(11)),
              _buildExerciseCard(rowLabelValidatedEfd1300(12)),
              _buildExerciseCard(rowLabelValidatedEfd1300(13)),
              _buildExerciseCard(rowLabelValidatedEfd1300(14)),
              _buildExerciseCard(rowLabelValidatedEfd1300(15)),
              _buildExerciseCard(rowLabelValidatedEfd1300(16)),
              _buildExerciseCard(rowLabelValidatedEfd1300(17)),
              _buildExerciseCard(rowLabelValidatedEfd1300(18)),
              _buildExerciseCard(rowLabelValidatedEfd1300(19)),
              _buildExerciseCard(rowLabelValidatedEfd1300(20)),
              _buildExerciseCard(rowLabelValidatedEfd1300(21)),
              _buildExerciseCard(rowLabelValidatedEfd1300(22)),
              _buildExerciseCard(rowLabelValidatedEfd1300(23)),
              _buildExerciseCard(rowLabelValidatedEfd1300(24)),
              _buildExerciseCard(rowLabelValidatedEfd1300(25)),
              _buildExerciseCard(rowLabelValidatedEfd1300(26)),
              _buildExerciseCard(rowLabelValidatedEfd1300(27)),
              _buildExerciseCard(rowLabelValidatedEfd1300(28)),
              _buildExerciseCard(rowLabelValidatedEfd1300(29)),
              _buildExerciseCard(rowLabelValidatedEfd1300(30)),
              _buildExerciseCard(rowLabelValidatedEfd1300(31)),
              _buildExerciseCard(rowLabelValidatedEfd1300(32)),
              _buildExerciseCard(rowLabelValidatedEfd1300(33)),
              _buildExerciseCard(rowLabelValidatedEfd1300(34)),
              _buildExerciseCard(rowLabelValidatedEfd1300(35)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final stats = Efd1300Validator.getOverallStats();
          _showOverallStatsDialogEfd1300(stats);
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
    final stats = Efd1300Validator.getOverallStats();
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
      final stats = Efd1300Validator.getOverallStats();
      _showOverallStatsDialogEfd1300(stats);
    });
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
            // Title Row with icon
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

            // Numbered steps
            _numberedItem(1,
                "Open file: lib/module/efd1300_string/exercises/efd1300_exercises.dart"),
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
            // Tip box
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

  void _showOverallStatsDialogEfd1300(Efd1300OverallStats stats) {
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
  State<Efd1300StringView> createState() => Efd1300StringController();
}
