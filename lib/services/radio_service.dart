import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/radio_model.dart';

class RadioService {
  static const String url = 'https://mp3quran.net/api/v3/radios?language=ar';

  static Future<RadiosModel?> fetchRadios() async {
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return RadiosModel.fromJson(json);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
