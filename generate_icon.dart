import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Generate app icon with book symbol
  await generateIcon();

  print('✅ Icon berhasil dibuat!');
  exit(0);
}

Future<void> generateIcon() async {
  // Create a custom painter for the icon
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  final size = 1024.0;

  // Background
  final bgPaint = Paint()
    ..color = const Color(0xFFE1AFD1)
    ..style = PaintingStyle.fill;

  canvas.drawRect(
    Rect.fromLTWH(0, 0, size, size),
    bgPaint,
  );

  // Draw book icon
  final bookPaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  final borderPaint = Paint()
    ..color = const Color(0xFFAD5389)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 8;

  // Book base
  final bookRect = RRect.fromRectAndRadius(
    Rect.fromLTWH(size * 0.2, size * 0.25, size * 0.6, size * 0.5),
    const Radius.circular(20),
  );
  canvas.drawRRect(bookRect, bookPaint);
  canvas.drawRRect(bookRect, borderPaint);

  // Book spine
  final spinePath = Path()
    ..moveTo(size * 0.5, size * 0.25)
    ..lineTo(size * 0.5, size * 0.75);

  final spinePaint = Paint()
    ..color = const Color(0xFFAD5389)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4;

  canvas.drawPath(spinePath, spinePaint);

  // Add sparkle/magic effect
  final sparklePositions = [
    Offset(size * 0.3, size * 0.3),
    Offset(size * 0.7, size * 0.35),
    Offset(size * 0.35, size * 0.65),
    Offset(size * 0.65, size * 0.7),
  ];

  final sparklePaint = Paint()
    ..color = const Color(0xFFFFD700)
    ..style = PaintingStyle.fill;

  for (final pos in sparklePositions) {
    // Star shape
    final starPath = Path();
    for (int i = 0; i < 8; i++) {
      final angle = (i * 45) * 3.14159 / 180;
      final radius = i.isEven ? 15.0 : 8.0;
      final x = pos.dx + radius * ui.cos(angle);
      final y = pos.dy + radius * ui.sin(angle);
      if (i == 0) {
        starPath.moveTo(x, y);
      } else {
        starPath.lineTo(x, y);
      }
    }
    starPath.close();
    canvas.drawPath(starPath, sparklePaint);
  }

  // Convert to image
  final picture = recorder.endRecording();
  final img = await picture.toImage(size.toInt(), size.toInt());
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
  final buffer = byteData!.buffer.asUint8List();

  // Save main icon
  final iconFile = File('assets/icon/app_icon.png');
  await iconFile.writeAsBytes(buffer);

  // Save foreground icon (same for now)
  final foregroundFile = File('assets/icon/app_icon_foreground.png');
  await foregroundFile.writeAsBytes(buffer);

  print('Icon saved to: ${iconFile.path}');
}
