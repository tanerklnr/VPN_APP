import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Açık tema ayarları
  static ThemeData lightTheme = ThemeData(
    // Material 3 tasarım dilini kullan
    useMaterial3: true,
    // Açık tema modu
    brightness: Brightness.light,
    // Renk şeması
    colorScheme: ColorScheme.light(
      primary: Color(0xFF2196F3),    // Ana renk
      secondary: Color(0xFF03A9F4),   // İkincil renk
      surface: Colors.white,          // Yüzey rengi
      background: Color(0xFFF5F5F5),  // Arka plan rengi
      error: Color(0xFFB00020),       // Hata rengi
    ),
    // Google Fonts ile Poppins yazı tipini kullan
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
    // Kart tasarım ayarları
    cardTheme: CardTheme(
      elevation: 2,  // Gölge yüksekliği
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),  // Köşe yuvarlaklığı
      ),
    ),
    // Yükseltilmiş buton tasarım ayarları
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),  // İç boşluk
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),  // Köşe yuvarlaklığı
        ),
      ),
    ),
  );

  // Koyu tema ayarları
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF2196F3),     // Ana renk
      secondary: Color(0xFF03A9F4),    // İkincil renk
      surface: Color(0xFF1E1E1E),      // Yüzey rengi (koyu gri)
      background: Color(0xFF121212),   // Arka plan rengi (daha koyu gri)
      error: Color(0xFFCF6679),        // Hata rengi
    ),
    // Koyu tema için Poppins yazı tipi
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    // Koyu tema kart tasarımı
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    // Koyu tema buton tasarımı
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    ),
  );
} 