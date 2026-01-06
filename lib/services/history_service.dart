import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/water_history.dart';

class HistoryService {
  static const String _key = 'water_history';

  /// 💾 LƯU 1 LẦN UỐNG
  static Future<void> save(WaterHistory item) async {
    final prefs = await SharedPreferences.getInstance();
    final history = await getHistory();

    history.insert(0, item);

    final data =
        history.map((e) => jsonEncode(e.toJson())).toList();

    await prefs.setStringList(_key, data);
  }

  /// 📜 LẤY TOÀN BỘ
  static Future<List<WaterHistory>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? data = prefs.getStringList(_key);

    if (data == null) return [];

    return data
        .map((e) => WaterHistory.fromJson(jsonDecode(e)))
        .toList();
  }

  /// 🗑 XOÁ TOÀN BỘ
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
