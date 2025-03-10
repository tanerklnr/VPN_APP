import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/server_selection_screen.dart';
import 'screens/settings_screen.dart';
import 'theme/app_theme.dart';
import 'theme/theme_provider.dart';

// Provider ile state management başlatılıyor
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

// Stateless widget kullanıyoruz çünkü tema değişikliği Provider tarafından yönetiliyor
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Consumer widget'ı ile ThemeProvider bağdaştırdım.
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VPNana',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        // ThemeMode, hangi temanın kullanılacağını belirliyor
        themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Ekranlar listesi - sıralama bottom navigation ile aynı olmalı
  final List<Widget> _screens = [
    const HomeScreen(),
    const ServerSelectionScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      body: _screens[_currentIndex],
      // Custom tasarımlı bottom navigation bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          // Üst gölge efekti
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: NavigationBar(
          height: 65,
          backgroundColor: Colors.transparent,
          // Seçili öğe arkasındaki highlight rengi
          indicatorColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          // Navigation öğeleri
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
                // Seçili duruma göre renk değişimi
                color: _currentIndex == 0
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
              selectedIcon: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: 'Ana Sayfa',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.language_outlined,
                color: _currentIndex == 1
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
              selectedIcon: Icon(
                Icons.language,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: 'Sunucular',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.settings_outlined,
                color: _currentIndex == 2
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
              selectedIcon: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: 'Ayarlar',
            ),
          ],
        ),
      ),
    );
  }
}
