import 'package:flutter/material.dart';

class HttpPracticePage extends StatefulWidget {
  const HttpPracticePage({super.key});

  @override
  State<HttpPracticePage> createState() => _HttpPracticePageState();
}

class _HttpPracticePageState extends State<HttpPracticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP通信'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text('データ表示'),
      ),
    );
  }
}
