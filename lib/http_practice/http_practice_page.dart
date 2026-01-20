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
        appBar: AppBar(title: const Text('HTTP通信_Provider')),
        body: Consumer<HttpPracticeViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                Expanded(
                  child: _buildBody(viewModel),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      viewModel.fetchPosts();
                    },
                    child: const Text('10件取得する'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(HttpPracticeViewModel viewModel) {
    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 50),
            const SizedBox(height: 10),
            Text(
              viewModel.errorMessage!,
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    if (viewModel.titles.isEmpty) {
      return const Center(child: Text('データを取得してください'));
    }

    return ListView.builder(
      itemCount: viewModel.titles.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(viewModel.titles[index]),
          ),
        );
      },
    );
  }
}
