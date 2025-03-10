import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FlagGenerator {
  static Future<void> generatePlaceholderFlags() async {
    final flags = {
      'TR': Colors.red,
      'US': Colors.blue,
      'GB': Colors.indigo,
      'DE': Colors.amber,
      'JP': Colors.white,
    };

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final size = Size(100, 60);

    for (var entry in flags.entries) {
      canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = entry.value,
      );

      final picture = recorder.endRecording();
      final img = await picture.toImage(size.width.toInt(), size.height.toInt());
      final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
      final buffer = byteData!.buffer.asUint8List();

      final directory = Directory('assets/flags');
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }
      
      final file = File('assets/flags/${entry.key}.png');
      await file.writeAsBytes(buffer);
    }
  }
} 