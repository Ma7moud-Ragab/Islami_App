import 'package:flutter/material.dart';
import '../models/reciter_model.dart';
import '../services/reciter_service.dart';

class ReciterProvider with ChangeNotifier {
  RecitersModel? _reciters;
  bool _isLoading = false;
  String? _error;

  RecitersModel? get reciters => _reciters;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchReciters() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final data = await ReciterService.fetchReciters();
      if (data != null) {
        _reciters = data;
      } else {
        _error = 'فشل في تحميل القراء. تحقق من الاتصال بالإنترنت.';
      }
    } catch (e) {
      _error = 'حدث خطأ غير متوقع.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
