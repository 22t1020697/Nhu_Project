import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrinkDetailScreen extends StatelessWidget {
  final Map<String, String> drink;

  const DrinkDetailScreen({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    const backgroundBlue = Color(0xFFE1F5FE);
    const cardPink = Color(0xFFFFEBEE);
    const accentBlue = Color(0xFF0288D1);
    const accentPink = Color(0xFFF48FB1);

    return Scaffold(
      backgroundColor: backgroundBlue,
      appBar: AppBar(
        title: Text(
          drink['name']!,
          style: const TextStyle(color: accentBlue),
        ),
        backgroundColor: backgroundBlue,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: cardPink,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink.withOpacity(0.25),
                  blurRadius: 25,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    drink['image']!,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),

                _centerInfo('⏰ Thời điểm tốt nhất', drink['bestTime']!),
                _centerInfo('🥤 Lượng nên uống', drink['amount']!),
                _centerInfo('❤️ Lời khuyên', drink['advice']!),
                _centerInfo('📋 Cách làm', drink['recipe']!),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  icon: const Icon(Icons.play_circle),
                  label: const Text('Xem cách làm'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentPink,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 14),
                  ),
                  onPressed: () async {
                    final url = Uri.parse(drink['youtube']!);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _centerInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF0288D1),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
