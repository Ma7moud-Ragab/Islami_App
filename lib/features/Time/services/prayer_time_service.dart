import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/prayer_time_model.dart';
import '../models/hijri_date_model.dart';

class PrayerTimeService {
  static const String _baseUrl = 'https://api.aladhan.com/v1';

  static Future<PrayerTime?> getPrayerTimes({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await http
          .get(
            Uri.parse(
              '$_baseUrl/timings?latitude=$latitude&longitude=$longitude&method=2',
            ),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 200 && json['data'] != null) {
          return PrayerTime.fromJson(json['data']);
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<HijriDate?> getHijriDate() async {
    try {
      final response = await http
          .get(
            Uri.parse(
              '$_baseUrl/hijriToGregorian?hijri=${_getCurrentHijriDay()}',
            ),
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 200 && json['data'] != null) {
          return HijriDate.fromJson(json['data']['hijri']);
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static String _getCurrentHijriDay() {
    DateTime now = DateTime.now();
    return '${now.day}-${now.month}-${now.year}';
  }

  static Future<Map<String, dynamic>?> getPrayerTimesWithHijri({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final prayerResponse = await http
          .get(
            Uri.parse(
              '$_baseUrl/timings?latitude=$latitude&longitude=$longitude&method=2',
            ),
          )
          .timeout(const Duration(seconds: 10));

      if (prayerResponse.statusCode != 200) return null;

      final prayerData = jsonDecode(prayerResponse.body);
      if (prayerData['code'] != 200) return null;

      final prayers = PrayerTime.fromJson(prayerData['data']);

      final hijriResponse = await http
          .get(
            Uri.parse(
              '$_baseUrl/hijriToGregorian?hijri=${_getCurrentHijriDay()}',
            ),
          )
          .timeout(const Duration(seconds: 10));

      HijriDate? hijri;
      if (hijriResponse.statusCode == 200) {
        final hijriData = jsonDecode(hijriResponse.body);
        if (hijriData['code'] == 200) {
          hijri = HijriDate.fromJson(hijriData['data']['hijri']);
        }
      }

      return {'prayers': prayers, 'hijri': hijri};
    } catch (e) {
      return null;
    }
  }
}
