import 'package:flutter/material.dart';
import '../models/prayer_times_model.dart';
import '../services/prayer_times_service.dart';

class PrayerTimesProvider with ChangeNotifier {
  PrayerTimesModel? _prayerTimes;
  bool _isLoading = false;
  String? _error;

  PrayerTimesModel? get prayerTimes => _prayerTimes;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchPrayerTimes() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final data = await PrayerTimesService.fetchPrayerTimes();
      if (data != null) {
        _prayerTimes = data;
      } else {
        _error = 'فشل في تحميل أوقات الصلاة. تحقق من الاتصال بالإنترنت.';
      }
    } catch (e) {
      _error = 'حدث خطأ غير متوقع.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
