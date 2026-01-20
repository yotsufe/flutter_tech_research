import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class RiverpodPracticeState {
  final bool isLoading;
  final List<String> titles;
  final String? errorMessage;

  const RiverpodPracticeState({
    this.isLoading = false,
    this.titles = const [],
    this.errorMessage,
  });

  RiverpodPracticeState copyWith({
    bool? isLoading,
    List<String>? titles,
    String? errorMessage,
  }) {
    return RiverpodPracticeState(
      isLoading: isLoading ?? this.isLoading,
      titles: titles ?? this.titles,
      errorMessage: errorMessage,
    );
  }
}

class RiverpodPracticeNotifier extends Notifier<RiverpodPracticeState> {
  @override
  RiverpodPracticeState build() {
    return const RiverpodPracticeState();
  }

  Future<void> fetchPosts() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=10');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> dataList = jsonDecode(response.body);
        final titles = dataList.map((item) => item['title'] as String).toList();

        state = state.copyWith(
          isLoading: false,
          titles: titles,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'サーバーエラー: ${response.statusCode}',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '通信エラー: $e',
      );
    }
  }
}

final riverpodPracticeProvider =
NotifierProvider<RiverpodPracticeNotifier, RiverpodPracticeState>(() {
  return RiverpodPracticeNotifier();
});
