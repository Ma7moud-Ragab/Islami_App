import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/reciter_model.dart';

class ReciterService {
  static const String url =
      'https://www.mp3quran.net/api/v3/reciters?language=ar';

  static Future<RecitersModel?> fetchReciters() async {
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return RecitersModel.fromJson(json);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
