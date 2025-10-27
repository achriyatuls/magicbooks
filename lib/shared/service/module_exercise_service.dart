import 'dart:io';
import '../../module/efd1100_variable/validator/efd1100_validator.dart';
import '../../module/efb100_null_safety/validator/efb100_validator.dart';
import '../../module/efd1200_datetime/validator/efd1200_validator.dart';
import '../../module/efd1300_string/validator/efd1300_validator.dart';
import '../../module/efd1400_number/validator/efd1400_validator.dart';
import '../../module/efd1500_if_statement/validator/efd1500_validator.dart';
import '../../module/efd1600_list_and_map/validator/efd1600_validator.dart';
import '../../module/efd1700_regex/validator/efd1700_validator.dart';
import 'efw100_progress_service.dart';

class ExerciseInfo {
  final String id;
  final String title;
  final String description;
  final String instructions;
  final String difficulty;
  final bool isValidated;
  final String? hint;
  final String? example;

  ExerciseInfo({
    required this.id,
    required this.title,
    required this.description,
    required this.instructions,
    required this.difficulty,
    required this.isValidated,
    this.hint,
    this.example,
  });
}

class ModuleExerciseService {
  static Future<List<ExerciseInfo>> getModuleExercises(String moduleId) async {
    // For now, always use sample exercises to ensure functionality
    // TODO: Implement proper file loading later
    return _getSampleExercises(moduleId);
  }

  // Get total exercises for a module
  static Future<int> getTotalExercises(String moduleId) async {
    try {
      final exercises = await getModuleExercises(moduleId);
      return exercises.length;
    } catch (e) {
      print('Error getting total exercises for $moduleId: $e');
      // Return default count based on module
      switch (moduleId) {
        case 'EFD1100':
          return 35; // Variable
        case 'EFD1200':
          return 35; // DateTime
        case 'EFD1300':
          return 35; // String
        case 'EFD1400':
          return 35; // Number
        case 'EFD1500':
          return 35; // If Statement
        case 'EFB100':
          return 28; // Null Safety
        case 'EFD1600':
          return 35; // List & Map
        case 'EFD1700':
          return 34; // Regex
        case 'EFD1800':
          return 22; // Async
        case 'EFW100':
          return 20; // Common Widget
        case 'EFW200':
          return 18; // Layout
        case 'EFW300':
          return 15; // ListView
        case 'EFW301':
          return 12; // ListView Advanced
        case 'EFW400':
          return 16; // GridView
        default:
          return 10;
      }
    }
  }

  static Map<String, bool> getExerciseStatus(String moduleId) {
    if (moduleId == 'EFD1100') {
      try {
        final allResults = Efd1100Validator.runAllTests();
        Map<String, bool> status = {};

        for (var entry in allResults.entries) {
          final exerciseId = '${moduleId}_ex${entry.key}';
          status[exerciseId] = entry.value.isPerfect;
        }

        return status;
      } catch (e) {
        print('Error getting exercise status: $e');
        return {};
      }
    } else if (moduleId == 'EFD1200') {
      try {
        final allResults = Efd1200Validator.runAllTests();
        Map<String, bool> status = {};

        for (var entry in allResults.entries) {
          final exerciseId = '${moduleId}_ex${entry.key}';
          status[exerciseId] = entry.value.isPerfect;
        }

        return status;
      } catch (e) {
        print('Error getting EFD1200 exercise status: $e');
        return {};
      }
    } else if (moduleId == 'EFD1300') {
      try {
        final allResults = Efd1300Validator.runAllTests();
        Map<String, bool> status = {};

        for (var entry in allResults.entries) {
          final exerciseId = '${moduleId}_ex${entry.key}';
          status[exerciseId] = entry.value.isPerfect;
        }

        return status;
      } catch (e) {
        print('Error getting EFD1300 exercise status: $e');
        return {};
      }
    } else if (moduleId == 'EFD1400') {
      try {
        final allResults = Efd1400Validator.runAllTests();
        Map<String, bool> status = {};

        for (var entry in allResults.entries) {
          final exerciseId = '${moduleId}_ex${entry.key}';
          status[exerciseId] = entry.value.isPerfect;
        }

        return status;
      } catch (e) {
        print('Error getting EFD1400 exercise status: $e');
        return {};
      }
    } else if (moduleId == 'EFD1500') {
      try {
        final allResults = Efd1500Validator.runAllTests();
        Map<String, bool> status = {};

        for (var entry in allResults.entries) {
          final exerciseId = '${moduleId}_ex${entry.key}';
          status[exerciseId] = entry.value.isPerfect;
        }

        return status;
      } catch (e) {
        print('Error getting EFD1500 exercise status: $e');
        return {};
      }
    } else if (moduleId == 'EFB100') {
      try {
        final allResults = Efb100Validator.runAllTests();
        Map<String, bool> status = {};

        for (var entry in allResults.entries) {
          final exerciseId = '${moduleId}_ex${entry.key}';
          status[exerciseId] = entry.value.isPerfect;
        }

        return status;
      } catch (e) {
        print('Error getting EFB100 exercise status: $e');
        return {};
      }
    } else if (moduleId == 'EFW100') {
      try {
        // Gunakan Efw100ProgressService untuk mendapatkan status
        return Efw100ProgressService.instance.getExerciseStatus();
      } catch (e) {
        print('Error getting EFW100 exercise status: $e');
        return {};
      }
    } else if (moduleId == 'EFD1600') {
      try {
        final allResults = Efd1600Validator.runAllTests();
        Map<String, bool> status = {};

        for (var entry in allResults.entries) {
          final exerciseId = '${moduleId}_ex${entry.key}';
          status[exerciseId] = entry.value.isPerfect;
        }

        return status;
      } catch (e) {
        print('Error getting EFD1600 exercise status: $e');
        return {};
      }
    } else if (moduleId == 'EFD1700') {
      try {
        // EFD1700 validator expose runTest synchronously; build status map for 34 exercises
        Map<String, bool> status = {};
        for (int i = 1; i <= 34; i++) {
          final result = Efd1700Validator.runTest(i);
          final exerciseId = '${moduleId}_ex$i';
          status[exerciseId] = result.isPerfect;
        }
        return status;
      } catch (e) {
        print('Error getting EFD1700 exercise status: $e');
        return {};
      }
    }
    return {};
  }

  // Method to get completed exercise count
  static int getCompletedExerciseCount(String moduleId) {
    final status = getExerciseStatus(moduleId);
    return status.values.where((isCompleted) => isCompleted).length;
  }

  static Future<String> _loadExerciseFile(String moduleId) async {
    try {
      // Map module ID to file path
      String filePath = _getExerciseFilePath(moduleId);
      print('Attempting to load file: $filePath');

      // Load file content using dart:io
      final file = File(filePath);
      if (await file.exists()) {
        final content = await file.readAsString();
        print('Successfully loaded file: $filePath');
        return content;
      } else {
        print('File does not exist: $filePath');
        return '';
      }
    } catch (e) {
      print('Error loading file for $moduleId: $e');
      print('File path attempted: ${_getExerciseFilePath(moduleId)}');
      return '';
    }
  }

  static String _getExerciseFilePath(String moduleId) {
    // Map module IDs to their exercise file paths
    switch (moduleId) {
      case 'EFD1100':
        return 'lib/module/efd1100_variable/exercises/efd1100_exercises.dart';
      case 'EFD1200':
        return 'lib/module/efd1200_datetime/exercises/efd1200_exercises.dart';
      case 'EFD1300':
        return 'lib/module/efd1300_string/exercises/efd1300_exercises.dart';
      case 'EFD1400':
        return 'lib/module/efd1400_number/exercises/efd1400_exercises.dart';
      case 'EFD1500':
        return 'lib/module/efd1500_if_statement/exercises/efd1500_exercises.dart';
      case 'EFB100':
        return 'lib/module/efb100_null_safety/exercises/efb100_exercises.dart';
      case 'EFD1600':
        return 'lib/module/efd1600_list_and_map/exercises/efd1600_exercises.dart';
      case 'EFD1700':
        return 'lib/module/efd1700_regex/exercises/efd1700_exercises.dart';
      case 'EFD1800':
        return 'lib/module/efd1800_async_function/exercises/efd1800_exercises.dart';
      case 'EFW100':
        return 'lib/module/efw100_common_widget/view/efw100_common_widget_view.dart';
      default:
        throw Exception('Unknown module ID: $moduleId');
    }
  }

  static Future<String> getExerciseCode(
      String moduleId, String exerciseId) async {
    try {
      if (moduleId == 'EFW100') {
        // Untuk EFW100, kembalikan template exercise
        return _getEfw100ExerciseCode(exerciseId);
      } else {
        final exerciseFile = await _loadExerciseFile(moduleId);
        return _extractExerciseCode(exerciseFile, exerciseId);
      }
    } catch (e) {
      print('Error getting exercise code: $e');
      return _getDefaultExerciseCode(exerciseId);
    }
  }

  static String _extractExerciseCode(String content, String exerciseId) {
    // Extract exercise number from ID
    final exerciseNumber = exerciseId.split('_ex')[1];

    // Find the exercise section
    final exerciseSections = content.split(
        '// ═══════════════════════════════════════════════════════════════════════════');

    for (int i = 1; i < exerciseSections.length; i++) {
      final section = exerciseSections[i];
      if (section.contains('EXERCISE $exerciseNumber:')) {
        // Extract the function code
        final lines = section.split('\n');
        String code = '';
        bool inFunction = false;

        for (final line in lines) {
          if (line.trim().startsWith('static')) {
            inFunction = true;
          }

          if (inFunction) {
            code += line + '\n';

            // Stop at the end of function
            if (line.trim() == '}' && code.contains('return')) {
              break;
            }
          }
        }

        return code.trim();
      }
    }

    return _getDefaultExerciseCode(exerciseId);
  }

  static String _getDefaultExerciseCode(String exerciseId) {
    return '''
// Exercise code for $exerciseId
// Complete the exercise as instructed

void main() {
  // Your code here
}
''';
  }

  static String _getEfw100ExerciseCode(String exerciseId) {
    // Extract exercise number from ID
    final exerciseNumber = exerciseId.split('_ex')[1];

    switch (exerciseNumber) {
      case '1':
        return '''
// Exercise 1: Container
Widget? exercise1() {
  // Buat sebuah Container dengan lebar 100, tinggi 100, dan warna merah
  return Container(
    width: 100,
    height: 100,
    color: Colors.red,
  );
}
''';
      case '2':
        return '''
// Exercise 2: Text
Widget? exercise2() {
  // Buat sebuah Text dengan isi "Hello Flutter" dan ukuran font 24
  return Text(
    "Hello Flutter",
    style: TextStyle(fontSize: 24),
  );
}
''';
      case '3':
        return '''
// Exercise 3: Icon
Widget? exercise3() {
  // Buat sebuah Icon dengan Icons.home dan warna biru
  return Icon(
    Icons.home,
    color: Colors.blue,
  );
}
''';
      default:
        return '''
// Exercise $exerciseNumber: Widget Exercise
Widget? exercise$exerciseNumber() {
  // Complete the exercise as instructed
  return Container(
    child: Text('Exercise $exerciseNumber'),
  );
}
''';
    }
  }

  static Future<List<ExerciseInfo>> getAllExercises() async {
    List<ExerciseInfo> allExercises = [];

    final moduleIds = [
      'EFD1100',
      'EFD1200',
      'EFD1300',
      'EFD1400',
      'EFD1500',
      'EFB100',
      'EFD1600',
      'EFD1700',
      'EFD1800'
    ];

    for (final moduleId in moduleIds) {
      try {
        final exercises = await getModuleExercises(moduleId);
        allExercises.addAll(exercises);
      } catch (e) {
        print('Error loading exercises for $moduleId: $e');
      }
    }

    return allExercises;
  }

  // Fallback method to provide sample exercises when file loading fails
  static List<ExerciseInfo> _getSampleExercises(String moduleId) {
    switch (moduleId) {
      case 'EFD1100':
        return [
          ExerciseInfo(
            id: '${moduleId}_ex1',
            title: 'Exercise 1: Type Check',
            description: 'Buat variabel price bertipe String dan isi nilainya',
            instructions:
                'Buat variabel price bertipe String dan isi nilainya. Pastikan TIDAK menggunakan tipe int tanpa quotes (contoh: 100). Contoh benar: "100" (String)',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan String? price = "100";',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex2',
            title: 'Exercise 2: Konversi String ke Double',
            description:
                'Ubah parameter text (String) menjadi double, dan return hasilnya',
            instructions:
                'Ubah parameter text (String) menjadi double, dan return hasilnya. Gunakan double.parse()',
            difficulty: 'Easy',
            isValidated: true,
            hint: 'Gunakan double.parse(text)',
            example: 'Input: "100.24" Output: 100.24 (double)',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex3',
            title: 'Exercise 3: Konversi dengan Validasi',
            description:
                'String input mungkin mengandung karakter non-numeric, hilangkan karakter yang bukan angka dan titik',
            instructions:
                'String input mungkin mengandung karakter non-numeric (contoh: "300.24a"). Hilangkan karakter yang bukan angka dan titik, lalu konversi ke double',
            difficulty: 'Medium',
            isValidated: true,
            hint:
                'Gunakan .replaceAll(RegExp(r\'[^\\d.]\'), \'\') untuk hilangkan non-numeric',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex4',
            title: 'Exercise 4: Cek Bilangan Ganjil',
            description: 'Periksa apakah input adalah bilangan ganjil',
            instructions:
                'Periksa apakah input adalah bilangan ganjil. Return true jika ganjil, false jika genap',
            difficulty: 'Easy',
            isValidated: true,
            hint:
                'Gunakan modulo operator (%) untuk cek sisa bagi. Bilangan ganjil: input % 2 != 0',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex5',
            title: 'Exercise 5: Parse dengan Try-Catch Safety',
            description: 'Parse string "300aa" menjadi double dengan aman',
            instructions:
                'Parse string "300aa" menjadi double dengan aman. Jika gagal, gunakan default value 0.0',
            difficulty: 'Easy',
            isValidated: true,
            hint: 'Gunakan double.tryParse() ?? 0.0',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex6',
            title: 'Exercise 6: Safe Int Parse',
            description: 'Perbaiki kode yang error dengan menggunakan tryParse',
            instructions:
                'Uncomment kode dibawah ini! Kode dibawah akan error jika di jalankan. Perbaiki dengan menggunakan .tryParse("39ads")??0',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan int.tryParse("39ads") ?? 0',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex7',
            title: 'Exercise 7: Type Conversion Int',
            description: 'Konversi price (int) ke value (String) dengan benar',
            instructions:
                'Uncomment kode dibawah, dan perbaiki agar tidak error. Konversi price (int) ke value (String) dengan benar',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan value = price.toString();',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex8',
            title: 'Exercise 8: Extract Text Between Quotes',
            description: 'Ambil text yang berada di antara tanda petik tunggal',
            instructions:
                'Ambil text yang berada di antara tanda petik tunggal (\' \'). Contoh: Input: "hello \'Deny\', apa kabar?" Output: "Deny"',
            difficulty: 'Medium',
            isValidated: true,
            hint: 'Gunakan indexOf dan substring',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex9',
            title: 'Exercise 9: Calculate Average',
            description: 'Hitunglah nilai rata-rata dari List',
            instructions:
                'Hitunglah nilai rata-rata dari List di bawah. TIPS: Gunakan for untuk mendapatkan total. Gunakan numbers.length untuk mendapatkan panjang List',
            difficulty: 'Medium',
            isValidated: false,
            hint:
                'Gunakan loop untuk menghitung total, lalu bagi dengan length',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex10',
            title: 'Exercise 10: Find Min and Max',
            description: 'Hitunglah minValue dan maxValue dari List numbers',
            instructions:
                'Hitunglah minValue dan maxValue dari List numbers di bawah. TIPS: Gunakan .sort, ambil minValue dari .first dan ambil maxValue dari .last',
            difficulty: 'Medium',
            isValidated: false,
            hint: 'Gunakan numbers.sort() lalu ambil first dan last',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex11',
            title: 'Exercise 11: Penjumlahan',
            description: 'Tambahkan 5 pada input',
            instructions: 'Tambahkan 5 pada input',
            difficulty: 'Easy',
            isValidated: true,
            hint: 'Gunakan input + 5',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex12',
            title: 'Exercise 12: Subtraction',
            description: 'Kurangi input dengan 5',
            instructions: 'Kurangi input dengan 5',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input - 5',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex13',
            title: 'Exercise 13: Addition Two Numbers',
            description: 'Jumlahkan input1 dan input2',
            instructions: 'Jumlahkan input1 dan input2',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input1 + input2',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex14',
            title: 'Exercise 14: Subtraction Two Numbers',
            description: 'Kurangi input2 dengan input1',
            instructions: 'Kurangi input2 dengan input1',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input2 - input1',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex15',
            title: 'Exercise 15: Division',
            description: 'Bagi input2 dengan input1',
            instructions: 'Bagi input2 dengan input1',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input2 / input1',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex16',
            title: 'Exercise 16: Multiplication',
            description: 'Kalikan input1 dan input2',
            instructions: 'Kalikan input1 dan input2',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input1 * input2',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex17',
            title: 'Exercise 17: Modulo',
            description: 'Hitung sisa bagi input2 dengan input1',
            instructions: 'Hitung sisa bagi input2 dengan input1',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input2 % input1',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex18',
            title: 'Exercise 18: String Concatenation',
            description: 'Tambahkan " World!" pada input',
            instructions:
                'Tambahkan " World!" pada input. Contoh: Input: "Hello" Output: "Hello World!"',
            difficulty: 'Easy',
            isValidated: true,
            hint: 'Gunakan input + " World!"',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex19',
            title: 'Exercise 19: Get First Word',
            description: 'Ambil kata pertama dari input',
            instructions:
                'Ambil kata pertama dari input. HINT: Gunakan .split() dan ambil index pertama',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input.split(" ")[0]',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex20',
            title: 'Exercise 20: Get Second Word',
            description: 'Ambil kata kedua dari input',
            instructions:
                'Ambil kata kedua dari input. HINT: Gunakan .split() dan ambil index kedua',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input.split(" ")[1]',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex21',
            title: 'Exercise 21: Check Even Number',
            description: 'Periksa apakah input adalah bilangan genap',
            instructions:
                'Periksa apakah input adalah bilangan genap. HINT: Gunakan modulo (%) untuk cek sisa bagi 2',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input % 2 == 0',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex22',
            title: 'Exercise 22: Check Odd Number',
            description: 'Periksa apakah input adalah bilangan ganjil',
            instructions:
                'Periksa apakah input adalah bilangan ganjil. HINT: Gunakan modulo (%) untuk cek sisa bagi 2',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input % 2 != 0',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex23',
            title: 'Exercise 23: String Length Greater Than 3',
            description:
                'Periksa apakah input memiliki panjang lebih dari 3 karakter',
            instructions:
                'Periksa apakah input memiliki panjang lebih dari 3 karakter. HINT: Gunakan .length',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input.length > 3',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex24',
            title: 'Exercise 24: String Length Equal 3',
            description:
                'Periksa apakah input memiliki panjang sama dengan 3 karakter',
            instructions:
                'Periksa apakah input memiliki panjang sama dengan 3 karakter. HINT: Gunakan .length',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input.length == 3',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex25',
            title: 'Exercise 25: String Starts With',
            description: 'Periksa apakah input dimulai dengan huruf \'D\'',
            instructions:
                'Periksa apakah input dimulai dengan huruf \'D\'. HINT: Gunakan .startsWith()',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input.startsWith("D")',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex26',
            title: 'Exercise 26: String Ends With',
            description: 'Periksa apakah input diakhiri dengan huruf \'t\'',
            instructions:
                'Periksa apakah input diakhiri dengan huruf \'t\'. HINT: Gunakan .endsWith()',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input.endsWith("t")',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex27',
            title: 'Exercise 27: Check 5 Digits',
            description: 'Periksa apakah input memiliki 5 digit',
            instructions:
                'Periksa apakah input memiliki 5 digit. HINT: Konversi ke String dulu, lalu gunakan .length',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input.toString().length == 5',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex28',
            title: 'Exercise 28: Check 4 Digits',
            description: 'Periksa apakah input memiliki 4 digit',
            instructions:
                'Periksa apakah input memiliki 4 digit. HINT: Konversi ke String dulu, lalu gunakan .length',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input.toString().length == 4',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex29',
            title: 'Exercise 29: Check 2 Decimals',
            description: 'Periksa apakah input memiliki 2 digit setelah koma',
            instructions:
                'Periksa apakah input memiliki 2 digit setelah koma. HINT: Gunakan .split(\'.\') untuk memisahkan bagian desimal',
            difficulty: 'Medium',
            isValidated: false,
            hint: 'Gunakan input.toString().split(".")[1].length == 2',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex30',
            title: 'Exercise 30: Check 3 Decimals',
            description: 'Periksa apakah input memiliki 3 digit setelah koma',
            instructions:
                'Periksa apakah input memiliki 3 digit setelah koma. HINT: Gunakan .split(\'.\') untuk memisahkan bagian desimal',
            difficulty: 'Medium',
            isValidated: false,
            hint: 'Gunakan input.toString().split(".")[1].length == 3',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex31',
            title: 'Exercise 31: Check Palindrome',
            description: 'Periksa apakah input adalah palindrome',
            instructions:
                'Periksa apakah input adalah palindrome (dibaca sama dari depan/belakang). HINT: Gunakan .split(\'\').reversed.join(\'\') untuk balik String',
            difficulty: 'Hard',
            isValidated: false,
            hint: 'Gunakan input == input.split("").reversed.join("")',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex32',
            title: 'Exercise 32: Convert to Snake Case',
            description:
                'Ubah input menjadi huruf kecil semua dan ganti spasi dengan underscore',
            instructions:
                'Ubah input menjadi huruf kecil semua. Ganti spasi dengan underscore (_). HINT: Gunakan .toLowerCase() dan .replaceAll(\' \', \'_\')',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input.toLowerCase().replaceAll(" ", "_")',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex33',
            title: 'Exercise 33: Check if String is Number',
            description: 'Periksa apakah input adalah angka valid',
            instructions:
                'Periksa apakah input adalah angka valid. HINT: Gunakan int.tryParse(), cek apakah hasilnya != null',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan int.tryParse(input) != null',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex34',
            title: 'Exercise 34: Limit String Length',
            description:
                'Batasi jumlah karakter pada input menjadi 50 karakter',
            instructions:
                'Batasi jumlah karakter pada input menjadi 50 karakter. HINT: Gunakan .substring(0, 50)',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan input.substring(0, 50)',
          ),
          ExerciseInfo(
            id: '${moduleId}_ex35',
            title: 'Exercise 35: Check if String Contains Word',
            description: 'Periksa apakah kata "Dart" muncul dalam input',
            instructions:
                'Periksa apakah kata "Dart" muncul dalam input. HINT: Gunakan .contains()',
            difficulty: 'Easy',
            isValidated: true,
            hint: 'Gunakan input.contains("Dart")',
          ),
        ];
      case 'EFD1200':
        // Generate 35 exercises for DateTime
        return List.generate(35, (index) {
          final exerciseNum = index + 1;
          return ExerciseInfo(
            id: '${moduleId}_ex$exerciseNum',
            title: 'Exercise $exerciseNum: DateTime Exercise',
            description: 'Exercise tentang DateTime',
            instructions: 'Complete the DateTime exercise as instructed',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan DateTime operations',
          );
        });
      case 'EFD1300':
        // Generate 35 exercises for String
        return List.generate(35, (index) {
          final exerciseNum = index + 1;
          return ExerciseInfo(
            id: '${moduleId}_ex$exerciseNum',
            title: 'Exercise $exerciseNum: String Exercise',
            description: 'Exercise tentang String',
            instructions: 'Complete the String exercise as instructed',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan String operations',
          );
        });
      case 'EFD1400':
        // Generate 35 exercises for Number
        return List.generate(35, (index) {
          final exerciseNum = index + 1;
          return ExerciseInfo(
            id: '${moduleId}_ex$exerciseNum',
            title: 'Exercise $exerciseNum: Number Exercise',
            description: 'Exercise tentang Number',
            instructions: 'Complete the Number exercise as instructed',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan Number operations',
          );
        });
      case 'EFD1500':
        // Generate 35 exercises for If Statement
        return List.generate(35, (index) {
          final exerciseNum = index + 1;
          return ExerciseInfo(
            id: '${moduleId}_ex$exerciseNum',
            title: 'Exercise $exerciseNum: If Statement Exercise',
            description: 'Exercise tentang If Statement',
            instructions: 'Complete the If Statement exercise as instructed',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan If Statement operations',
          );
        });
      case 'EFB100':
        // Generate 28 exercises for Null Safety
        return List.generate(28, (index) {
          final exerciseNum = index + 1;
          return ExerciseInfo(
            id: '${moduleId}_ex$exerciseNum',
            title: 'Exercise $exerciseNum: Null Safety Exercise',
            description: 'Exercise tentang Null Safety',
            instructions: 'Complete the Null Safety exercise as instructed',
            difficulty: 'Medium',
            isValidated: false,
            hint: 'Gunakan Null Safety operations',
          );
        });
      case 'EFD1600':
        // Generate 35 exercises for List & Map
        return List.generate(35, (index) {
          final exerciseNum = index + 1;
          return ExerciseInfo(
            id: '${moduleId}_ex$exerciseNum',
            title: 'Exercise $exerciseNum: List & Map Exercise',
            description: 'Exercise tentang List & Map',
            instructions: 'Complete the List & Map exercise as instructed',
            difficulty: 'Intermediate',
            isValidated: false,
            hint: 'Gunakan List & Map operations',
          );
        });
      case 'EFD1700':
        // Generate 34 exercises for Regex
        return List.generate(34, (index) {
          final exerciseNum = index + 1;
          return ExerciseInfo(
            id: '${moduleId}_ex$exerciseNum',
            title: 'Exercise $exerciseNum: Regex Exercise',
            description: 'Exercise tentang Regex',
            instructions: 'Complete the Regex exercise as instructed',
            difficulty: 'Advanced',
            isValidated: false,
            hint: 'Gunakan Regex operations',
          );
        });
      case 'EFD1800':
        // Generate 22 exercises for Async Function
        return List.generate(22, (index) {
          final exerciseNum = index + 1;
          return ExerciseInfo(
            id: '${moduleId}_ex$exerciseNum',
            title: 'Exercise $exerciseNum: Async Function Exercise',
            description: 'Exercise tentang Async Function',
            instructions: 'Complete the Async Function exercise as instructed',
            difficulty: 'Advanced',
            isValidated: false,
            hint: 'Gunakan Async Function operations',
          );
        });
      case 'EFW100':
        // Generate 20 exercises for Common Widget
        return List.generate(20, (index) {
          final exerciseNum = index + 1;
          return ExerciseInfo(
            id: '${moduleId}_ex$exerciseNum',
            title: 'Exercise $exerciseNum: Common Widget Exercise',
            description: 'Exercise tentang Common Widget',
            instructions: 'Complete the Common Widget exercise as instructed',
            difficulty: 'Beginner',
            isValidated: false,
            hint: 'Gunakan Common Widget operations',
          );
        });
      case 'EFW200':
        // Generate 18 exercises for Layout
        return List.generate(18, (index) {
          final exerciseNum = index + 1;
          return ExerciseInfo(
            id: '${moduleId}_ex$exerciseNum',
            title: 'Exercise $exerciseNum: Layout Exercise',
            description: 'Exercise tentang Layout',
            instructions: 'Complete the Layout exercise as instructed',
            difficulty: 'Beginner',
            isValidated: false,
            hint: 'Gunakan Layout operations',
          );
        });
      case 'EFW300':
        // Generate 15 exercises for List
        return List.generate(15, (index) {
          final exerciseNum = index + 1;
          return ExerciseInfo(
            id: '${moduleId}_ex$exerciseNum',
            title: 'Exercise $exerciseNum: List Exercise',
            description: 'Exercise tentang List',
            instructions: 'Complete the List exercise as instructed',
            difficulty: 'Intermediate',
            isValidated: false,
            hint: 'Gunakan List operations',
          );
        });
      case 'EFW301':
        // Generate 12 exercises for List Advanced
        return List.generate(12, (index) {
          final exerciseNum = index + 1;
          return ExerciseInfo(
            id: '${moduleId}_ex$exerciseNum',
            title: 'Exercise $exerciseNum: List Advanced Exercise',
            description: 'Exercise tentang List Advanced',
            instructions: 'Complete the List Advanced exercise as instructed',
            difficulty: 'Advanced',
            isValidated: false,
            hint: 'Gunakan List Advanced operations',
          );
        });
      case 'EFW400':
        // Generate 16 exercises for Grid
        return List.generate(16, (index) {
          final exerciseNum = index + 1;
          return ExerciseInfo(
            id: '${moduleId}_ex$exerciseNum',
            title: 'Exercise $exerciseNum: Grid Exercise',
            description: 'Exercise tentang Grid',
            instructions: 'Complete the Grid exercise as instructed',
            difficulty: 'Intermediate',
            isValidated: false,
            hint: 'Gunakan Grid operations',
          );
        });
      default:
        return [
          ExerciseInfo(
            id: '${moduleId}_ex1',
            title: 'Exercise 1: Basic',
            description: 'Exercise dasar untuk module $moduleId',
            instructions: 'Complete the exercise as instructed',
            difficulty: 'Easy',
            isValidated: false,
            hint: 'Gunakan operasi dasar',
          ),
        ];
    }
  }
}
