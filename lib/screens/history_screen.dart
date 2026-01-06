import 'package:flutter/material.dart';
import '../models/water_history.dart';
import '../services/history_service.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<WaterHistory> history = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    history = await HistoryService.getHistory();
    setState(() {});
  }

  Map<String, List<WaterHistory>> _groupByDate() {
    final Map<String, List<WaterHistory>> result = {};

    for (final item in history) {
      final key =
          '${item.date.day}/${item.date.month}/${item.date.year}';

      result.putIfAbsent(key, () => []);
      result[key]!.add(item);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final grouped = _groupByDate();

    return Scaffold(
      backgroundColor: const Color(0xFFE1F5FE),
      appBar: AppBar(
        title: const Text('Thống kê uống nước'),
        centerTitle: true,
        backgroundColor: const Color(0xFFE1F5FE),
        elevation: 0,
      ),
      body: grouped.isEmpty
          ? const Center(child: Text('Chưa có dữ liệu 💧'))
          : ListView(
              padding: const EdgeInsets.all(16),
              children: grouped.entries.map((entry) {
                final total = entry.value
                    .fold<int>(0, (sum, e) => sum + e.amount);

                return ExpansionTile(
                  leading: const Icon(Icons.calendar_today),
                  title: Text(entry.key),
                  trailing: Text('$total ml',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                  children: entry.value.map((item) {
                    final timeText =
                        '${item.time.hour.toString().padLeft(2, '0')}:${item.time.minute.toString().padLeft(2, '0')}';

                    return ListTile(
                      leading: const Icon(Icons.water_drop),
                      title: Text('${item.amount} ml'),
                      subtitle: Text(timeText),
                    );
                  }).toList(),
                );
              }).toList(),
            ),
    );
  }
}
