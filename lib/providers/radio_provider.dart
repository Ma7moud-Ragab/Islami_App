import 'package:flutter/material.dart';
import '../models/radio_model.dart';
import '../services/radio_service.dart';

class RadioProvider with ChangeNotifier {
  RadiosModel? _radios;
  bool _isLoading = false;
  String? _error;

  RadiosModel? get radios => _radios;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchRadios() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final data = await RadioService.fetchRadios();
      if (data != null) {
        _radios = data;
      } else {
        _error = 'فشل في تحميل الإذاعات. تحقق من الاتصال بالإنترنت.';
      }
    } catch (e) {
      _error = 'حدث خطأ غير متوقع.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
