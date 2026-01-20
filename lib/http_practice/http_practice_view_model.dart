import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpPracticeViewModel extends ChangeNotifier {
  List<String> _titles = [];
  List<String> get titles => _titles;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<void> fetchPosts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=10');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> dataList = jsonDecode(response.body);
        _titles = dataList.map((item) => item['title'] as String).toList();
      } else {
        _errorMessage = 'サーバーエラーが発生しました (コード: ${response.statusCode})';
      }
    } catch (e) {
      _errorMessage = '通信エラーが発生しました: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
