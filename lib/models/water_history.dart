class WaterHistory {
  final int amount;
  final DateTime time;
  final DateTime date;

  WaterHistory({
    required this.amount,
    required this.time,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'time': time.toIso8601String(),
        'date': date.toIso8601String(),
      };

  factory WaterHistory.fromJson(Map<String, dynamic> json) {
    return WaterHistory(
      amount: json['amount'],
      time: DateTime.parse(json['time']),
      date: DateTime.parse(json['date']),
    );
  }
}
