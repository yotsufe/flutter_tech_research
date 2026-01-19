import 'package:flutter/material.dart';
import 'package:flutter_tech_research/http_practice/http_practice_view_model.dart';
import 'package:provider/provider.dart';

class HttpPracticePage extends StatelessWidget {
  const HttpPracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HttpPracticeViewModel(),
      child: Scaffold(
        appBar: AppBar(title: const Text('HTTP通信')),

        body: Consumer<HttpPracticeViewModel>(
          builder: (context, viewModel, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (viewModel.isLoading)
                    const CircularProgressIndicator()
                  else
                    Text(
                      viewModel.displayText,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      Provider.of<HttpPracticeViewModel>(context, listen: false).fetchMessage();
                    },
                    child: const Text('更新'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
