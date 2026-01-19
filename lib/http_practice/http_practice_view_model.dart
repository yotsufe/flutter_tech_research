import 'package:flutter/material.dart';

class HttpPracticeViewModel extends ChangeNotifier {
  String _displayText = '更新してください';
  bool _isLoading = false;

  String get displayText => _displayText;
  bool get isLoading => _isLoading;

  Future<void> fetchMessage() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _displayText = 'ViewModel連携成功';
    _isLoading = false;

    notifyListeners();
  }
}
