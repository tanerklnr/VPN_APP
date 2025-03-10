import 'package:flutter/material.dart';

class ServerSelectionScreen extends StatelessWidget {
  const ServerSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar, Kaydırılabilir ve genişleyebilir app bar
          SliverAppBar(
            expandedHeight: 120, // Genişlemiş yükseklik
            floating: true,     // Yukarı kaydırınca görünür
            pinned: true,       // Sabit kalır, tamamen kaybolmaz
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Sunucu Seçimi',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              // Gradient arka plan
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
          // SliverToBoxAdapter: Normal widget'ları Sliver yapısına uyarlar
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                // Çoklu gölge efekti
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
                // Gradient arka plan
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  ],
                ),
              ),
              child: Column(
                children: [
                  // Otomatik seçim butonu
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.auto_awesome,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Otomatik Seçim',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'En hızlı sunucuyu otomatik seç',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Önerilen etiketi
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Önerilen',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SliverList: Kaydırılabilir liste
          SliverList(
            delegate: SliverChildListDelegate([
              // Sunucu listesi öğeleri
              _buildServerItem(
                context,
                countryCode: 'TR',
                countryName: 'Türkiye',
                city: 'İstanbul',
                ping: 15,
                isRecommended: true,
              ),
              _buildServerItem(
                context,
                countryCode: 'US',
                countryName: 'Amerika Birleşik Devletleri',
                city: 'New York',
                ping: 120,
              ),
              _buildServerItem(
                context,
                countryCode: 'GB',
                countryName: 'Birleşik Krallık',
                city: 'Londra',
                ping: 85,
              ),
              _buildServerItem(
                context,
                countryCode: 'DE',
                countryName: 'Almanya',
                city: 'Frankfurt',
                ping: 45,
              ),
              _buildServerItem(
                context,
                countryCode: 'JP',
                countryName: 'Japonya',
                city: 'Tokyo',
                ping: 200,
              ),
            ]),
          ),
        ],
      ),
    );
  }

  // Sunucu öğesi widget'ı
  Widget _buildServerItem(
    BuildContext context, {
    required String countryCode,
    required String countryName,
    required String city,
    required int ping,
    bool isRecommended = false,
  }) {
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
      // Material ve InkWell: Tıklama efekti için
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Sunucu seçim işlemi
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                // Ülke kodu container'ı
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Text(
                      countryCode,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                // Sunucu bilgileri
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        countryName,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          SizedBox(width: 4),
                          Text(
                            city,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Ping ve önerilen etiketi
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getPingColor(ping).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '$ping ms',
                        style: TextStyle(
                          color: _getPingColor(ping),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (isRecommended) ...[
                      SizedBox(height: 4),
                      Text(
                        'Önerilen',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Ping değerine göre renk döndüren yardımcı fonksiyon
  Color _getPingColor(int ping) {
    if (ping < 50) return Colors.green;    // İyi ping
    if (ping < 100) return Colors.orange;  // Orta ping
    return Colors.red;                     // Kötü ping
  }
} 