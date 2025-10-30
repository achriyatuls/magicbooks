import 'package:flutter/material.dart';

class Efw301PreviewScreen extends StatelessWidget {
  final int exerciseNumber;
  final Widget? widget;
  final bool isValid;

  const Efw301PreviewScreen({
    Key? key,
    required this.exerciseNumber,
    required this.widget,
    required this.isValid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5C6FF),
      appBar: AppBar(
        title: const Text('EFW301 - ListView Advanced'),
        backgroundColor: const Color(0xFFAD88C6),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isValid ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isValid ? Icons.check_circle : Icons.error,
                    color: Colors.white,
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    isValid ? 'Berhasil' : 'Error',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple.shade50,
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Exercise Info Card
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.purple.shade100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.code,
                                color: Colors.purple,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Exercise $exerciseNumber',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    widget != null
                                        ? widget!.runtimeType.toString()
                                        : 'Widget tidak tersedia',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'File: efw301_list_view.dart',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
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
                ),
                const SizedBox(height: 16),

                // Preview Section
                Text(
                  'Preview Hasil Pengerjaan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                // Preview Card
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isValid ? Colors.green : Colors.red,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: widget != null
                        ? Center(child: _buildPreviewSurface(widget!))
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  size: 48,
                                  color: Colors.grey,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Widget tidak tersedia',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 16),

                // Validation Info
                Card(
                  color: isValid ? Colors.green.shade50 : Colors.red.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(
                          isValid ? Icons.check_circle : Icons.cancel,
                          color: isValid ? Colors.green : Colors.red,
                          size: 32,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                isValid
                                    ? 'Validasi Berhasil'
                                    : 'Validasi Gagal',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isValid
                                      ? Colors.green.shade900
                                      : Colors.red.shade900,
                                ),
                              ),
                              Text(
                                isValid
                                    ? 'Widget Anda sudah sesuai dengan instruksi exercise.'
                                    : 'Widget Anda belum sesuai dengan instruksi exercise.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: isValid
                                      ? Colors.green.shade700
                                      : Colors.red.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPreviewSurface(Widget widget) {
    // Untuk layout widgets seperti Row, Column, Stack, Wrap, dll
    if (widget is Scaffold) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: widget,
      );
    }

    if (widget is Row || widget is Column) {
      return Material(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Center(child: widget),
        ),
      );
    }

    if (widget is Stack) {
      return Material(
        child: Container(
          width: 200,
          height: 200,
          child: widget,
        ),
      );
    }

    if (widget is Wrap) {
      return Material(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Center(child: widget),
        ),
      );
    }

    if (widget is Transform) {
      return Material(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Center(child: widget),
        ),
      );
    }

    if (widget is SizedBox ||
        widget is Padding ||
        widget is Center ||
        widget is Align ||
        widget is AspectRatio ||
        widget is FractionallySizedBox) {
      return Material(
        child: widget,
      );
    }

    if (widget is LayoutBuilder) {
      return Material(
        child: Container(
          width: 200,
          height: 200,
          child: widget,
        ),
      );
    }

    // Default: wrap dengan Material
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(child: widget),
      ),
    );
  }
}
