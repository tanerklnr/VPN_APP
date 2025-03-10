import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _autoConnect = false;
  bool _killSwitch = false;
  bool _splitTunneling = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Ayarlar',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.primary.withOpacity(0.8),
                      Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildSectionHeader(context, 'Görünüm'),
              _buildSettingItem(
                context,
                title: 'Koyu Tema',
                subtitle: 'Koyu renk temasını etkinleştir',
                icon: Icons.dark_mode,
                trailing: Switch.adaptive(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                ),
              ),
              _buildAnimatedDivider(),
              _buildSectionHeader(context, 'Bağlantı'),
              _buildSettingItem(
                context,
                title: 'Otomatik Bağlan',
                subtitle: 'Uygulama başlatıldığında otomatik bağlan',
                icon: Icons.sync,
                trailing: Switch.adaptive(
                  value: _autoConnect,
                  onChanged: (value) {
                    setState(() {
                      _autoConnect = value;
                    });
                  },
                ),
              ),
              _buildSettingItem(
                context,
                title: 'Kill Switch',
                subtitle: 'VPN bağlantısı kesildiğinde internet erişimini durdur',
                icon: Icons.security,
                trailing: Switch.adaptive(
                  value: _killSwitch,
                  onChanged: (value) {
                    setState(() {
                      _killSwitch = value;
                    });
                  },
                ),
              ),
              _buildSettingItem(
                context,
                title: 'Split Tunneling',
                subtitle: 'Hangi uygulamaların VPN kullanacağını seç',
                icon: Icons.alt_route,
                trailing: Switch.adaptive(
                  value: _splitTunneling,
                  onChanged: (value) {
                    setState(() {
                      _splitTunneling = value;
                    });
                  },
                ),
              ),
              _buildAnimatedDivider(),
              _buildSectionHeader(context, 'Hakkında'),
              _buildSettingItem(
                context,
                title: 'Uygulama Versiyonu',
                subtitle: '1.0.0',
                icon: Icons.info_outline,
                isCard: true,
              ),
              _buildSettingItem(
                context,
                title: 'Gizlilik Politikası',
                subtitle: 'Gizlilik politikamızı inceleyin',
                icon: Icons.privacy_tip_outlined,
                isCard: true,
                onTap: () {
                  // Navigate to privacy policy
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    Widget? trailing,
    VoidCallback? onTap,
    bool isCard = false,
  }) {
    final content = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
      ),
      trailing: trailing,
      onTap: onTap,
    );

    if (isCard) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: content,
      );
    }

    return content;
  }

  Widget _buildAnimatedDivider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.1),
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.1),
          ],
        ),
      ),
    );
  }
} 