import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../shared/widget/reusable_widgets.dart';

class ExerciseDetailScreen extends StatefulWidget {
  final String exerciseId;
  final String moduleId;
  final String exerciseTitle;
  final String exerciseDescription;
  final String exerciseCode;
  final String filePath;
  final String functionName;
  final bool isUIExercise;

  const ExerciseDetailScreen({
    Key? key,
    required this.exerciseId,
    required this.moduleId,
    required this.exerciseTitle,
    required this.exerciseDescription,
    required this.exerciseCode,
    required this.filePath,
    required this.functionName,
    this.isUIExercise = false,
  }) : super(key: key);

  @override
  State<ExerciseDetailScreen> createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exerciseTitle),
        backgroundColor: const Color(0xFFAD88C6),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showExerciseInfo(),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFAD88C6),
              Color(0xFFE1AFD1),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Debug Info Card (only for EFW100)
                if (widget.moduleId == 'EFW100') ...[
                  ReusableCard(
                    backgroundColor: Colors.yellow[100],
                    margin: const EdgeInsets.all(
                        8.0), // ✅ Tambahkan margin eksplisit
                    child: Column(
                      children: [
                        Text(
                          'Debug Info',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.orange[800],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Gunakan tombol preview di card list untuk melihat hasil jawaban siswa.',
                          style: TextStyle(
                              color: Colors.orange[900], fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                // Exercise Header
                ReusableCard(
                  backgroundColor: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFAD88C6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.code,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.exerciseTitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Module: ${widget.moduleId}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Colors.grey[600],
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // How to Save Progress Info
                ReusableCard(
                  backgroundColor: Colors.blue.shade50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.blue.shade700,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Cara Menyimpan Progress',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade700,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '1. Edit kode di file: ${widget.filePath}\n'
                        '2. Kembali ke halaman list exercise\n'
                        '3. Klik tombol "Save Progress" di sebelah exercise\n'
                        '4. Atau klik tombol "Save All Progress" di AppBar',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.blue.shade800,
                            ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Exercise Description
                ReusableCard(
                  backgroundColor: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.description,
                            color: const Color(0xFFAD88C6),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Deskripsi Exercise',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFAD88C6),
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.exerciseDescription,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Instructions
                ReusableCard(
                  backgroundColor: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.list_alt,
                            color: const Color(0xFFAD88C6),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Instruksi Pengerjaan',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFAD88C6),
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Text(
                          _getInstructions(),
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    height: 1.5,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // File Location Info
                ReusableCard(
                  backgroundColor: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.folder_open,
                            color: const Color(0xFFAD88C6),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Lokasi File Exercise',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFAD88C6),
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'File: ${widget.filePath}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontFamily: 'monospace',
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Function: ${widget.functionName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontFamily: 'monospace',
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Area yang boleh diedit: "TULIS KODE DI SINI"',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Colors.green.shade700,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ReusableButton(
                        text: 'Buka File\nExercise',
                        onPressed: () => _openExerciseFile(),
                        backgroundColor: const Color(0xFFAD88C6),
                        textColor: Colors.white,
                        icon: Icons.open_in_new,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ReusableButton(
                        text: 'Copy Nama\nFungsi',
                        onPressed: () => _copyFunctionName(),
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        icon: Icons.copy,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Tips
                ReusableCard(
                  backgroundColor: Colors.amber.shade50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.lightbulb,
                            color: Colors.amber.shade700,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Tips Pengerjaan',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber.shade700,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '1. Buka file exercise di IDE/editor favorit Anda\n'
                        '2. Cari function yang sesuai dengan exercise ini\n'
                        '3. Edit kode hanya di area "TULIS KODE DI SINI"\n'
                        '4. Jangan ubah nama function atau return statement\n'
                        '5. Test kode Anda untuk memastikan hasilnya benar\n'
                        '6. Kembali ke aplikasi untuk menyimpan progress',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              height: 1.5,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getInstructions() {
    // Extract instructions from exercise description or code
    // This is a simplified version - in real implementation,
    // you would parse the actual exercise file
    return widget.exerciseDescription;
  }

  void _openExerciseFile() {
    // Show dialog with file path and instructions
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Buka File\nExercise'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('File exercise berada di:'),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                widget.filePath,
                style: const TextStyle(fontFamily: 'monospace'),
              ),
            ),
            const SizedBox(height: 12),
            const Text('Function yang harus diedit:'),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                widget.functionName,
                style: const TextStyle(fontFamily: 'monospace'),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _copyFunctionName() {
    Clipboard.setData(ClipboardData(text: widget.functionName));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Function name copied to clipboard!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showExerciseInfo() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: const Color(0xFFAD88C6),
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Exercise Information',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFAD88C6),
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow('ID', widget.exerciseId),
                  _buildInfoRow('Module', widget.moduleId),
                  _buildInfoRow('File', widget.filePath),
                  _buildInfoRow('Function', widget.functionName),
                  _buildInfoRow('Type',
                      widget.isUIExercise ? "UI Exercise" : "Data Exercise"),
                  const SizedBox(height: 8),
                  _buildInfoRow('Status', 'Belum Selesai'),
                ],
              ),

              const SizedBox(height: 24),

              // Action Button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: const Color(0xFFAD88C6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method untuk membuat row info
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
