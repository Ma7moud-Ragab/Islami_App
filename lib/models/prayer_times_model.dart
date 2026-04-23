class PrayerTimesModel {
  final PrayerTimesData data;

  PrayerTimesModel({required this.data});

  factory PrayerTimesModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimesModel(data: PrayerTimesData.fromJson(json['data']));
  }

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}

class PrayerTimesData {
  final Timings timings;
  final DateInfo date;

  PrayerTimesData({required this.timings, required this.date});

  factory PrayerTimesData.fromJson(Map<String, dynamic> json) {
    return PrayerTimesData(
      timings: Timings.fromJson(json['timings']),
      date: DateInfo.fromJson(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'timings': timings.toJson(), 'date': date.toJson()};
  }
}

class Timings {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  Timings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory Timings.fromJson(Map<String, dynamic> json) {
    return Timings(
      fajr: json['Fajr'] ?? '',
      sunrise: json['Sunrise'] ?? '',
      dhuhr: json['Dhuhr'] ?? '',
      asr: json['Asr'] ?? '',
      maghrib: json['Maghrib'] ?? '',
      isha: json['Isha'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Fajr': fajr,
      'Sunrise': sunrise,
      'Dhuhr': dhuhr,
      'Asr': asr,
      'Maghrib': maghrib,
      'Isha': isha,
    };
  }
}

class DateInfo {
  final String readable;
  final Hijri hijri;
  final Gregorian gregorian;

  DateInfo({
    required this.readable,
    required this.hijri,
    required this.gregorian,
  });

  factory DateInfo.fromJson(Map<String, dynamic> json) {
    return DateInfo(
      readable: json['readable'] ?? '',
      hijri: Hijri.fromJson(json['hijri']),
      gregorian: Gregorian.fromJson(json['gregorian']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'readable': readable,
      'hijri': hijri.toJson(),
      'gregorian': gregorian.toJson(),
    };
  }
}

class Hijri {
  final String date;
  final HijriMonth month;
  final String year;

  Hijri({required this.date, required this.month, required this.year});

  factory Hijri.fromJson(Map<String, dynamic> json) {
    return Hijri(
      date: json['date'] ?? '',
      month: HijriMonth.fromJson(json['month']),
      year: json['year'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'date': date, 'month': month.toJson(), 'year': year};
  }
}

class HijriMonth {
  final String ar;

  HijriMonth({required this.ar});

  factory HijriMonth.fromJson(Map<String, dynamic> json) {
    return HijriMonth(ar: json['ar'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'ar': ar};
  }
}

class Gregorian {
  final Weekday weekday;

  Gregorian({required this.weekday});

  factory Gregorian.fromJson(Map<String, dynamic> json) {
    return Gregorian(weekday: Weekday.fromJson(json['weekday']));
  }

  Map<String, dynamic> toJson() {
    return {'weekday': weekday.toJson()};
  }
}

class Weekday {
  final String en;

  Weekday({required this.en});

  factory Weekday.fromJson(Map<String, dynamic> json) {
    return Weekday(en: json['en'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'en': en};
  }
}
