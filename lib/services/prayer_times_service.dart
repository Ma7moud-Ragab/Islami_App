import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../models/prayer_times_model.dart';

class PrayerTimesService {
  static const String baseUrl = 'https://api.aladhan.com/v1/timingsByCity';

  static Future<PrayerTimesModel?> fetchPrayerTimes() async {
    try {
      final date = DateFormat('dd-MM-yyyy').format(DateTime.now());
      final url = '$baseUrl/$date?city=cairo&country=egypt';

      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return PrayerTimesModel.fromJson(json);
      } else {
        // Handle non-200 status codes
        return null;
      }
    } catch (e) {
      // Handle errors like no internet, timeout
      return null;
    }
  }
}
