class PrayerTime {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final DateTime date;

  PrayerTime({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.date,
  });

  factory PrayerTime.fromJson(Map<String, dynamic> json) {
    final timings = json['timings'] as Map<String, dynamic>;
    return PrayerTime(
      fajr: _formatTime(timings['Fajr'] ?? ''),
      sunrise: _formatTime(timings['Sunrise'] ?? ''),
      dhuhr: _formatTime(timings['Dhuhr'] ?? ''),
      asr: _formatTime(timings['Asr'] ?? ''),
      maghrib: _formatTime(timings['Maghrib'] ?? ''),
      isha: _formatTime(timings['Isha'] ?? ''),
      date: DateTime.now(),
    );
  }

  static String _formatTime(String time) {
    if (time.isEmpty) return '--:--';
    final parts = time.split(':');
    if (parts.length < 2) return '--:--';
    return '${parts[0]}:${parts[1]}';
  }

  List<Map<String, String>> get prayersList => [
    {'title': 'Fajr', 'time': fajr},
    {'title': 'Sunrise', 'time': sunrise},
    {'title': 'Dhuhr', 'time': dhuhr},
    {'title': 'Asr', 'time': asr},
    {'title': 'Maghrib', 'time': maghrib},
    {'title': 'Isha', 'time': isha},
  ];
}
