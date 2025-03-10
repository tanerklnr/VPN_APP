import 'package:flutter/material.dart';

// ChangeNotifier: State değişikliklerini dinleyenlere bildirim gönderir
class ThemeProvider extends ChangeNotifier {
  // Tema durumunu tutan private değişken
  bool _isDarkMode = false;

  // Tema durumunu okumak için getter
  bool get isDarkMode => _isDarkMode;

  // Tema değiştirme fonksiyonu
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;  // Durumu tersine çevir
    notifyListeners();           // Değişikliği dinleyenlere bildir
  }
} 