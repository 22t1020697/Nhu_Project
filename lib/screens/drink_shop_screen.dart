import 'package:flutter/material.dart';
import '../data/drink_data.dart';
import 'drink_detail_screen.dart';

class DrinkShopScreen extends StatelessWidget {
  const DrinkShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundBlue = Color(0xFFE1F5FE);
    const cardPink = Color(0xFFFFEBEE);
    const accentBlue = Color(0xFF0288D1);

    return Scaffold(
      backgroundColor: backgroundBlue,
      appBar: AppBar(
        title: const Text(
          'Đồ uống sức khỏe',
          style: TextStyle(color: accentBlue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: backgroundBlue,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: drinkData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final drink = drinkData[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DrinkDetailScreen(drink: drink),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: cardPink,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(0.25),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(22)),
                      child: Image.asset(
                        drink['image']!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      drink['name']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: accentBlue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
