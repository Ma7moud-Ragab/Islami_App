class HijriDate {
  final int day;
  final int month;
  final int year;

  HijriDate({required this.day, required this.month, required this.year});

  factory HijriDate.fromJson(Map<String, dynamic> json) {
    return HijriDate(
      day: int.tryParse(json['day'].toString()) ?? 0,
      month: int.tryParse(json['month']['number'].toString()) ?? 0,
      year: int.tryParse(json['year'].toString()) ?? 0,
    );
  }

  String get formatted => '$day ${_monthName(month)} $year ه';

  static String _monthName(int month) {
    const months = [
      'Muharram',
      'Safar',
      'Rabi\' al-awwal',
      'Rabi\' al-thani',
      'Jumada al-awwal',
      'Jumada al-thani',
      'Rajab',
      'Sha\'ban',
      'Ramadan',
      'Shawwal',
      'Dhu al-Qi\'dah',
      'Dhu al-Hijjah',
    ];
    if (month < 1 || month > 12) return '';
    return months[month - 1];
  }
}
